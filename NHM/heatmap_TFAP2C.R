
options(scipen=999)
library(gplots)
library(factoextra)
library(RColorBrewer)

vsd = readRDS("NHM_vsd.rds")

gmt = read.table("~/Downloads/TFAP2C_genes_chipseq.txt",sep = "\t", head=T,stringsAsFactors=F)
nhm_braf = vsd[,c(10:12,1:3)]

pdf("PRC1_PRC2_NHM_VS_BRAF.pdf")
sig_vsd = nhm_braf[rownames(nhm_braf) %in% gmt[,1],]
colnames(sig_vsd) = c("NHM","NHM","NHM","BRAF","BRAF","BRAF")
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))
sig_vsd = sig_vsd - rowMeans(sig_vsd)
  heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="PRC1 & PRC2 Genes",key.title="Gene expression",cexCol=.65,cexRow=.2,Colv=F,dendrogram="row")
dev.off()
