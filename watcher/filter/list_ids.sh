#!/bin/bash

current_dir="$(dirname "$0")"

cat | \
    jq -f "$current_dir/instances.jq" | \
    jq -f "$current_dir/small.jq" | \
    jq -r -f "$current_dir/id.jq"
