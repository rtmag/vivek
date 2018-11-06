options(scipen=999)
library(gplots)
library(factoextra)
library(RColorBrewer)

vsd = readRDS("../NHM_vsd.rds")
vsd = vsd[,c(10:12,1:3,7:9,4:6)]

pdf("c1_mfuzz.pdf")
gmt = read.table("../ct_1_rnaseq.txt",sep = "\t", head=F,stringsAsFactors=F)
sig_vsd = vsd[rownames(vsd) %in% gmt[,1],]
colnames(sig_vsd) = c("NHM","NHM","NHM","BRAF","BRAF","BRAF","CDKN2A","CDKN2A","CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A")
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))
  heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Cluster1 Genes",key.title="Gene expression",cexCol=.65,Colv=F,dendrogram="row",labRow = FALSE)
dev.off()

pdf("c2_mfuzz.pdf")
gmt = read.table("../ct_2_rnaseq.txt",sep = "\t", head=F,stringsAsFactors=F)
sig_vsd = vsd[rownames(vsd) %in% gmt[,1],]
colnames(sig_vsd) = c("NHM","NHM","NHM","BRAF","BRAF","BRAF","CDKN2A","CDKN2A","CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A")
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))
  heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Cluster2 Genes",key.title="Gene expression",cexCol=.65,Colv=F,dendrogram="row",labRow = FALSE)
dev.off()

pdf("c3_mfuzz.pdf")
gmt = read.table("../ct_3_rnaseq.txt",sep = "\t", head=F,stringsAsFactors=F)
sig_vsd = vsd[rownames(vsd) %in% gmt[,1],]
colnames(sig_vsd) = c("NHM","NHM","NHM","BRAF","BRAF","BRAF","CDKN2A","CDKN2A","CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A")
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))
  heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Cluster3 Genes",key.title="Gene expression",cexCol=.65,Colv=F,dendrogram="row",labRow = FALSE)
dev.off()

pdf("c4_mfuzz.pdf")
gmt = read.table("../ct_4_rnaseq.txt",sep = "\t", head=F,stringsAsFactors=F)
sig_vsd = vsd[rownames(vsd) %in% gmt[,1],]
colnames(sig_vsd) = c("NHM","NHM","NHM","BRAF","BRAF","BRAF","CDKN2A","CDKN2A","CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A")
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))
  heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Cluster4 Genes",key.title="Gene expression",cexCol=.65,Colv=F,dendrogram="row",labRow = FALSE)
dev.off()

pdf("c5_mfuzz.pdf")
gmt = read.table("../ct_5_rnaseq.txt",sep = "\t", head=F,stringsAsFactors=F)
sig_vsd = vsd[rownames(vsd) %in% gmt[,1],]
colnames(sig_vsd) = c("NHM","NHM","NHM","BRAF","BRAF","BRAF","CDKN2A","CDKN2A","CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A")
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))
  heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Cluster1 Genes",key.title="Gene expression",cexCol=.65,Colv=F,dendrogram="row",labRow = FALSE)
dev.off()

pdf("c1_mfuzz.pdf")
gmt = read.table("../ct_1_rnaseq.txt",sep = "\t", head=F,stringsAsFactors=F)
sig_vsd = vsd[rownames(vsd) %in% gmt[,1],]
colnames(sig_vsd) = c("NHM","NHM","NHM","BRAF","BRAF","BRAF","CDKN2A","CDKN2A","CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A")
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))
  heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Cluster1 Genes",key.title="Gene expression",cexCol=.65,Colv=F,dendrogram="row",labRow = FALSE)
dev.off()

pdf("c1_mfuzz.pdf")
gmt = read.table("../ct_1_rnaseq.txt",sep = "\t", head=F,stringsAsFactors=F)
sig_vsd = vsd[rownames(vsd) %in% gmt[,1],]
colnames(sig_vsd) = c("NHM","NHM","NHM","BRAF","BRAF","BRAF","CDKN2A","CDKN2A","CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A")
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))
  heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Cluster1 Genes",key.title="Gene expression",cexCol=.65,Colv=F,dendrogram="row",labRow = FALSE)
dev.off()

pdf("c1_mfuzz.pdf")
gmt = read.table("../ct_1_rnaseq.txt",sep = "\t", head=F,stringsAsFactors=F)
sig_vsd = vsd[rownames(vsd) %in% gmt[,1],]
colnames(sig_vsd) = c("NHM","NHM","NHM","BRAF","BRAF","BRAF","CDKN2A","CDKN2A","CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A")
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))
  heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Cluster1 Genes",key.title="Gene expression",cexCol=.65,Colv=F,dendrogram="row",labRow = FALSE)
dev.off()

pdf("c9_mfuzz.pdf")
gmt = read.table("../ct_9_rnaseq.txt",sep = "\t", head=F,stringsAsFactors=F)
sig_vsd = vsd[rownames(vsd) %in% gmt[,1],]
colnames(sig_vsd) = c("NHM","NHM","NHM","BRAF","BRAF","BRAF","CDKN2A","CDKN2A","CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A")
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))
  heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Cluster9 Genes",key.title="Gene expression",cexCol=.65,Colv=F,dendrogram="row",labRow = FALSE)
dev.off()
