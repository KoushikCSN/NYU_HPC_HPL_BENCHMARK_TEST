#!/bin/bash

#export SINGULARITY_BINDPATH=$SINGULARITY_BINDPATH,$(echo /usr/lib64/libgdrapi.so* /usr/lib64/librdmacm.so* /usr/bin/gdrcopy_* | sed -e 's/ /,/g')

singularity exec --nv \
--bind /state/partition1 \
/state/partition1/nvidia-hpc/hpc-benchmarks_23.10.sif \
/bin/bash
