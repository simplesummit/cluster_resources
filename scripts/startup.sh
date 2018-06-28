#!/bin/bash

# startup script
# call like: startup.sh TIMEOUT


RESOURCES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
RESOURCES="$( dirname "$RESOURCES" )"

# default is 30 seconds
SLEEP_TIME="30"

if [ -n "$1" ]; then
    SLEEP_TIME="$1"
fi

# to wait for nodes to connect
# sleep $SLEEP_TIME

# this will write to the file `/tmp/connected.hostfile`
/usr/local/bin/python3 $RESOURCES/scripts/get_connected_nodes.py

# the currently working host files, of online nodes
WORKING_HOSTFILE="/tmp/connected.hostfile"

NUM_HOSTS="$(wc -l < $WORKING_HOSTFILE)"

echo connected hosts: $NUM_HOSTS


/usr/local/bin/python3 $RESOURCES/scripts/run_distributed.py --hostfile $WORKING_HOSTFILE -n $((6 * $NUM_HOSTS)) "/leconte/shared/bin/fractalexplorer -F -i 100 -T $RESOURCES/fonts/UbuntuMono.ttf -A RAIO_1GPU_1CPU"





