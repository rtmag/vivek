options(scipen=999)
library(gplots)
library(factoextra)
library(RColorBrewer)

vsd = readRDS("NHM_vsd.rds")

c1 = read.table("c1_ct5_diff_se_geneName.txt",stringsAsFactors=F)
c2 = read.table("c2_ct5_diff_se_geneName.txt",stringsAsFactors=F)
c3 = read.table("c3_ct5_diff_se_geneName.txt",stringsAsFactors=F)
c4 = read.table("c4_ct5_diff_se_geneName.txt",stringsAsFactors=F)
c5 = read.table("c5_ct5_diff_se_geneName.txt",stringsAsFactors=F)

sig_vsd = rbind(vsd[rownames(vsd) %in% c1[,1],],
vsd[rownames(vsd) %in% c2[,1],],
vsd[rownames(vsd) %in% c3[,1],],
vsd[rownames(vsd) %in% c4[,1],],
vsd[rownames(vsd) %in% c5[,1],])


colnames(sig_vsd) = c("BRAF","BRAF","BRAF","BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A","CDKN2A","CDKN2A","CDKN2A","NHM","NHM","NHM")
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))
png("se_heatmap.png")
heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="",key.title="Gene expression",cexCol=.65,dendrogram='none',     
Rowv=FALSE,
Colv=FALSE)
dev.off()

#########################
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))

pdf("cluster_1_genes.pdf")
sig_vsd = vsd[rownames(vsd) %in% c1[,1],c(10,11,12,1,2,3,7,8,9,4,5,6)]
rownames(sig_vsd) = NULL
colnames(sig_vsd) = c("NHM","NHM","NHM","BRAF","BRAF","BRAF","CDKN2A","CDKN2A","CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A")
sig_vsd= sig_vsd[apply(sig_vsd,1,sd)!=0,]
heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Cluster 1 Genes",key.title="Gene expression",cexCol=.65,cexRow=.2,Colv=FALSE,dendrogram="row",labRow = FALSE)
dev.off()

pdf("cluster_2_genes.pdf")
sig_vsd = vsd[rownames(vsd) %in% c2[,1],c(10,11,12,1,2,3,7,8,9,4,5,6)]
rownames(sig_vsd) = NULL
colnames(sig_vsd) = c("NHM","NHM","NHM","BRAF","BRAF","BRAF","CDKN2A","CDKN2A","CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A")
sig_vsd= sig_vsd[apply(sig_vsd,1,sd)!=0,]
heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Cluster 2 Genes",key.title="Gene expression",cexCol=.65,cexRow=.2,Colv=FALSE,dendrogram="row",labRow = FALSE)
dev.off()

pdf("cluster_3_genes.pdf")
sig_vsd = vsd[rownames(vsd) %in% c3[,1],c(10,11,12,1,2,3,7,8,9,4,5,6)]
rownames(sig_vsd) = NULL
colnames(sig_vsd) = c("NHM","NHM","NHM","BRAF","BRAF","BRAF","CDKN2A","CDKN2A","CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A")
sig_vsd= sig_vsd[apply(sig_vsd,1,sd)!=0,]
heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Cluster 3 Genes",key.title="Gene expression",cexCol=.65,cexRow=.2,Colv=FALSE,dendrogram="row",labRow = FALSE)
dev.off()

pdf("cluster_4_genes.pdf")
sig_vsd = vsd[rownames(vsd) %in% c4[,1],c(10,11,12,1,2,3,7,8,9,4,5,6)]
rownames(sig_vsd) = NULL
colnames(sig_vsd) = c("NHM","NHM","NHM","BRAF","BRAF","BRAF","CDKN2A","CDKN2A","CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A")
sig_vsd= sig_vsd[apply(sig_vsd,1,sd)!=0,]
heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Cluster 4 Genes",key.title="Gene expression",cexCol=.65,cexRow=.2,Colv=FALSE,dendrogram="row",labRow = FALSE)
dev.off()

pdf("cluster_5_genes.pdf")
sig_vsd = vsd[rownames(vsd) %in% c5[,1],c(10,11,12,1,2,3,7,8,9,4,5,6)]
rownames(sig_vsd) = NULL
colnames(sig_vsd) = c("NHM","NHM","NHM","BRAF","BRAF","BRAF","CDKN2A","CDKN2A","CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A")
sig_vsd= sig_vsd[apply(sig_vsd,1,sd)!=0,]
heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Cluster 5 Genes",key.title="Gene expression",cexCol=.65,cexRow=.2,Colv=FALSE,dendrogram="row",labRow = FALSE)
dev.off()




