#!/bin/sh
#$ -cwd           # Set the working directory for the job to the current directory
#$ -j y
#$ -pe smp 4      # Request 4 core
#$ -l h_rt=24:00:00 # Request 240 hour runtime
#$ -l h_vmem=10G   # Request 40GB RAM
#$ -l node_type=sm
#$ -l highmem
#$ -m e

kallisto index -i /data/scratch/btx225/rna_seq/assembly/data/trinity_CR_all/Trinity.fasta.fai /data/scratch/btx225/rna_seq/assembly/data/trinity_CR_all/Trinity.fasta

