
# SETUP


## All Nodes

Do this on *master and worker nodes*:

Download the newest [jetpack installer](https://developer.nvidia.com/embedded/jetpack) on an Ubuntu 14.04 machine (this may require a virtual machine such as Virtual Box).

Follow [this guide](https://docs.nvidia.com/jetpack-l4t/2_2/content/developertools/mobile/jetpack/l4t/2.2/jetpack_l4t_install.htm).

Run it, and during the choosing of installation components, you can disable all options under `Host - Ubuntu`.

Then, install it


## Master Node

Do this on *just the master node*:

Log in as user `nvidia`

These may require sudo, the password for nvidia user of TX2s out of the box is `nvidia`

The standard directory for everything in this project is `/leconte/` on all machines, and this is not shared (because some things will be neccessary at boot).


So, first, create this directory `mkdir /leconte/`, and then clone this resources repository: `git clone http://github.com/ornl-leconte/cluster_resources`


From there, this repostitory includes a script to do most other set up, so run `./scripts/setup_MASTER.sh`


## Worker Nodes

Do this on all worker nodes:

Log in as user `nvidia`

These commands may require sudo

Create the leconte directory (`mkdir /leconte`)




