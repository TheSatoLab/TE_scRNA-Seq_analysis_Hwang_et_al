# epigenome_analysis
This directory contains data and scripts to analysis epigenetic profiling of TEs
* TE_bed/: a directory containing bed files describing the genomic loci of a TE subfamily of interest
* macs2peaks/: a directory containing bed files of ATAC-Seq peaks
* macs2peaks/sample_info.txt: sample information
* chromSize_hg38.txt: a list of the length of each chromosome in the reference genome
* script/batch_pipeline_peak_call.sh: a shell script to call ATAC-Seq peaks
* script/calc_enrichment_randomized.py: calculate the fold enrichment of the overlaps between TEs and ATAC-Seq relative to random expectation.
usage:
```Bash
python2 script/calc_enrichment_randomized.py \  
          macs2_peaks/GSE92279_SSC1_peaks.narrowPeak \ #ATAC-Seq peak bed file
          TE_bed/LTR12C.txt \ #TE genomic position bed file
          chromSize_hg38.txt \ #chromosome length file 
          1000 \ #number of permutation
       > res_enrichment_LTR12C.GSE92279_SSC1_peaks.txt
```
