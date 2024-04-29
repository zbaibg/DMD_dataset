#!/bin/bash
#SBATCH -p cpuq
#SBATCH --account=cpuq
#SBATCH -N 4
#SBATCH -t 24:00:00
#SBATCH --ntasks-per-node=16
#SBATCH -J dm

module purge
module load slurm
module load gcc/10.2.0
module use /data/groups/ping/zbai15/soft/modulefiles
module load zbai_openmpi/openmpi5.0.2_gcc10.2.0
module list
pwd; hostname; date

echo "Running program on $SLURM_JOB_NUM_NODES nodes with $SLURM_NTASKS total tasks, with each node getting $SLURM_NTASKS_PER_NODE running on cores."

MPICMD="mpirun -np $SLURM_NTASKS"

#DIRFS="/home/raullah/JDFTx/jdftx-jxu/build-FeynWann"
#DIRFS="/home/raullah/JDFTx/jdftx-1.7.0/build-FeynWann-DMD"
DIRFS="/data/groups/ping/zbai15/soft/DMD_Initialization/build-FeynWann/lindbladInit_for-DMD-4.5.6/"
${MPICMD} ${DIRFS}/init_for-DMD -i lindbladInit.in > lindbladInit.out

