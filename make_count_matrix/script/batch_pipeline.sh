#!/usr/bin/env bash

<<COMMENTOUT

COMMENTOUT

#make and merge count matrices
R --vanilla --slave --args \
  ../cell_info.txt \
  ${cellRanger_dir_path} \
  data.count_matrix.merged.csv \
  < script/make_merged_count_matrix.R

#sum up TE locus-level counts and calculate TE family-level count 
calculate TE family-level 
python2 script/sum_TE_count.family.py \
        data.count_matrix.merged.csv \
        ../TE_Id.all.txt \
        > data.count_matrix.merged.TE_family_level.csv

#sum up TE locus-level counts and calculate TE subfamily-level count 
python2 script/sum_TE_count.subfamily.py \
        data.count_matrix.merged.csv \
        ../TE_Id.all.txt \
        > data.count_matrix.merged.TE_subfamily_level.csv
