#!/bin/sh
#$ -cwd           # Set the working directory for the job to the current directory
#$ -j y
#$ -pe smp 10      # Request 36 core
#$ -l h_rt=240:00:00 # Request 240 hour runtime
#$ -l h_vmem=10G   # Request 360GB RAM
#$ -l node_type=sm
#$ -l highmem
#$ -m e


for f1 in /data/scratch/btx225/rna_seq/raw_data/extracted/C*\_1.fq
do

 # Get path to reverse file replacing "_1.fq" by "_2.fq"
 f2=$( echo $f1 | sed 's/\_1.fq/\_2.fq/' )

 # Get file names without extension "fq" for both forward and reverse reads
 name_f1=$( echo $f1 | sed 's/..*\///' | sed 's/\.fq//' )
 name_f2=$( echo $name_f1 | sed 's/\_1/\_2/' )
 name_all=$( echo $name_f1 | sed 's/\_1//' )

 # Check we got the correct files by printing them out
 echo $name_f1 $name_f2 $name_all

 # Get species initials from start of name_f1 (e.g. CR or CD)
 spec_init=$( echo $name_f1 | sed 's/\_..*//' | sed 's/[0-9]//' )

 # Get path to folder with kallisto index
 index_path_prefix='/data/scratch/btx225/rna_seq/abundance/data/'
 index_path_suffix='_all/Trinity.fasta.fai'
 index_kall=$index_path_prefix$spec_init$index_path_suffix 

 # Get output directory name
 out_prefix='/data/scratch/btx225/rna_seq/abundance/data/'
 out_suffix='/quant_output/'
 out_dir=$out_prefix$name_all$out_suffix
 mkdir -p $out_dir

 # run kallisto
 kallisto quant -i $index_kall \
 -o $out_dir \
 $f1 $f2 

done
