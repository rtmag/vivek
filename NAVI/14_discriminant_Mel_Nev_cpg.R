############################################################################################
suppressMessages(library(RnBeads))
options(bitmapType="cairo")
options(scipen=999)
library(gplots)
library(factoextra)
library(RColorBrewer)
############################################################################################
############################################################################################
# Paired Analysis
rnb.set.filtered=load.rnb.set("/home/rtm/vivek/navi/EPIC_2nd_batch/RnBeads/RnBeads_normalization/rnb.set.norm.filtered.RData.zip")
meth.norm<-meth(rnb.set.filtered,row.names=T)
mval.norm <- mval(rnb.set.filtered,row.names=T)
dmc_table <- readRDS("dmc_MvsN_byPatient.rds")

track=as.character(rnb.set.filtered@pheno$Tumor)
track[track=="Melanoma"]=1
track[track=="Nevi"]=2
track[track=="MIS"]=3

track=as.numeric(track)
colores=c("#ffb3ba","#baffc9","#bae1ff")
clab=as.character(colores[track])
colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(9))

# standard
meth.norm.sig=meth.norm[ dmc_table$diffmeth.p.adj.fdr<0.01 & abs(dmc_table$mean.diff)>.25 ,]
meth.norm.sig = meth.norm.sig[complete.cases(meth.norm.sig),]
dim(meth.norm.sig)
saveRDS(rownames(meth.norm.sig),"LinearModel_132_CpG.rds")

