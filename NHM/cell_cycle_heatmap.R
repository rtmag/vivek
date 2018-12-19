options(bitmapType="cairo")

options(scipen=999)
library(gplots)
library(factoextra)
library(RColorBrewer)

gmt = c("ATM","ATR","CHK1","CHK2","CDC25A",
"CDC25","CDC25B","CDC25C","TP53","CDKN1A",
"CDKN2A","CDC2","CDK4","CDK6","CDK2","RB1","CCNA1","CCNA2","CCNB1",
"CCNB2","CCNB3","CCND1","CCND2","CCND3","CCNE1",
"CCNE2","E2F1","E2F2","E2F3","E2F4","E2F5","E2F6",
"E2F7","E2F8","WEE1","PLK1","PLK2","PLK3","PLK4",
"AURKA","AURKB")
vsd = readRDS("NHM_vsd.rds")

pdf("CC_gene.pdf")
sig_vsd = vsd[rownames(vsd) %in% gmt,]
colnames(sig_vsd) = c("BRAF","BRAF","BRAF","BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A","CDKN2A","CDKN2A","CDKN2A","NHM","NHM","NHM")
colors = colorRampPalette(c("green","black","red"))(20)
  heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="",key.title="Gene expression",cexCol=.65,cexRow=.9)
dev.off()
