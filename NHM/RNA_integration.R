options(scipen=999)
library(DESeq2)
library(gplots)
library(factoextra)
library(RColorBrewer)

##

NHM = readRDS("NHM_counts.rds")
BAPOMA = readRDS("bapoma_counts_v27.rds")
LUWM = readRDS("lu_wm_counts.rds")

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
vsd = assay(dLRT_vsd)

pdf("Diagnostic_design_pca_NHM_MATCHNEVI.pdf")
plotPCA(dLRT_vsd,ntop=60000,intgroup=c('group'))
dev.off()
######################################################################################################################################
######################################################################################################################################

NHM = readRDS("NHM_counts.rds")
LUWM = readRDS("lu_wm_counts.rds")

options(scipen=999)
library(DESeq2)

countData = cbind(NHM,LUWM)
########################################################################
design<-data.frame(group=c("BRAF","BRAF","BRAF",
                "BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A",
                "CDKN2A","CDKN2A","CDKN2A",
                "NHM","NHM","NHM",
               "LU","LU","LU","WM","WM","WM") )

dds <- DESeqDataSetFromMatrix(
       countData = countData,
       colData = design,
       design = ~ group)

dLRT <- DESeq(dds, test="LRT", reduced=~1)
dLRT_vsd <- varianceStabilizingTransformation(dLRT)
########################################################################

dds = DESeqDataSetFromMatrix(countData = NHM[,c(10:12,1:3)],
                             colData = data.frame(group = c("NHM","NHM","NHM","BRAF","BRAF","BRAF") ), 
                             design = ~ group )
dds = DESeq(dds)
dds_res = results(dds,contrast=c("group","BRAF","NHM"))

sig_vsd = vsd[which(abs(dds_res$log2FoldChange)>1 & dds_res$padj<0.05),]
rownames(sig_vsd) = c()
colors = colorRampPalette(c("green","black","red"))(20)

png("NHM_vs_BRAF.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
  heatmap.2(as.matrix(sig_vsd),col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="NHM vs BRAF",key.title="Gene expression",cexCol=.9,cexRow=.9,labRow = FALSE)
dev.off()
########################################################################

dds = DESeqDataSetFromMatrix(countData = NHM[,c(10:12,4:6)],
                             colData = data.frame(group = c("NHM","NHM","NHM","BRAF","BRAF","BRAF") ), 
                             design = ~ group )
dds = DESeq(dds)
dds_res = results(dds,contrast=c("group","BRAF","NHM"))

sig_vsd = vsd[which(abs(dds_res$log2FoldChange)>1 & dds_res$padj<0.05),]
rownames(sig_vsd) = c()
colors = colorRampPalette(c("green","black","red"))(20)

png("NHM_vs_BC.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
  heatmap.2(as.matrix(sig_vsd),col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="NHM vs BRAF+CDKN2A",key.title="Gene expression",cexCol=.9,cexRow=.9,labRow = FALSE)
dev.off()
########################################################################

