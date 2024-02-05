#!/bin/bash
# Parm Patram <ppatram@gmail.com>
# 2024-02-05
# This script will locate all disks,
# and print a delete command to the terminal
# If the disk is not being used,
# otherwise it will print the disk info
# project, name, user, zone, and type
# This script will not make any changes.
# It is suggested that the user
# carefully examine the DELETE commands
# to ensure the disk should be removed

IFS=$'\n'
for line in $(gcloud compute disks list --format json |  jq '.[] | "\(.name) \(.users[0]) \(.zone) \(.type) \(.sizeGb)"' | sed 's/"//g'); do
        #echo "line ::$line::"
        project=$(echo $line | cut -d "/"  -f7)
        size=$(echo $line | cut -d " "  -f5)
        disk=$(echo $line | cut -d " "  -f1)
        user=$(echo $line | cut -d " "  -f2 | sed 's|/|\n|g' | tail -1)
        zone=$(echo $line | cut -d " "  -f3 | sed 's|/|\n|g' | tail -1)
        type=$(echo $line | cut -d " "  -f4 | sed 's|/|\n|g' | tail -1)

        if [ "$user" == "null" ]; then
                echo "echo 'y' | gcloud compute disks delete $disk --zone $zone --project $project# type:$type, size:$size DELETE"
        else
                echo "KEEPING: project:$project; disk:$disk; user:$user; zone:$zone; type:$type; size:$size"
        fi
done
unset IFS
