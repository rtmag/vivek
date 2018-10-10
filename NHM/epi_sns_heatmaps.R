options(bitmapType="cairo")
options(scipen=999)
library(gplots)
library(factoextra)
library(RColorBrewer)

epi = read.table("~/Downloads/epigenetic_genes.txt",header=F)
epi = as.character(epi[,1])
vsd = readRDS("NHM_vsd.rds")
vsd = vsd[,c(10:12,1:3,7:9,4:6)]
colnames(sig_vsd) = c("NHM","NHM","NHM","BRAF","BRAF","BRAF","CDKN2A","CDKN2A","CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A")

colors <-  greenred(20)
sig_vsd = vsd[rownames(vsd) %in% epi,]
sig_vsd = sig_vsd[apply(sig_vsd,1,sd)!=0,]
heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,Colv=F,
xlab="",ylab="",main="Epigenetic Genes",key.title="Gene expression",cexCol=.65,cexRow=.7,dendrogram="row",density.info="none")

