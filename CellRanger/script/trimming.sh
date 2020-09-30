#!/usr/bin/env bash

tail -n +2 ../input/Sample_Id.txt | xargs -n 1 -P 5 bash -c \
'
Id=${0}
mkdir -p ../output/fastq_trimmed/${Id}
cutadapt -j 3 -l 26 \
../input/fastq_gz/${Id}/${Id}_S1_L001_R1_001.fastq.gz \
> ../output/fastq_trimmed/${Id}/${Id}_S1_L001_R1_001.fastq
gzip ../output/fastq_trimmed/${Id}/${Id}_S1_L001_R1_001.fastq

cutadapt -j 3 -l 100 \
../input/fastq_gz/${Id}/${Id}_S1_L001_R2_001.fastq.gz \
> ../output/fastq_trimmed/${Id}/${Id}_S1_L001_R2_001.fastq
gzip ../output/fastq_trimmed/${Id}/${Id}_S1_L001_R2_001.fastq
'

