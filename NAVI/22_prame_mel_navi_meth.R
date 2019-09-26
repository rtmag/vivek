############################################################################################
suppressMessages(library(RnBeads))
options(bitmapType="cairo")
options(scipen=999)
library(gplots)
library(factoextra)
library(RColorBrewer)
############################################################################################
rnb.set.norm=load.rnb.set("/home/rtm/vivek/navi/EPIC_2nd_batch/RnBeads/RnBeads_normalization/rnb.set.norm.filtered.RData.zip")

meth.filtered.centered = readRDS('/home/rtm/vivek/navi/EPIC_2nd_batch/RnBeads/RnBeads_differential/meth.norm.centered.rds')

library("IlluminaHumanMethylationEPICanno.ilm10b4.hg19")
data(IlluminaHumanMethylationEPICanno.ilm10b4.hg19)
info<-getAnnotation(IlluminaHumanMethylationEPICanno.ilm10b4.hg19)

info = info[,c(1,2,3,4,22,24)]

ix_cpg <- unique(c( grep("PRAME$",info$UCSC_RefGene_Name,perl=TRUE),
                    grep("PRAME;",info$UCSC_RefGene_Name,perl=TRUE)))

info_prame <- info[ix_cpg,]
info_prame <- info_prame[order(info_prame$Name),]

beta <- meth(rnb.set.norm,row.names=TRUE)

beta.prame <- beta[rownames(beta) %in% info_prame$Name,]
meth.cent.prame <- meth.filtered.centered[rownames(meth.filtered.centered) %in% info_prame$Name,]
meth.cent.prame <- meth.cent.prame[order(rownames(meth.cent.prame)),]

rownames(meth.cent.prame) <- gsub(";.+","",info_prame$UCSC_RefGene_Group,perl=TRUE)

colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(9))
source('https://raw.githubusercontent.com/rtmag/tumor-meth-pipe/master/heatmap3.R')


clab=as.character(rnb.set.norm@pheno$Tumor)
clab[clab=="Melanoma"]="red"
clab[clab=="Nevi"]="blue"
clab[clab=="MIS"]="grey"

png("heatmap-prame.png",width= 3.25,
  height= 5.25,units="in",
  res=1200,pointsize=4)
heatmap.2(as.matrix(meth.cent.prame),col=colors,scale="none", trace="none",
          distfun = function(x) get_dist(x,method="pearson"),srtCol=90,dendrogram='none',
xlab="", ylab="",key.title="Methylation lvl",ColSideColors=clab)
legend("topright",legend=c("Melanoma","Nevi","MIS"),fill=c("red","blue","grey"), border=T, bty="n" )
dev.off()

pdf("PRAME_methylationDifference_boxplot.pdf",height=8,width=14)
data <- readRDS("diff_prame_meth.cent.prame.rds")
data <- data[order(rowMeans(data)) , ] 
data = data*2

stripchart(as.data.frame(t(data)),vertical = TRUE,#jitter = 0.3, 
          ylab = 'Methylation difference between matched Melanoma - Nevi for probes associated with PRAME',
           method = "jitter", pch = 20, col = alpha(colour='red',alpha=.4),cex = 2,las=2)

boxplot(t(data), add = TRUE,boxlwd = 2,las=2,outline=FALSE)
abline(h=0)
dev.off()
