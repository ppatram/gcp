#!/bin/bash 
# this runs on the controller 
user=$1
exec > /tmp/$user.txt 2>&1
zone=$2
count=1
vmn=${user}vm${count}
ipn=${user}ip${count}
diskn=${user}disk${count}
datfile="/var/lib/docker/volumes/docker-lamp_php/_data/tmp/${user}"
tmpfile=$(mktemp /tmp/startup.XXXXX)
cp /var/lib/docker/volumes/docker-lamp_php/_data/custom-startup.sh $tmpfile
sed -i "s/__person__/$user/" $tmpfile

gcloud compute addresses create ${ipn} --zone $zone --ip-version IPV4
thisip=$(gcloud compute addresses list | grep -E "^$ipn" | awk '{print $2}')
gcloud compute instances create "${vmn}" \
		--zone "$zone" --address=$thisip --machine-type "n1-standard-2" \
		--boot-disk-size "40G" --boot-disk-type "pd-ssd" \
		--boot-disk-device-name "${diskn}" \
		--metadata-from-file=startup-script=$tmpfile

gcloud compute instances start "${vmn}" --zone $zone
thisip=$(gcloud compute instances describe $vmn --zone $zone |grep -i natip | cut -d: -f2 | tr -d ' ')

sed -i "s/,$/,$thisip/"  $datfile	

rm -f $tmpfile

