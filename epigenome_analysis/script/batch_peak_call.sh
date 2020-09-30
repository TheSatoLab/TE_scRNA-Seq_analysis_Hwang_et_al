#!/usr/bin/env bash

<<COMMENTOUT
run_Id=<SRA run Id (e.g., SRR5099531)>
download_path=<download/cache area for downloaded files via SRA Toolkit>
index_path=<path of the index files for BWA>
files=<processed bam files (".unique.MarkDup.bam") for a ATAC-Seq sample, comma separated>
removeChrom.py=<please use "https://github.com/harvardinformatics/ATAC-seq/blob/master/atacseq/removeChrom.py">
COMMENTOUT

#make directory
mkdir fastq bam temp_files macs2


##download
prefetch ${run_Id}

##fastq-dump
fastq-dump --split-files -O './fastq' ${download_path}/sra/${run_Id}.sra

##mapping, removing chrM and multi-mapped reads
bwa mem -t 8 ${index_path} ./fastq/${run_Id}_1.fastq ./fastq/${run_Id}_2.fastq | \
  ${removeChrom.py} - - chrM | \
  samtools view -Shb -q 10 - \
  > ./bam/${run_Id}.temp


samtools sort -@ 8 \
                 -T temp_files \
                 -m 3G \
                 ./bam/${run_Id}.temp \
                 > ./bam/${run_Id}.unique.bam


##mark duplicated
java -Xms4g -Xmx4g -jar MarkDuplicates \
  I="./bam/${run_Id}.unique.bam" \
  O="./bam/${run_Id}.unique.MarkDup.bam" \
  M="temp_files/${run_Id}_dups.txt" \
  REMOVE_DUPLICATES=true

##peak call
mkdir ./macs2/${sample}
macs2 callpeak -t -q 0.05 -f BAMPE \
      -g hs --keep-dup all \
      -n ./macs2/${sample}/${sample}
