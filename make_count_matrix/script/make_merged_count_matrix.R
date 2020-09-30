#!/usr/bin/env R

library(Seurat)

args <- commandArgs(trailingOnly=T)

percentile_99_5 <- function(x) {quantile(x,0.995)}

#arguments
cell.info.name <- args[1]
cellRanger_dir_path <- args[2]
out.name <- args[3]


cell.info <- read.table(cell.info.name,header=T,sep="\t")

lib.v <- as.character(unique(cell.info$Run))

lib <- lib.v[1]

cell.info.interest <- cell.info[cell.info$Run == lib,]

data1.dir.name <- paste(cellRanger_dir_path,lib,"outs/filtered_feature_bc_matrix",sep="/")
print(data1.dir.name)

data1 <- Read10X(data1.dir.name)
data1 <- CreateSeuratObject(counts = data1, project = "spermatogenesis", min.cells = 3, min.features = 1)
data1 <- subset(data1, cells = as.character(cell.info.interest$barcode))


data.v <- c()
for(lib in lib.v[2:length(lib.v)]){

cell.info.interest <- cell.info[cell.info$Run == lib,]

data.dir.name <- paste(cellRanger_dir_path,lib,"outs/filtered_feature_bc_matrix",sep="/")
print(data.dir.name)
data <- Read10X(data.dir.name)
data <- CreateSeuratObject(counts = data, project = "spermatogenesis", min.cells = 3, min.features = 1)
data <- subset(data, cells = as.character(cell.info.interest$barcode))
data.v <- c(data.v,data)
}

data.merged <- merge(data1, y = data.v, add.cell.ids = lib.v, project = "spermatogenesis")

gene.cell <- nrow(data.merged@meta.data)
n.cells.per.gene <- Matrix::rowSums(x = GetAssayData(object = data.merged, slot = "data")>0)
n.cells.per.gene <- n.cells.per.gene[n.cells.per.gene>gene.cell*0.005]

data.merged <- subset(data.merged,features = names(n.cells.per.gene))
data.merged <- GetAssayData(object = data.merged, slot = "data")

write.csv(data.merged,out.name,row.names=T,quote=F)

