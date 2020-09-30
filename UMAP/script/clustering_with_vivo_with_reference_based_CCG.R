#!/usr/bin/env R 

library(Seurat)
library(ggplot2)
library(tidyverse)

#read metadata
TE.info.name <-'../TE_Id.all.txt'
TE.info <- read.table(TE.info.name,header=T)
TE.info <- unique(TE.info[,c("TE_group","TE_subgroup")])

cell.info.name <- '../cell_info.txt'
cell.info <- read.table(cell.info.name,header=T)
cell.info <- cell.info[cell.info$germ == 1,]


#read vivo data

data.vivo.name <- 'count_matrix_data/vivo/data.merged.count.subfamily.csv' 
data.vivo <- read.csv(data.vivo.name,header=T,row.names=1,check.names=F)
colnames(data.vivo) <- gsub('\\-1','',colnames(data.vivo))

data.vivo <- data.vivo[,
                       colnames(data.vivo) %in% cell.info$cell_Id]


#read vitro data
data.vitro.name <- '../count_matrix_data/vitro/data.merged.vitro.count.subfamily.csv'
data.vitro <- read.csv(data.vitro.name,header=T,row.names=1,check.names=F)
colnames(data.vitro) <- gsub('\\-1','',colnames(data.vitro))

data.vitro <- data.vitro[,
                       colnames(data.vitro) %in% cell.info$cell_Id]


#merge vitro and vivo data
common_genes.v <- intersect(rownames(data.vitro),rownames(data.vivo))

data.vivo <- data.vivo[common_genes.v,]
data.vitro <- data.vitro[common_genes.v,]

data <- cbind(data.vitro,data.vivo)

col.df <- data.frame(col_Id = 1:(ncol(data)),
                     cell_Id = c(colnames(data))
                     )
col.df <- merge(col.df,cell.info,by="cell_Id")
col.df <- col.df[order(col.df$col_Id),]


data.seurat <- CreateSeuratObject(counts = data, project = "data", min.cells = 1, min.features = 1)

data.seurat@meta.data$cell_type <- col.df$cell_type
data.seurat@meta.data$Run <- col.df$Run

data.seurat <- PercentageFeatureSet(data.seurat, pattern = "^MT-", col.name = "percent.mt")
data.seurat <- SCTransform(data.seurat, vars.to.regress = "percent.mt")


#extract TE expression level
data.seurat.TE <- subset(data.seurat, features = TE.info$TE_subgroup)
data.seurat.TE <- FindVariableFeatures(data.seurat.TE, selection.method = "vst", nfeatures = 100)


#clustering, dimension reduction
all.TEs <- rownames(data.seurat.TE)
data.seurat.TE <- ScaleData(data.seurat.TE, features = all.TEs)
data.seurat.TE <- RunPCA(data.seurat.TE, features = VariableFeatures(object = data.seurat.TE))
ElbowPlot(data.seurat.TE)

#UMAP
data.seurat.TE <- RunUMAP(data.seurat.TE, dims = 1:10)



#plot UMAP
col.v <- c("#C4D3A6","#669900","#996600","#FFCC33","#FF66FF","#FF3333","#00CCFF","#800080")
names(col.v) <- c("iPSCs","iMeLCs","PGCLCs","pmPGCLCs","TCs","T1LCs","pmPGCs","T1Cs")


pdf.name <- 'UMAP.cell_type.vivo_vitro.merged.SCT.pdf'
pdf(pdf.name,width=7,height=4)
p1 <- DimPlot(data.seurat.TE, reduction = "umap", group.by = "cell_type", cols = col.v,pt.size=0.1)
plot(p1)
dev.off()

