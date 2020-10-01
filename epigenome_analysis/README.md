# epigenome_analysis
This directory contains the data and scripts to analysis the epigenetic profiling of TEs
* **TE_bed/:** a directory containing bed files describing the genomic loci of each TE subfamily
* **macs2peaks/:** a directory containing bed files of ATAC-Seq peaks
* **macs2peaks/sample_info.txt:** the sample information of ATAC-Seq data
* **chromSize_hg38.txt:** a list of the length of each chromosome in the reference genome
* **script/batch_pipeline_peak_call.sh:** a shell script to call ATAC-Seq peaks
* **script/calc_enrichment_randomized.py:** calculates the fold enrichment of the overlaps between TEs and ATAC-Seq relative to random expectation.
usage:
```Bash
python2 script/calc_enrichment_randomized.py \  
          macs2_peaks/GSE92279_SSC1_peaks.narrowPeak \ #ATAC-Seq peak bed file
          TE_bed/LTR12C.txt \ #TE genomic position bed file
          chromSize_hg38.txt \ #chromosome length file 
          1000 \ #number of permutation
       > res_enrichment_LTR12C.GSE92279_SSC1_peaks.txt
```


## Dependencies
* Ubuntu 18.04.4 LTS
* python (2.7.17)
* SRA Toolkit (2.10.2)
* BWA (0.7.17)
* Picard (2.18.16)
* removeChrom.py (https://github.com/harvardinformatics/ATAC-seq/blob/master/atacseq/removeChrom.py)
* samtools (1.10)
* MACS2 (2.2.6)
* python2/subprocess (3.5.3)
* python2/numpy (1.14.3)
* python2/scipy (1.1.0)
* bedtools (2.27.0)
