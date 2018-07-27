options(scipen=999)
library(gplots)
library(factoextra)
library(RColorBrewer)

gmt = read.table("vivekGenes.txt",sep = "\t", head=T,stringsAsFactors=F)
vsd = readRDS("NHM_vsd.rds")

pdf("PRC1_PRC2.pdf")
sig_vsd = vsd[rownames(vsd) %in% gmt[,1],]
colnames(sig_vsd) = c("BRAF","BRAF","BRAF","BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A","CDKN2A","CDKN2A","CDKN2A","NHM","NHM","NHM")
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))
  heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="PRC1 & PRC2 Genes",key.title="Gene expression",cexCol=.65,cexRow=.2)
dev.off()

pdf("ATF2.pdf")
sig_vsd = vsd[rownames(vsd) %in% gmt[,2],]
colnames(sig_vsd) = c("BRAF","BRAF","BRAF","BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A","CDKN2A","CDKN2A","CDKN2A","NHM","NHM","NHM")
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))
  heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="ATF2 Genes",key.title="Gene expression",cexCol=.65,cexRow=.5)
dev.off()

pdf("Cell_proliferation.pdf")
sig_vsd = vsd[rownames(vsd) %in% gmt[,3],]
colnames(sig_vsd) = c("BRAF","BRAF","BRAF","BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A","CDKN2A","CDKN2A","CDKN2A","NHM","NHM","NHM")
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))
  heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
 xlab="", ylab="Cell proliferation Genes",key.title="Gene expression",cexCol=.65,cexRow=.2)
dev.off()

pdf("Cell_cycle.pdf")
sig_vsd = vsd[rownames(vsd) %in% gmt[,4],]
colnames(sig_vsd) = c("BRAF","BRAF","BRAF","BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A","CDKN2A","CDKN2A","CDKN2A","NHM","NHM","NHM")
colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))
  heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Cell cycle Genes",key.title="Gene expression",cexCol=.65,cexRow=.3)
dev.off()
#######################################################################################################################
#######################################################################################################################
#######################################################################################################################
#######################################################################################################################

pdf("noScale_PRC1_PRC2.pdf")
sig_vsd = vsd[rownames(vsd) %in% gmt[,1],]
colnames(sig_vsd) = c("BRAF","BRAF","BRAF","BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A","CDKN2A","CDKN2A","CDKN2A","NHM","NHM","NHM")
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))
sig_vsd = sig_vsd - rowMeans(sig_vsd)
  heatmap.2(sig_vsd,col=colors,scale="none", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="PRC1 & PRC2 Genes",key.title="Gene expression",cexCol=.65,cexRow=.2)
dev.off()

pdf("noScale_ATF2.pdf")
sig_vsd = vsd[rownames(vsd) %in% gmt[,2],]
colnames(sig_vsd) = c("BRAF","BRAF","BRAF","BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A","CDKN2A","CDKN2A","CDKN2A","NHM","NHM","NHM")
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))
sig_vsd = sig_vsd - rowMeans(sig_vsd)
  heatmap.2(sig_vsd,col=colors,scale="none", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="ATF2 Genes",key.title="Gene expression",cexCol=.65,cexRow=.5)
dev.off()

pdf("noScale_Cell_proliferation.pdf")
sig_vsd = vsd[rownames(vsd) %in% gmt[,3],]
colnames(sig_vsd) = c("BRAF","BRAF","BRAF","BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A","CDKN2A","CDKN2A","CDKN2A","NHM","NHM","NHM")
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))
sig_vsd = sig_vsd - rowMeans(sig_vsd)
  heatmap.2(sig_vsd,col=colors,scale="none", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
 xlab="", ylab="Cell proliferation Genes",key.title="Gene expression",cexCol=.65,cexRow=.2)
dev.off()

pdf("noScale_Cell_cycle.pdf")
sig_vsd = vsd[rownames(vsd) %in% gmt[,4],]
colnames(sig_vsd) = c("BRAF","BRAF","BRAF","BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A","CDKN2A","CDKN2A","CDKN2A","NHM","NHM","NHM")
sig_vsd = sig_vsd - rowMeans(sig_vsd) 
colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))
  heatmap.2(sig_vsd,col=colors,scale="none", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Cell cycle Genes",key.title="Gene expression",cexCol=.65,cexRow=.3)
dev.off()

#####################################################################################################################################
########################
# NEW GMT
options(scipen=999)
library(gplots)
library(factoextra)
library(RColorBrewer)
library(openxlsx)

vsd = readRDS("NHM_vsd.rds")

# NHM_BRAF
gmt = read.xlsx("Pathwayenrichement_NHMvsBRAF.xlsx",sheet = 1)
nhm_braf = vsd[,c(10:12,1:3)]

pdf("PRC1_PRC2_NHM_VS_BRAF.pdf")
sig_vsd = nhm_braf[rownames(nhm_braf) %in% gmt[,1],]
colnames(sig_vsd) = c("NHM","NHM","NHM","BRAF","BRAF","BRAF")
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))
sig_vsd = sig_vsd - rowMeans(sig_vsd)
  heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="PRC1 & PRC2 Genes",key.title="Gene expression",cexCol=.65,cexRow=.2,Colv=F,dendrogram="row")
dev.off()

pdf("CellProliferation_NHM_VS_BRAF.pdf")
sig_vsd = nhm_braf[rownames(nhm_braf) %in% gmt[,2],]
colnames(sig_vsd) = c("NHM","NHM","NHM","BRAF","BRAF","BRAF")
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))
sig_vsd = sig_vsd - rowMeans(sig_vsd)
  heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Cell Proliferation Genes",key.title="Gene expression",cexCol=.65,cexRow=.2,Colv=F,dendrogram="row")
