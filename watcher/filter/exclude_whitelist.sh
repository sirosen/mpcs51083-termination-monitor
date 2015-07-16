#!/bin/bash

current_dir="$(dirname "$0")"
source "$current_dir/../logfuncs.sh"

# read from stdin
candidate_instance_ids="$(cat -)"

# iterate over the potential instance ids, check the whitelist
# print the "good" ones to stdout
for id in $candidate_instance_ids;
do
    loginfo "Checking if $id is whitelisted"
    if [ "$(grep "$id" "$current_dir/id_whitelist")" != "" ];
    then
        loginfo "$id is whitelisted"
    else
        logwarn "Found an instance to terminate, $id"
        echo "$id"
    fi
done
