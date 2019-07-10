#!/bin/sh
#$ -cwd           # Set the working directory for the job to the current directory
#$ -j y
#$ -pe smp 36      # Request 36 core
#$ -l h_rt=240:00:00 # Request 240 hour runtime
#$ -l h_vmem=10G   # Request 360GB RAM
#$ -l node_type=sm
#$ -l highmem
#$ -m e

kallisto index -i /data/scratch/btx225/rna_seq/data/assemblies/trinity_CD_single/Trinity.fasta /data/scratch/btx225/rna_seq/data/assemblies/trinity_CD_single/Trinity.fasta

