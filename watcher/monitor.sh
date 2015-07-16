#!/bin/bash

current_dir="$(dirname "$0")"
source "$current_dir/logfuncs.sh"

loginfo "Running Termination Monitor"

aws --profile mpcs ec2 describe-instances | \
    "$current_dir/filter/list_ids.sh" | \
    "$current_dir/filter/exclude_whitelist.sh" | \
    "$current_dir/terminate_ids.sh"
