# Descriptions

Materials for detecting the expression levels of transposable elements in single cell RNA-sequencing (RNA-Seq) analysis.

This directory contains two sub directories and one file:
1. **input:** contains input files.
2. **script:** contains programs.
3. **reference.py:** is a file used to modify the STAR alignment parameters in Cell Ranger. The detail about this file is written below.

# Note

Cell Ranger (v3.1.0) was downloaded from the official website of 10X GENOMICS (https://support.10xgenomics.com/single-cell-gene-expression/software/overview/welcome). The STAR alignment parameters were modified by editing a file ("cellranger-3.1.0/cellranger-cs/3.1.0/lib/python/cellranger/reference.py", line 530-543).

