singularity exec --nv /scratch/work/public/singularity/nvidia-hpc-benchmarks-23.5.sif /bin/bash

cp -rp /workspace/hpl-linux-x86_64/sample-dat/hpl.dat . 

#HPL

mpirun --mca btl smcuda,self -x UCX_TLS=sm,cuda,cuda_copy,cuda_ipc -np 2 hpl.sh --dat ./HPL.dat --cpu-affinity 0:0 --cpu-cores-per-rank 4 --gpu-affinity 0:1

#HPL-AI

mpirun --mca btl smcuda,self -x MELLANOX_VISIBLE_DEVICES="none" -x UCX_TLS=sm,cuda,cuda_copy,cuda_ipc -np 2 hpl.sh --xhpl-ai --dat ./HPL.dat --cpu-affinity 0:0 --cpu-cores-per-rank 4 --gpu-affinity 0:1

#hpl

mpirun --mca btl smcuda,self -x UCX_TLS=sm,cuda,cuda_copy,cuda_ipc -np 4 /workspace/hpl.sh --dat ./hpl.dat  

mpirun --mca btl smcuda,self -x UCX_TLS=sm,cuda,cuda_copy,cuda_ipc -np 4 /workspace/hpl.sh --dat ./hpl.dat  --cpu-affinity 0-39:0-39:40-79:40-79 

mpirun --mca btl smcuda,self -x UCX_TLS=sm,cuda,cuda_copy,cuda_ipc -np 4 /workspace/hpl.sh --dat ./hpl.dat  --cpu-affinity 0-31:0-31:32-63:32-63