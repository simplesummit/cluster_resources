#!/usr/bin/env python3
"""

outputs the connected nodes

"""

import os
import argparse
parser = argparse.ArgumentParser()

parser.add_argument("--output-hostfile", default="/tmp/connected.hostfile",help="Where to output the currently runnable hosts", type=str)

args = parser.parse_args()



def is_connected(node):
    # 2 second timeout
    return os.system("ping -c 1 -w1 " + node + " > /dev/null 2>&1") == 0

hostfile_path = "./configuration/whole_cluster.hostfile"

fp = open(hostfile_path)

hostfile_data = fp.read().split("\n")

fp.close()

hosts = [line.split() for line in hostfile_data]
hosts = filter(lambda h: len(h) > 0, hosts)
hosts = [h[0] for h in hosts]


output_file = open(args.output_hostfile, "w")

for host in hosts:
    if is_connected(host):
        output_file.write("%s slots=6\n" % (host))

output_file.close()




