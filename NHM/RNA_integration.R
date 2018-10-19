##
NHM = readRDS("NHM_counts.rds")
BAPOMA = readRDS("bapoma_counts.rds")
LUWM = readRDS("lu_wm_counts.rds")

options(scipen=999)
library(DESeq2)

countData = cbind(NHM,BAPOMA,LUWM)

dds <- DESeqDataSetFromMatrix(
       countData = countData,
       colData = colData,
       design = ~ cells)

dLRT <- DESeq(dds, test="LRT", reduced=~1)
dLRT_vsd <- varianceStabilizingTransformation(dLRT)
dLRT_res <- results(dLRT)
dLRT_res$padj[is.na(dLRT_res$padj)]=1

pdf("Diagnostic_design_pca.pdf")
plotPCA(dLRT_vsd,ntop=60000,intgroup=c('cells'))
dev.off()
####
