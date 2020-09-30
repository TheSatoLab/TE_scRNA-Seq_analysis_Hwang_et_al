#!/usr/bin/env bash

PATH=$PATH:/usr/local/src/cellranger-3.1.0_For_TE
source /usr/local/src/cellranger-3.1.0_For_TE/sourceme.bash

/usr/local/src/cellranger-3.1.0_For_TE/cellranger mkref \
--genome=cellranger_ref_hg38_noAlt \
--fasta=../input/hg38_noAlt.fa \
--genes=../input/hg38_TE_noAlt_unique.gtf \
--nthreads=36 \
--memgb=100
mv cellranger_ref_hg38_noAlt ../output/

