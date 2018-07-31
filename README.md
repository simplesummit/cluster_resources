
# cluster_resources

These are scripts and such that are associated with the cluster.

## Setup

To set up the cluster, run `sudo ./scripts/setup_MASTER.sh` on the master Jetson Tx2, and then run the installation from `fractalexplorer` repo on each node. Set up SSH for MPI.

To run, start with `sudo ./scripts/get_connected_nodes.py --output-hostfile /tmp/connected.hostfile`


This creates a file with all currently connected nodes. For a list of all that will be attempted, see `./configuration/whole_cluster.hostfile`


To run the fractal explorer plugin on the nodes, download and untar it, cd into the directory and run `./configure --prefix=/leconte/shared/` and then `make install`. Now, run `./scripts/run_distributed.py --hostfile /tmp/connected.hostfile "/leconte/shared/bin/fractalexplorer -i 250 -T./fonts/UbuntuMono.ttf -A RATIO_2GPU_4CPU -v5 -F -C 7 -z 0.1 -q 2+1i"`









