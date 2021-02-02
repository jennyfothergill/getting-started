```
#!bash

localhost$ ssh username@remotehost
# get onto some computational node, using r2 as example
remotehost$ gpu-session
# set up resources
remotenode$ module load hoomd-blue/intel/mvapich2/2.1.5
# start notebook
remotenode$ unset XDG_RUNTIME_DIR
remotenode$ jupyter notebook --no-browser --port=8889
# leave this open and now start a new ssh session

```