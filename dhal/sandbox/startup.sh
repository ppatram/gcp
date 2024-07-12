#!/bin/bash
mkdir /var/run/sshd
# Set root password for SSH access (change 'your_password' to your desired password)
echo 'root:your_password' | chpasswd
sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
sed -i 's/^#PermitRootLogin/PermitRootLogin/' /etc/ssh/sshd_config
nohup /usr/sbin/sshd -D