png("heatmap_FDR5e-3_DIF25_no9_no10_NotCentered.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
x = heatmap.2(as.matrix(meth.norm.sig),col=colors,scale="none", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="", ylab=paste(dim(meth.norm.sig)[1],"CpGs"),key.title="Methylation lvl",ColSideColors=clab)
legend("topright",legend=c("Melanoma","Nevi","MIS"),fill=c("#ffb3ba","#baffc9","#bae1ff"), border=T, bty="n" )
dev.off()

# quot
meth.norm.sig=meth.norm[ dmc_table$diffmeth.p.adj.fdr<0.05 & abs(dmc_table$mean.quot.log2)>1.5 ,]
meth.norm.sig = meth.norm.sig[complete.cases(meth.norm.sig),]
dim(meth.norm.sig)

png("heatmap_FDR5e-3_Quot1.5_no9_no10_NotCentered.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
x = heatmap.2(as.matrix(meth.norm.sig),col=colors,scale="none", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="", ylab=paste(dim(meth.norm.sig)[1],"CpGs"),key.title="Methylation lvl",ColSideColors=clab)
legend("topright",legend=c("Melanoma","Nevi","MIS"),fill=c("#ffb3ba","#baffc9","#bae1ff"), border=T, bty="n" )
dev.off()

# combrank
meth.norm.sig=meth.norm[ order(dmc_table$combinedRank) ,]
meth.norm.sig = meth.norm.sig[1:100,]
meth.norm.sig = meth.norm.sig[complete.cases(meth.norm.sig),]
dim(meth.norm.sig)

png("heatmap_CombRank100_no9_no10_NotCentered.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
x = heatmap.2(as.matrix(meth.norm.sig),col=colors,scale="none", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="", ylab=paste(dim(meth.norm.sig)[1],"CpGs"),key.title="Methylation lvl",ColSideColors=clab)
legend("topright",legend=c("Melanoma","Nevi","MIS"),fill=c("#ffb3ba","#baffc9","#bae1ff"), border=T, bty="n" )
dev.off()

# FDR5e-5_dif25
meth.norm.sig=meth.norm[ dmc_table$diffmeth.p.adj.fdr<0.00005 & abs(dmc_table$mean.diff)>.25 ,]
meth.norm.sig = meth.norm.sig[complete.cases(meth.norm.sig),]
dim(meth.norm.sig)

png("heatmap_FDR5e-5_dif25_no9_no10_NotCentered.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
x = heatmap.2(as.matrix(meth.norm.sig),col=colors,scale="none", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="", ylab=paste(dim(meth.norm.sig)[1],"CpGs"),key.title="Methylation lvl",ColSideColors=clab)
legend("topright",legend=c("Melanoma","Nevi","MIS"),fill=c("#ffb3ba","#baffc9","#bae1ff"), border=T, bty="n" )
dev.off()

# FDR5e-4_dif25
meth.norm.sig=meth.norm[ dmc_table$diffmeth.p.adj.fdr<0.0005 & abs(dmc_table$mean.diff)>.25 ,]
meth.norm.sig = meth.norm.sig[complete.cases(meth.norm.sig),]
dim(meth.norm.sig)

png("heatmap_FDR5e-4_dif25_no9_no10_NotCentered.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
x = heatmap.2(as.matrix(meth.norm.sig),col=colors,scale="none", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="", ylab=paste(dim(meth.norm.sig)[1],"CpGs"),key.title="Methylation lvl",ColSideColors=clab)
legend("topright",legend=c("Melanoma","Nevi","MIS"),fill=c("#ffb3ba","#baffc9","#bae1ff"), border=T, bty="n" )
dev.off()

# 40 CPG
rnb.set.norm=load.rnb.set("/home/rtm/vivek/navi/EPIC_2nd_batch/RnBeads/RnBeads_normalization/rnb.set.norm.RData.zip")
x = read.table("/home/rtm/vivek/navi/meth_GEO/40_cpg_elasticNet.txt")
meth.norm_or<-meth(rnb.set.norm,row.names=T)
meth.norm.sig=meth.norm_or[ rownames(meth.norm_or) %in% as.character(x[,1]) ,]
meth.norm.sig = meth.norm.sig[complete.cases(meth.norm.sig),]
dim(meth.norm.sig)

png("heatmap_40_CpG.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
x = heatmap.2(as.matrix(meth.norm.sig),col=colors,scale="none", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="", ylab=paste(dim(meth.norm.sig)[1],"CpGs"),key.title="Methylation lvl",ColSideColors=clab)
legend("topright",legend=c("Melanoma","Nevi","MIS"),fill=c("#ffb3ba","#baffc9","#bae1ff"), border=T, bty="n" )
dev.off()

############################################################################################
############################################################################################
# Paired Analysis

rnb.set.filtered=load.rnb.set("/home/rtm/vivek/navi/EPIC_2nd_batch/RnBeads/RnBeads_normalization/rnb.set.norm.filtered.RData.zip")
meth.norm<-meth(rnb.set.filtered,row.names=T)
mval.norm <- mval(rnb.set.filtered,row.names=T)
dmc_table <- readRDS("dmc_MvsN_NoPatient.rds")

track=as.character(rnb.set.filtered@pheno$Tumor)
track[track=="Melanoma"]=1
track[track=="Nevi"]=2
track[track=="MIS"]=3

track=as.numeric(track)
colores=c("#ffb3ba","#baffc9","#bae1ff")
clab=as.character(colores[track])
colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(9))


meth.norm.sig=meth.norm[ dmc_table$diffmeth.p.adj.fdr<0.05 & abs(dmc_table$mean.diff)>.25 ,]
meth.norm.sig = meth.norm.sig[complete.cases(meth.norm.sig),]
dim(meth.norm.sig)

png("heatmap_FDR5e-3_DIF25_no9_no10_NotCentered_notPaired_NoPatient.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
x = heatmap.2(as.matrix(meth.norm.sig),col=colors,scale="none", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="", ylab=paste(dim(meth.norm.sig)[1],"CpGs"),key.title="Methylation lvl",ColSideColors=clab)
legend("topright",legend=c("Melanoma","Nevi","MIS"),fill=c("#ffb3ba","#baffc9","#bae1ff"), border=T, bty="n" )
dev.off()

meth.norm.sig=meth.norm[ dmc_table$diffmeth.p.adj.fdr<0.05 & abs(dmc_table$mean.quot.log2)>1.5 ,]
meth.norm.sig = meth.norm.sig[complete.cases(meth.norm.sig),]
dim(meth.norm.sig)

png("heatmap_FDR5e-3_Quot1.5_no9_no10_NotCentered_notPaired_NoPatient.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
x = heatmap.2(as.matrix(meth.norm.sig),col=colors,scale="none", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="", ylab=paste(dim(meth.norm.sig)[1],"CpGs"),key.title="Methylation lvl",ColSideColors=clab)
legend("topright",legend=c("Melanoma","Nevi","MIS"),fill=c("#ffb3ba","#baffc9","#bae1ff"), border=T, bty="n" )
dev.off()


############################################################################################
############################################################################################
cpg_40 = read.table("/home/rtm/vivek/navi/meth_GEO/40_cpg_elasticNet.txt",stringsAsFactors=FALSE)
cpg_40 = cpg_40[,1]
cpg_132 = readRDS("/home/rtm/vivek/navi/EPIC_2nd_batch/LinearModel_132_CpG.rds")

GSE86355 = read.table("GSE86355_unmethylated_methylated_signal.txt.gz")
GSE86355_anno = read.table("GSE86355_annotation.txt")
id = as.numeric(gsub("GSM", "", GSE86355_anno[,1]))
GSE86355_40 = GSE86355[rownames(GSE86355) %in% cpg_40, c(1:14,15:47)]

GSE86355_beta_40 = matrix(0,ncol=75,nrow=40)

GSE86355_132 = GSE86355[rownames(GSE86355) %in% cpg_132[,1], ]
GSE86355_beta_132 = matrix(0,ncol=75,nrow=40)

############################################################################################
############################################################################################
library(Biobase)
library(GEOquery)
options(bitmapType="cairo")
options(scipen=999)
library(gplots)
library(factoextra)
library(RColorBrewer)

cpg_40 = read.table("/home/rtm/vivek/navi/meth_GEO/40_cpg_elasticNet.txt",stringsAsFactors=FALSE)
cpg_40 = cpg_40[,1]
cpg_132 = readRDS("/home/rtm/vivek/navi/EPIC_2nd_batch/LinearModel_132_CpG.rds")

############################################################################################
######## TRAIN

gset <- getGEO("GSE120878", GSEMatrix =TRUE, getGPL=FALSE)
if (length(gset) > 1) idx <- grep("GPL13534", attr(gset, "names")) else idx <- 1
gset <- gset[[idx]]
GSE120878_beta =exprs(gset)
saveRDS(GSE120878_beta,"GSE120878_beta.rds")
#
GSE120878_beta = readRDS("GSE120878_beta.rds")

GSE120878_anno = read.table("GSE120878_annotation.txt")
GSE120878_40cpg = GSE120878_beta[ rownames(GSE120878_beta) %in% cpg_40 , which(colnames(GSE120878_beta) %in% GSE120878_anno[,1])]
GSE120878_132cpg = GSE120878_beta[ rownames(GSE120878_beta) %in% cpg_132 , which(colnames(GSE120878_beta) %in% GSE120878_anno[,1])]

if(sum(!(colnames(GSE120878_40cpg) == GSE120878_anno[,1]))==0){print("same_order")}
  track=as.character(GSE120878_anno[,5])
  track[track=="melanoma"]=1
  track[track=="nevus"]=2
  track=as.numeric(track)
  colores=c("#ffb3ba","#baffc9")
  clab=as.character(colores[track])
  
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(9))

png("heatmap_GSE120878_elasticNet_40CpG.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
x = heatmap.2(as.matrix(GSE120878_40cpg),col=colors,scale="none", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="", ylab=paste(dim(GSE120878_40cpg)[1],"CpGs"),key.title="Methylation lvl",ColSideColors=clab)
legend("topright",legend=c("Melanoma","Nevi"),fill=c("#ffb3ba","#baffc9"), border=T, bty="n" )
dev.off()

GSE120878_132cpg = GSE120878_132cpg[complete.cases(GSE120878_132cpg),]
png("heatmap_GSE120878_elasticNet_132CpG.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
x = heatmap.2(as.matrix(GSE120878_132cpg),col=colors,scale="none", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="",  ylab=paste(dim(GSE120878_132cpg)[1],"CpGs"),key.title="Methylation lvl",ColSideColors=clab)
legend("topright",legend=c("Melanoma","Nevi"),fill=c("#ffb3ba","#baffc9"), border=T, bty="n" )
dev.off()


############################################################################################
######## 450k prev
gset <- getGEO("GSE86355", GSEMatrix =TRUE, getGPL=FALSE)
if (length(gset) > 1) idx <- grep("GPL13534", attr(gset, "names")) else idx <- 1
gset <- gset[[idx]]
GSE86355_beta =exprs(gset)
saveRDS(GSE86355_beta,"GSE86355_beta.rds")
#
GSE86355_beta = readRDS("GSE86355_beta.rds")
GSE86355_anno = read.table("GSE86355_anno.txt")

GSE86355_40cpg = GSE86355_beta[ rownames(GSE86355_beta) %in% cpg_40 , which(colnames(GSE86355_beta) %in% GSE86355_anno[,1])]
GSE86355_132cpg = GSE86355_beta[ rownames(GSE86355_beta) %in% cpg_132 , which(colnames(GSE86355_beta) %in% GSE86355_anno[,1])]

if(sum(!(colnames(GSE86355_40cpg) == GSE86355_anno[,1]))==0){print("same_order")}
  track=as.character(GSE86355_anno[,2])
  track[track=="MELANOMA"]=1
  track[track=="NEVI"]=2
  track=as.numeric(track)
  colores=c("#ffb3ba","#baffc9")
  clab=as.character(colores[track])
  
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(9))

png("heatmap_GSE86355_450K_40CpG.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
x = heatmap.2(as.matrix(GSE86355_40cpg),col=colors,scale="none", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="", ylab=paste(dim(GSE86355_40cpg)[1],"CpGs"),key.title="Methylation lvl",ColSideColors=clab)
legend("topright",legend=c("Melanoma","Nevi"),fill=c("#ffb3ba","#baffc9"), border=T, bty="n" )
dev.off()

png("heatmap_GSE86355_450K_132CpG.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
x = heatmap.2(as.matrix(GSE86355_132cpg),col=colors,scale="none", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="",  ylab=paste(dim(GSE86355_132cpg)[1],"CpGs"),key.title="Methylation lvl",ColSideColors=clab)
legend("topright",legend=c("Melanoma","Nevi"),fill=c("#ffb3ba","#baffc9"), border=T, bty="n" )
dev.off()
############################################################################################
######## 27K
gset <- getGEO("GSE45266", GSEMatrix =TRUE, getGPL=FALSE)
if (length(gset) > 1) idx <- grep("GPL8490", attr(gset, "names")) else idx <- 1
gset <- gset[[idx]]
GSE45266_beta =exprs(gset)
saveRDS(GSE45266_beta,"GSE45266_beta.rds")
#
GSE45266_anno = read.table("GSE45266_anno.txt")
GSE45266_beta = readRDS("GSE45266_beta.rds")


GSE45266_40cpg = GSE45266_beta[ rownames(GSE45266_beta) %in% cpg_40 , which(colnames(GSE45266_beta) %in% GSE45266_anno[,1])]
GSE45266_132cpg = GSE45266_beta[ rownames(GSE45266_beta) %in% cpg_132 , which(colnames(GSE45266_beta) %in% GSE45266_anno[,1])]


if(sum(!(colnames(GSE45266_40cpg) == GSE45266_anno[,1]))==0){print("same_order")}
  track=as.character(GSE45266_anno[,2])
  track[track=="MELANOMA"]=1
  track[track=="NEVI"]=2
  track=as.numeric(track)
  colores=c("#ffb3ba","#baffc9")
  clab=as.character(colores[track])
  
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(9))

png("heatmap_GSE45266_27K_40CpG.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
x = heatmap.2(as.matrix(GSE45266_40cpg),col=colors,scale="none", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="", ylab=paste(dim(GSE45266_40cpg)[1],"CpGs"),key.title="Methylation lvl",ColSideColors=clab)
legend("topright",legend=c("Melanoma","Nevi"),fill=c("#ffb3ba","#baffc9"), border=T, bty="n" )
dev.off()

png("heatmap_GSE45266_27K_132CpG.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
x = heatmap.2(as.matrix(GSE45266_132cpg),col=colors,scale="none", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="",  ylab=paste(dim(GSE45266_132cpg)[1],"CpGs"),key.title="Methylation lvl",ColSideColors=clab)
legend("topright",legend=c("Melanoma","Nevi"),fill=c("#ffb3ba","#baffc9"), border=T, bty="n" )
dev.off()
#######################
# Melanoma

