#!/bin/bash


LOGFILE="term_monitor.log"


function _loggeneric () {
    printf "%5s %s %-10s %s\n" "[$$]" "[$(date -u +"%F %T")]" "[$1]" "$2" | tee -a "$LOGFILE" >&2
}

function loginfo () {
    _loggeneric "INFO" "$1"
}

function logerr () {
    _loggeneric "ERROR" "$1"
}

function logwarn () {
    _loggeneric "WARNING" "$1"
}
