# make_count_matrix
This directory contains scripts to make an expression count matrix of genes and TEs from CellRanger output files.

* script/batch_pipeline.sh: a shell script to run the following scripts
* script/make_merged_count_matrix.R: merge CellRanger outputs among runs and make a count matrix. In addition, this script removes genes or TEs with low expression levels (i.e., the genes or TEs detected only in >= 0.5% of the cells).
* script/sum_TE_count.family.py: sum up the counts of TE loci and calculate the counts for each TE family
* script/sum_TE_count.subfamily.py: sum up the counts of TE loci and calculate the counts for each TE subfamily

