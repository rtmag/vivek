
options(scipen=999)
library(gplots)
library(factoextra)
library(RColorBrewer)

vsd = readRDS("NHM_vsd.rds")
gmt = read.table("~/Downloads/TFAP2C_genes_chipseq.txt",sep = "\t", head=T,stringsAsFactors=F)
vsd = vsd[,c(10:12,1:3,7:9,4:6)]



sig_vsd = vsd[rownames(vsd) %in% gmt[,1],]
sig_vsd = sig_vsd[apply(sig_vsd,1,sd)!=0,]
colnames(sig_vsd) = c("NHM","NHM","NHM","BRAF","BRAF","BRAF","CDKN2A","CDKN2A","CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A")
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(9))

pdf("TFAP2C_noColorLabels.pdf")
  heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,margins=c(5,22),
  xlab="", ylab="TFAP2C Target Genes",key.title="Gene expression",cexCol=.65,cexRow=.2,Colv=F,dendrogram="row",labRow = FALSE)
dev.off()

pdf("TFAP2C_ColorLabels.pdf")
x =  heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,margins=c(5,22),
  xlab="", ylab="TFAP2C Target Genes",key.title="Gene expression",cexCol=.65,cexRow=.2,Colv=F,dendrogram="row",labRow = FALSE)
hc <- as.hclust( x$rowDendrogram )
groups=cutree( hc, k=4 )
track=as.numeric(groups)                     
colores=c("red","blue","green","orange")
clab=(colores[track])
heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,margins=c(5,22),
  xlab="", ylab="TFAP2C Target Genes",key.title="Gene expression",cexCol=.65,cexRow=.2,Colv=F,dendrogram="row",labRow = FALSE,
         RowSideColors=clab)
dev.off()

write.table(names(which(groups==1)),"TFAP2C_red_genes.txt",sep="\t",quote=F,col.names=F,row.names=F)
write.table(names(which(groups==2)),"TFAP2C_blue_genes.txt",sep="\t",quote=F,col.names=F,row.names=F)
write.table(names(which(groups==3)),"TFAP2C_green_genes.txt",sep="\t",quote=F,col.names=F,row.names=F)
write.table(names(which(groups==4)),"TFAP2C_orange_genes.txt",sep="\t",quote=F,col.names=F,row.names=F)

##########

gmt = c("CDKN1A","CRABP2","CSTA","ECM1","ERBB2","ESR1","GPX1","MMP2","RET","SULT1E1")

sig_vsd = vsd[rownames(vsd) %in% gmt,]
sig_vsd = sig_vsd[apply(sig_vsd,1,sd)!=0,]
colnames(sig_vsd) = c("NHM","NHM","NHM","BRAF","BRAF","BRAF","CDKN2A","CDKN2A","CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A")
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(9))

  heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="",key.title="Gene expression",cexCol=.65,cexRow=.8,Colv=F,dendrogram="row")
