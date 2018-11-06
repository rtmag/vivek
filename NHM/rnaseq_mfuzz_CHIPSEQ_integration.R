options(scipen=999)
library(gplots)
library(factoextra)
library(RColorBrewer)

vsd = readRDS("../NHM_vsd.rds")
vsd = vsd[,c(10:12,1:3,7:9,4:6)]

png("c1_mfuzz.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
gmt = read.table("../ct_1_rnaseq.txt",sep = "\t", head=F,stringsAsFactors=F)
sig_vsd = vsd[rownames(vsd) %in% gmt[,1],]
colnames(sig_vsd) = c("NHM","NHM","NHM","BRAF","BRAF","BRAF","CDKN2A","CDKN2A","CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A")
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))
  heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Cluster1 Genes",key.title="Gene expression",cexCol=.65,Colv=F,dendrogram="row",labRow = FALSE)
dev.off()

png("c2_mfuzz.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
gmt = read.table("../ct_2_rnaseq.txt",sep = "\t", head=F,stringsAsFactors=F)
sig_vsd = vsd[rownames(vsd) %in% gmt[,1],]
colnames(sig_vsd) = c("NHM","NHM","NHM","BRAF","BRAF","BRAF","CDKN2A","CDKN2A","CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A")
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))
  heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Cluster2 Genes",key.title="Gene expression",cexCol=.65,Colv=F,dendrogram="row",labRow = FALSE)
dev.off()

png("c3_mfuzz.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
gmt = read.table("../ct_3_rnaseq.txt",sep = "\t", head=F,stringsAsFactors=F)
sig_vsd = vsd[rownames(vsd) %in% gmt[,1],]
colnames(sig_vsd) = c("NHM","NHM","NHM","BRAF","BRAF","BRAF","CDKN2A","CDKN2A","CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A")
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))
  heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Cluster3 Genes",key.title="Gene expression",cexCol=.65,Colv=F,dendrogram="row",labRow = FALSE)
dev.off()

png("c4_mfuzz.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
gmt = read.table("../ct_4_rnaseq.txt",sep = "\t", head=F,stringsAsFactors=F)
sig_vsd = vsd[rownames(vsd) %in% gmt[,1],]
colnames(sig_vsd) = c("NHM","NHM","NHM","BRAF","BRAF","BRAF","CDKN2A","CDKN2A","CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A")
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))
  heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Cluster4 Genes",key.title="Gene expression",cexCol=.65,Colv=F,dendrogram="row",labRow = FALSE)
dev.off()

png("c5_mfuzz.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
gmt = read.table("../ct_5_rnaseq.txt",sep = "\t", head=F,stringsAsFactors=F)
sig_vsd = vsd[rownames(vsd) %in% gmt[,1],]
colnames(sig_vsd) = c("NHM","NHM","NHM","BRAF","BRAF","BRAF","CDKN2A","CDKN2A","CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A")
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))
  heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Cluster5 Genes",key.title="Gene expression",cexCol=.65,Colv=F,dendrogram="row",labRow = FALSE)
dev.off()

png("c6_mfuzz.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
gmt = read.table("../ct_6_rnaseq.txt",sep = "\t", head=F,stringsAsFactors=F)
sig_vsd = vsd[rownames(vsd) %in% gmt[,1],]
colnames(sig_vsd) = c("NHM","NHM","NHM","BRAF","BRAF","BRAF","CDKN2A","CDKN2A","CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A")
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))
  heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Cluster6 Genes",key.title="Gene expression",cexCol=.65,Colv=F,dendrogram="row",labRow = FALSE)
dev.off()

png("c7_mfuzz.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
gmt = read.table("../ct_7_rnaseq.txt",sep = "\t", head=F,stringsAsFactors=F)
sig_vsd = vsd[rownames(vsd) %in% gmt[,1],]
colnames(sig_vsd) = c("NHM","NHM","NHM","BRAF","BRAF","BRAF","CDKN2A","CDKN2A","CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A")
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))
  heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Cluster7 Genes",key.title="Gene expression",cexCol=.65,Colv=F,dendrogram="row",labRow = FALSE)
dev.off()

png("c8_mfuzz.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
gmt = read.table("../ct_8_rnaseq.txt",sep = "\t", head=F,stringsAsFactors=F)
sig_vsd = vsd[rownames(vsd) %in% gmt[,1],]
colnames(sig_vsd) = c("NHM","NHM","NHM","BRAF","BRAF","BRAF","CDKN2A","CDKN2A","CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A")
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))
  heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Cluster8 Genes",key.title="Gene expression",cexCol=.65,Colv=F,dendrogram="row",labRow = FALSE)
dev.off()

png("c9_mfuzz.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
gmt = read.table("../ct_9_rnaseq.txt",sep = "\t", head=F,stringsAsFactors=F)
sig_vsd = vsd[rownames(vsd) %in% gmt[,1],]
colnames(sig_vsd) = c("NHM","NHM","NHM","BRAF","BRAF","BRAF","CDKN2A","CDKN2A","CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A")
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))
  heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Cluster9 Genes",key.title="Gene expression",cexCol=.65,Colv=F,dendrogram="row",labRow = FALSE)
dev.off()

#######

