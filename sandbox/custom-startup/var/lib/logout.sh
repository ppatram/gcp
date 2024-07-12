#!/bin/bash

cat /dev/null > /var/lib/logout.log
exec > /var/lib/logout.log 2>&1
tmout=29
shout=289
sleep=60
tomins=0
totmins=0

echo "Starting up at $(date). Login tmout: $tmout; Server tmout: $shout; Sleep: $sleep."

while(true); do
	let tomins=$tomins+1
	let totmins=$totmins+1
	whoy=$(/usr/bin/w | grep -vE '^USER|^\s*[0-9]')
	if [ "$whoy" ]; then
		tomins=0
		echo "Logins at $(date):"
		echo "$whoy"
	fi
	echo UTMOUT:$tomins/TOT:$totmins
	if [ $tomins -gt $tmout ]; then
		echo "Shutting down out for user timeout $tmout at $(date)."
		/sbin/shutdown -h now
	fi	
	if [ $totmins -gt $shout ]; then
		# shutdown the server
		echo "Shutdown at $(date) for total time $shout"
		/sbin/shutdown -h now
	fi
	sleep $sleep
done
