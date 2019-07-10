#!/bin/sh
#$ -cwd           # Set the working directory for the job to the current directory
#$ -j y
#$ -pe smp 36      # Request 36 core
#$ -l h_rt=240:00:00 # Request 240 hour runtime
#$ -l h_vmem=10G   # Request 360GB RAM
#$ -l node_type=sm
#$ -l highmem
#$ -m e

mkdir /data/scratch/btx225/rna_seq/data/abundance/output_single_test

kallisto quant -i /data/scratch/btx225/rna_seq/data/abundance/Trinity.fasta.idx -o /data/scratch/btx225/rna_seq/data/abundance/output_single_test /data/scratch/btx225/rna_seq/data/raw_data/extracted/raw_data/CD1_C_1.fq /data/scratch/btx225/rna_seq/data/raw_data/extracted/raw_data/CD1_C_2.fq 