dev.off()

# BRAF_BRAF+CDKN2A
gmt = read.xlsx("pathwayenrichment_BRAFvsBRAF+CDKN2A.xlsx",sheet = 1)
braf_2m = vsd[,c(1:6)]

pdf("PRC_target_BRAFvsBRAF+CDKN2A.pdf")
sig_vsd = braf_2m[rownames(braf_2m) %in% gmt[,1],]
colnames(sig_vsd) = c("BRAF","BRAF","BRAF","BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A")
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))
sig_vsd = sig_vsd - rowMeans(sig_vsd)
  heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="PRC target Genes",key.title="Gene expression",cexCol=.65,cexRow=.2,Colv=F,dendrogram="row")
dev.off()

pdf("ATF2_target_BRAFvsBRAF+CDKN2A.pdf")
sig_vsd = braf_2m[rownames(braf_2m) %in% gmt[,2],]
colnames(sig_vsd) = c("BRAF","BRAF","BRAF","BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A")
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))
sig_vsd = sig_vsd - rowMeans(sig_vsd)
  heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="ATF2 target Genes",key.title="Gene expression",cexCol=.65,cexRow=.2,Colv=F,dendrogram="row")
dev.off()

pdf("CellProliferation_BRAFvsBRAF+CDKN2A.pdf")
sig_vsd = braf_2m[rownames(braf_2m) %in% gmt[,3],]
colnames(sig_vsd) = c("BRAF","BRAF","BRAF","BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A")
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))
sig_vsd = sig_vsd - rowMeans(sig_vsd)
  heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Cell Proliferation Genes",key.title="Gene expression",cexCol=.65,cexRow=.2,Colv=F,dendrogram="row")
dev.off()

pdf("CellCycle_BRAFvsBRAF+CDKN2A.pdf")
sig_vsd = braf_2m[rownames(braf_2m) %in% gmt[,4],]
colnames(sig_vsd) = c("BRAF","BRAF","BRAF","BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A")
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))
sig_vsd = sig_vsd - rowMeans(sig_vsd)
  heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Cell Cycle Genes",key.title="Gene expression",cexCol=.65,cexRow=.2,Colv=F,dendrogram="row")
dev.off()

pdf("KEGG_MAPK_BRAFvsBRAF+CDKN2A.pdf")
sig_vsd = braf_2m[rownames(braf_2m) %in% gmt[,5],]
colnames(sig_vsd) = c("BRAF","BRAF","BRAF","BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A")
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))
sig_vsd = sig_vsd - rowMeans(sig_vsd)
  heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="MAPK Signalling Genes",key.title="Gene expression",cexCol=.65,cexRow=.2,Colv=F,dendrogram="row")
dev.off()

########################################
gmt = read.xlsx("pathwayenrichment_BRAFvsBRAF+CDKN2A.xlsx",sheet = 1)
braf_3m = vsd[,c(10:12,1:6)]


pdf("PRC_target_NHMvsBRAFvsBRAF+CDKN2A.pdf")
sig_vsd = braf_3m[rownames(braf_3m) %in% gmt[,1],]
colnames(sig_vsd) = c("NHM","NHM","NHM","BRAF","BRAF","BRAF","BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A")
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))
sig_vsd = sig_vsd - rowMeans(sig_vsd)
  heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="PRC target Genes",key.title="Gene expression",cexCol=.65,cexRow=.2,Colv=F,dendrogram="row")
dev.off()

pdf("ATF2_target_NHMvsBRAFvsBRAF+CDKN2A.pdf")
sig_vsd = braf_3m[rownames(braf_3m) %in% gmt[,2],]
colnames(sig_vsd) = c("NHM","NHM","NHM","BRAF","BRAF","BRAF","BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A")
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))
sig_vsd = sig_vsd - rowMeans(sig_vsd)
  heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="ATF2 target Genes",key.title="Gene expression",cexCol=.65,cexRow=.2,Colv=F,dendrogram="row")
dev.off()

pdf("CellProliferation_NHMvsBRAFvsBRAF+CDKN2A.pdf")
sig_vsd = braf_3m[rownames(braf_3m) %in% gmt[,3],]
colnames(sig_vsd) = c("NHM","NHM","NHM","BRAF","BRAF","BRAF","BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A")
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))
sig_vsd = sig_vsd - rowMeans(sig_vsd)
  heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Cell Proliferation Genes",key.title="Gene expression",cexCol=.65,cexRow=.2,Colv=F,dendrogram="row")
dev.off()

pdf("CellCycle_NHMvsBRAFvsBRAF+CDKN2A.pdf")
sig_vsd = braf_3m[rownames(braf_3m) %in% gmt[,4],]
colnames(sig_vsd) = c("NHM","NHM","NHM","BRAF","BRAF","BRAF","BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A")
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))
sig_vsd = sig_vsd - rowMeans(sig_vsd)
  heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Cell Cycle Genes",key.title="Gene expression",cexCol=.65,cexRow=.2,Colv=F,dendrogram="row")
dev.off()

pdf("KEGG_MAPK_NHMvsBRAFvsBRAF+CDKN2A.pdf")
sig_vsd = braf_3m[rownames(braf_3m) %in% gmt[,5],]
colnames(sig_vsd) = c("NHM","NHM","NHM","BRAF","BRAF","BRAF","BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A")
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))
sig_vsd = sig_vsd - rowMeans(sig_vsd)
  heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="MAPK Signalling Genes",key.title="Gene expression",cexCol=.65,cexRow=.2,Colv=F,dendrogram="row")
dev.off()
