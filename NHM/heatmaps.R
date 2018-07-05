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


