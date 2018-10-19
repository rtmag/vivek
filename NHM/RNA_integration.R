##
NHM = readRDS("NHM_counts.rds")
BAPOMA = readRDS("bapoma_counts_v27.rds")
LUWM = readRDS("lu_wm_counts.rds")

options(scipen=999)
library(DESeq2)

countData = cbind(NHM,BAPOMA,LUWM)

design<-data.frame(group=c("BRAF","BRAF","BRAF",
                "BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A",
                "CDKN2A","CDKN2A","CDKN2A",
                "NHM","NHM","NHM",
              "BAPOMA","BAP_N","BAPOMA","BAP_N","BAPOMA","BAP_N",
              "BAPOMA","BAP_N","BAPOMA","BAP_N","BAPOMA","BAP_N",
               "LU","LU","LU","WM","WM","WM") )

dds <- DESeqDataSetFromMatrix(
       countData = countData,
       colData = design,
       design = ~ group)

dLRT <- DESeq(dds, test="LRT", reduced=~1)
dLRT_vsd <- varianceStabilizingTransformation(dLRT)

pdf("Diagnostic_design_pca.pdf")
plotPCA(dLRT_vsd,ntop=60000,intgroup=c('group'))
dev.off()
########################################################################
########################################################################
########################################################################
########################################################################
countData = cbind(NHM,BAPOMA,BAPOMA)

colnames(countData) = make.names(colnames(countData),unique=T)


design<-data.frame(group=c("BRAF","BRAF","BRAF",
                "BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A",
                "CDKN2A","CDKN2A","CDKN2A",
                "NHM","NHM","NHM",
              "MS","MS","MS","MS","MS","MS",
              "MS","MS","MS","MS","MS","MS",
              "MS","MS","MS","MS","MS","MS",
              "MS","MS","MS","MS","MS","MS"
               ) )

dds <- DESeqDataSetFromMatrix(
       countData = countData,
       colData = design,
       design = ~ group)

dLRT <- DESeq(dds, test="LRT", reduced=~1)
dLRT_vsd <- varianceStabilizingTransformation(dLRT)

pdf("Diagnostic_design_pca_NHM_MATCHNEVI.pdf")
plotPCA(dLRT_vsd,ntop=60000,intgroup=c('group'))
dev.off()
####
