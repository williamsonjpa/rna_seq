#!/bin/sh
#$ -cwd           # Set the working directory for the job to the current directory
#$ -j y
#$ -pe smp 10      # Request 36 core
#$ -l h_rt=240:00:00 # Request 240 hour runtime
#$ -l h_vmem=10G   # Request 360GB RAM
#$ -l node_type=sm
#$ -l highmem
#$ -m e


kallisto quant -i /data/scratch/btx225/rna_seq/abundance/data/CR_all/Trinity.fasta.fai -o /data/scratch/btx225/rna_seq/abundance/data/CR_all/output/CR_all_kallisto_output /data/scratch/btx225/rna_seq/raw_data/extracted/CR_left.fq /data/scratch/btx225/rna_seq/raw_data/extracted/CR_right.fq 

