#!/usr/bin/env bash

python script/calc_enrichment_randomized.py \
       macs2_peaks/GSE92279_SSC1_peaks.narrowPeak \
       TE_bed/LTR12C.txt \
       chromSize_hg38.txt \
       1000 \
       > res_enrichment_LTR12C.GSE92279_SSC1_peaks.txt





