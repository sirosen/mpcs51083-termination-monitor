#!/bin/bash

current_dir="$(dirname "$0")"
source "$current_dir/logfuncs.sh"

# read from stdin
instance_ids="$(cat -)"

loginfo "Will try to terminate the follwing ids: $(echo -n "$instance_ids" | tr '\n' ',')"

# iterate over the instance ids and terminate them
for id in $instance_ids;
do
    loginfo "Attempting to terminate $id"
    out="$(aws --profile mpcs ec2 terminate-instances --dry-run --instance-ids "$id" 2>&1)"
    rc=$?
    if [ $rc -ne 0 ];
    then
        logerr "Could not terminate $id! Output: $out"
    else
        loginfo "Successfully terminated $id"
    fi
done
