#!/bin/bash
person="__person__"
useradd -m -g google-sudoers -s /bin/bash $person

mkdir -p /home/$person/.ssh
echo 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMt826mPwiNbBQC4QJL9o3s18LxkLsh5p/r/r98nR95s ltimindtree\10738005@C2L40308HL' > /home/$person/.ssh/authorized_keys
chown -R $person:google-sudoers /home/$person/.ssh
chmod 700  /home/$person/.ssh
chmod 600 /home/$person/.ssh/authorized_keys
chattr +i /home/$person/.ssh/authorized_keys

cat << EOF > /etc/systemd/system/logout.service
[Unit]
Description=Logout Server
After=network.target auditd.service

[Service]
Restart=on-failure
RestartSec=5s
ExecStart=/var/lib/logout.sh 29 289 60

[Install]
WantedBy=multi-user.target
Alias=lamp.service
EOF


# logout script
cat << EOF > /var/lib/logout.sh
#!/bin/bash

cat /dev/null > /var/lib/logout.log
exec > /var/lib/logout.log 2>&1
tmout=$1
shout=$2
sleep=$3
tomins=0
totmins=0

echo "Starting up at \$(date). Login tmout: \$tmout; Server tmout: \$shout; Sleep: \$sleep."

while(true); do
	let tomins=\$tomins+1
	let totmins=\$totmins+1
	whoy=\$(/usr/bin/w | grep -vE '^USER|^\s*[0-9]')
	if [ "\$whoy" ]; then
		tomins=0
		echo "Logins at \$(date):"
		echo "\$whoy"
	fi
	echo UTMOUT:\$tomins/TOT:\$totmins
	if [ \$tomins -gt \$tmout ]; then
		echo "Shutting down out for user timeout \$tmout at \$(date)."
		/sbin/shutdown -h now
	fi	
	if [ \$totmins -gt \$shout ]; then
		# shutdown the server
		echo "Shutdown at \$(date) for total time \$shout"
		/sbin/shutdown -h now
	fi
	sleep \$sleep
done
EOF

chmod 755 /var/lib/logout.sh
systemctl enable --now logout.service
