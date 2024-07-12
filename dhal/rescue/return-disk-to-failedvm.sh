#!/bin/bash
# The purpose of this script is to re-attach 
# the boot disk to a failed instance
# after recovery operations from
# a surrogate instance

echo "Instance name of failed vm: "
read FAILEDVM
read "Name of the boot disk on failed vm: "
read BADDISK
echo "Enter region (note, both vms must be in same region): "
read REGION
echo "Instance name of rescue vm: "
read RESCUEVM

echo "this might give an error if the instance is already stopped"
gcloud compute instances stop ${FAILEDVM} --zone ${REGION}
gcloud compute instances detach-disk ${RESCUEVM} --zone ${REGION} --disk=${BADDISK}
gcloud compute instances attach-disk ${FAILEDVM} --zone ${REGION} --disk ${BADDISK} --boot 
gcloud compute instances start ${FAILEDVM} --zone ${REGION}
echo
echo
echo
echo "The serial console  will open so you can verify the
machine does boot. 
To break out of the serial console 
type [ENTER]
then ~.
Hit any key to continue: "
echo
read junk

gcloud compute connect-to-serial-port ${FAILEDVM} --zone ${REGION}


echo
echo
echo
echo "If no errors, your boot disk ${BADDISK} should
be attached to ${FAILEDVM}, and hopefully boots again."
echo
echo
echo
