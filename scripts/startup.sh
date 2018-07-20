#!/bin/bash

# startup script
# call like: startup.sh TIMEOUT


RESOURCES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
RESOURCES="$( dirname "$RESOURCES" )"

BIN_PYTHON="$(which python3)"


# default is 30 seconds
SLEEP_TIME="30"

if [ -n "$1" ]; then
    SLEEP_TIME="$1"
fi

# to wait for nodes to connect
# sleep $SLEEP_TIME

# this will write to the file `/tmp/connected.hostfile`

if [ -z "$2" ]; then
    $BIN_PYTHON $RESOURCES/scripts/get_connected_nodes.py
fi

# the currently working host files, of online nodes
WORKING_HOSTFILE="/tmp/connected.hostfile"

NUM_HOSTS="$(wc -l < $WORKING_HOSTFILE)"

echo connected hosts: $NUM_HOSTS


$BIN_PYTHON $RESOURCES/scripts/run_distributed.py --hostfile $WORKING_HOSTFILE "sudo $RESOURCES/scripts/jetson_clocks.sh --restore $RESOURCES/configuration/gpu_max.clocksettings"



$BIN_PYTHON $RESOURCES/scripts/run_distributed.py --hostfile $WORKING_HOSTFILE  "/leconte/shared/bin/fractalexplorer -F -i 100 -v 4 "





