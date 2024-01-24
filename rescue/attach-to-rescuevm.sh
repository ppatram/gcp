#!/bin/bash
# The purpose of this script is to detach 
# the boot disk from a non-bootable instance
# and attach it to a running instance
# so a repair can be attempted.
# It is sad that the GCP serial console
# does not (YET???) provide an interactive
# console session when the instance fails to
# boot. 

echo "Instance name of failed vm: "
read FAILEDVM
read "Name of the boot disk on failed vm: "
read BADDISK
echo "Enter region (note, both vms must be in same region): "
read REGION
echo "Instance name of rescue vm: "
read RESCUEVM


gcloud compute instances stop ${FAILEDVM} --zone ${REGION}

gcloud compute instances detach-disk ${FAILEDVM} --zone ${REGION} --disk=${BADDISK}
gcloud compute instances attach-disk example-${FAILEDVM} --zone ${REGION} --disk ${BADDISK} 

echo
echo
echo
echo "If no errors, your boot disk ${BADDISK} from ${FAILEDVM}
is now attached to ${RESCUEVM}"
echo
echo
echo
