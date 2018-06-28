#!/usr/bin/env python3

"""

Runs a command on different nodes

"""
import subprocess
import argparse
parser = argparse.ArgumentParser()

parser.add_argument("--hostfile", default="./configuration/whole_cluster.hostfile",help="Hostfile to run with (default is whole_cluster.hostfile)", type=str)

parser.add_argument("-n", default=None, help="How many processes to run per node", type=int)

parser.add_argument("command", help="the command to execute", type=str)

args = parser.parse_args()

def runcmd(cmd):
    return subprocess.run(['/bin/bash', '-c', mpi_command]).returncode


mpi_command = "mpirun -mca plm_rsh_no_tree_spawn 1 --hostfile %s" % (args.hostfile)

if args.n is not None:
    mpi_command = "%s -n %s" % (mpi_command, args.n)

mpi_command = "%s \"%s\"" % (mpi_command, args.command)


print (mpi_command)
print ("exited with code:" + str(runcmd(mpi_command)))


