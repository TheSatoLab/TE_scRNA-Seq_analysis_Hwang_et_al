# TE_scRNA-Seq_analysis_Hwang_et_al
Establishment of spermatogonia throughout the fetal and postnatal period is essential for production of spermatozoa and male fertility. Here, we established a protocol for in vitro reconstitution of human prospermatogonial specification whereby human primordial germ cell (PGC)-like cells (hPGCLCs) differentiated from human induced pluripotent stem cells were further induced into mitotic-prospermatogonia-like cells (MLCs) and transitional 1-prospermatogonia-like cells (T1LCs) using long-term cultured xenogeneic reconstituted testes. Single cell RNA-sequencing (scRNA-Seq) was used to delineate the lineage trajectory leading to T1LCs, which closely resemble human T1-prospermatogonia in vivo and exhibited gene expression related to spermatogenesis and diminished proliferation, a hallmark of quiescent T1 prospermatogonia. Notably, this system enabled us to visualize the dynamic and stage-specific regulation of transposable elements (TEs) during human prospermatogonial specification.  

This is a repository for the scRNA-Seq analysis to quantify the expression level of TEs.  

This repository contains the following directories and files:
* make_count_matrix: contains scripts to make expression count matrix from CellRanger outputs
* epigenome_analysis: contains scripts and data to characterize the epigenetic activity of TEs
* UMAP: contains a script to perform dimension reduction analysis using UMAP
* count_matrix_data: contains expression count matrices for genes and TEs
* TE_Id.all.txt: the list of TE locus analyzed in this study
* cell_info.txt: the list of single cells analyzed in this study
