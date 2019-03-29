#Identification of direct transcriptional targets of V600EBRAF/MEK signalling in melanoma
# table 1

options(scipen=999)
library(gplots)
library(factoextra)
library(RColorBrewer)

vsd = readRDS("NHM_vsd.rds")

gmt = c("SPRY4","DUSP6","SPRY2","ERRFI1","CXCL1","TGFA","LDLR","SLC20A1","C16ORF52","IER3","FST","CD200","GNE",
"FOSL1","ETV5","EPHA4","TFAP2C","CCND1","CDC42EP3","KIAA1199","ETV1","PMAIP1","MMP16","AK123120","TNFRSF21",
"TLR4","EGR1","GPRC5A","HTR7","IL8","FLJ46906","GDF15","FAM84B","FAM108C1",
"SPRED1","INPP5F","RND3","KLF4","NHSL1","TM4SF1","KCNN4","TRIB1","CITED2")
vsd = vsd[,c(10:12,1:3,7:9,4:6)]

sig_vsd = vsd[rownames(vsd) %in% gmt,]
sig_vsd = sig_vsd[apply(sig_vsd,1,sd)!=0,]
colnames(sig_vsd) = c("NHM","NHM","NHM","BRAF","BRAF","BRAF","CDKN2A","CDKN2A","CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A")
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(9))

pdf("table1.pdf")
heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,margins=c(5,22),
  xlab="", ylab="",key.title="Gene expression",cexCol=.65,cexRow=.9,Colv=F,dendrogram="row",main="table1 genes")
dev.off()
