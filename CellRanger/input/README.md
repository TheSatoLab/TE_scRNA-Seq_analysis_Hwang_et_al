# Descriptions

This directory contains input files to make count matrix of scRNA-Seq data.

## fastq_gz
This directory contains raw sequence data.
The files are not in this repository because of file size restrictions.

## hg38_noAlt\.fa
The human reference genome sequence (hg38)
The sequence containing "Alt" in the chromosome name has been deleted.
This file is not in this repository because of file size restrictions.

## hg38_TE_noAlt_unique\.gtf
For the gene transcript model, GENCODE version 22 (for GRCh38/hg38) obtained from the GENCODE website (http://www.gencodegenes.org/) was used. For the TE transcript model, the RepeatMasker output file (15-Jan-2014; for GRCh38/hg38) obtained from the UCSC genome browser (http://genome.ucsc.edu/) was used. For the gene model, transcripts with the flag “retained intron” were excluded. For the TE model, TE loci with low reliability scores (i.e., Smith-Waterman score < 2,500) were excluded. Additionally, the regions of TE loci overlapping with the gene transcripts were also excluded. A gene-TE transcript model was generated by concatenating the gene and TE models. Genes and TEs located on ALT contigs were removed.

## Sample_Id\.txt
This file contains sample IDs.

