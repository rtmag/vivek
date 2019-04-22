
options(scipen=999)
library(DESeq2)
library(gplots)
library(factoextra)
library(RColorBrewer)

  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(9))


vsd = readRDS("../crest_vsd.rds")

colnames(vsd) = c("NHM_1","NHM_2","NHM_3",
                 "VE_1","VE_2","VE_3",
                 "KO_1","KO_2","KO_3",
                 "VEKO_1","VEKO_2","VEKO_3",
                 "NCC")

sig = read.csv("NCC_signature.csv")
################################################################################################
# CREST 
sig_vsd = vsd[rownames(vsd) %in% as.character(sig[sig$Signature=="Neural crest-like",1]),]
sig_vsd = sig_vsd[apply(sig_vsd,1,sd)!=0,]
x = sig_vsd[,1:12]
x = x[apply(x,1,sd)!=0,]
pdf("CREST_SIGNATURE_NHM.pdf",height=10,width=3.5)
  heatmap.2(x,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="CREST Gene Signature",key.title="Gene expression",cexCol=.85,cexRow=.6,Colv = "none",dendrogram="row")
dev.off()
################################################################################################
# Undifferentiated-Neural crest-like 
sig_vsd = vsd[rownames(vsd) %in% as.character(sig[sig$Signature=="Undifferentiated-Neural crest-like",1]),]
sig_vsd = sig_vsd[apply(sig_vsd,1,sd)!=0,]
x = sig_vsd[,1:12]
x = x[apply(x,1,sd)!=0,]
pdf("Undiff_CREST_SIGNATURE_NHM.pdf",height=10,width=3.5)
  heatmap.2(x,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Undifferentiated-Neural crest-like Gene Signature",key.title="Gene expression",cexCol=.85,cexRow=.6,Colv = "none",dendrogram="row")
dev.off()
################################################################################################
# Melanocytic 
sig_vsd = vsd[rownames(vsd) %in% as.character(sig[sig$Signature=="Melanocytic",1]),]
sig_vsd = sig_vsd[apply(sig_vsd,1,sd)!=0,]
x = sig_vsd[,1:12]
x = x[apply(x,1,sd)!=0,]
pdf("Melanocytic_SIGNATURE_NHM.pdf",height=10,width=3.5)
  heatmap.2(x,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Melanocytic Gene Signature",key.title="Gene expression",cexCol=.85,cexRow=.6,Colv = "none",dendrogram="row")
dev.off()
################################################################################################
# Undifferentiated 
sig_vsd = vsd[rownames(vsd) %in% as.character(sig[sig$Signature=="Undifferentiated",1]),]
sig_vsd = sig_vsd[apply(sig_vsd,1,sd)!=0,]
x = sig_vsd[,1:12]
x = x[apply(x,1,sd)!=0,]
pdf("Undifferentiated_SIGNATURE_NHM.pdf",height=10,width=3.5)
  heatmap.2(x,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Undifferentiated Gene Signature",key.title="Gene expression",cexCol=.85,cexRow=.6,Colv = "none",dendrogram="row")
dev.off()
################################################################################################
# Undifferentiated 
sig_vsd = vsd[rownames(vsd) %in% as.character(sig[sig$Signature=="Neural crest-like-Transitory",1]),]
sig_vsd = sig_vsd[apply(sig_vsd,1,sd)!=0,]
x = sig_vsd[,1:12]
x = x[apply(x,1,sd)!=0,]
pdf("NCC_transitory_SIGNATURE_NHM.pdf",height=10,width=3.5)
  heatmap.2(x,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Neural crest-like-Transitory Gene Signature",key.title="Gene expression",cexCol=.85,cexRow=.6,Colv = "none",dendrogram="row")
dev.off()
