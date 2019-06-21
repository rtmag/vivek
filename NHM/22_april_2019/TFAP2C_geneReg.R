# NHM VS 32T
countData=readRDS("NHM_counts.rds")
options(scipen=999)
library(DESeq2)
library(gplots)
library(factoextra)
library(RColorBrewer)

 design <- data.frame( group = c( rep("NHM", 3), rep("BC", 3) ) )
  dds <- DESeqDataSetFromMatrix(countData = countData[, c(4:6, 10:12) ], colData = design, design = ~ group )
  dds <- DESeq(dds)
  dds_res = results(dds,contrast=c("group","BC","NHM"))
  
upbc=dds_res[which(dds_res$log2FoldChange>1 & dds_res$padj<0.05),]

remap = read.table("~/CSI/vivek/TFAP2C/genes.tf")
remap[,1]
rownames(upbc) %in% remap[,1]

target = rownames(upbc)[rownames(upbc) %in% remap[,1]]

write.table(target,"TFAP2C_targets_ChipSeq_UpregulatedInNBC_DownRegulatedinNHM.txt",sep="\t",quote=F,row.names=F,col.names=F)

