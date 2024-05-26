#!/bin/bash 
# this runs on the controller 
user=$1
exec > /tmp/$user.txt 2>&1
zone=$2
vmn=${user}-vm1
ipn=${user}-ip
diskn=${user}-disk
datfile="/var/lib/docker/volumes/docker-lamp_php/_data/tmp/${user}"
tmpfile=$(mktemp /tmp/startup.XXXXX)
cp /var/lib/docker/volumes/docker-lamp_php/_data/custom-startup.sh $tmpfile
sed -i "s/__person__/$user/" $tmpfile

# get vm ip
thisip=$(gcloud compute instances describe $vmn --zone us-east1-d|grep -i natip | cut -d: -f2)

if [ "$thisip" ]; then
	echo "Server already there, let's start it"
	gcloud compute instances start $vmn --zone $zone
else

	gcloud compute addresses create ${user}-ip --zone $zone --ip-version IPV4
	thisip=$(gcloud compute addresses list | grep -E "^$ipn" | awk '{print $2}')
	gcloud compute instances create "${user}-vm" \
		--zone "$zone" --address=$thisip --machine-type "n1-standard-2" \
		--boot-disk-size "40G" --boot-disk-type "pd-ssd" \
		--boot-disk-device-name "${user}-disk" \
		--metadata-from-file=startup-script=$tmpfile
fi	
sed -i "s/,$/,$thisip/" $datfile	
rm -f $tmpfile

