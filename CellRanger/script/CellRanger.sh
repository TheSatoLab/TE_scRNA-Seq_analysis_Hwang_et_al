#!/usr/bin/env bash

mkdir -p ../output/CellRanger
tail -n +2 ../input/Sample_Id.txt | xargs -n 1 -P 3 bash -c \
'
Id=${0}
PATH=$PATH:/usr/local/src/cellranger-3.1.0_For_TE
source /usr/local/src/cellranger-3.1.0_For_TE/sourceme.bash

cd ../output/CellRanger
/usr/local/src/cellranger-3.1.0_For_TE/cellranger count \
--id=${Id} \
--fastqs=../fastq_trimmed/${Id} \
--sample=${Id} \
--transcriptome=../cellranger_ref_hg38_noAlt \
--expect-cells=100 \
--localcores=16 \
--localmem=42

cd ../../script
'

