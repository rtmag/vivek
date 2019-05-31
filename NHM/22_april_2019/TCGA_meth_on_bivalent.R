# get bw meth

info = read.table("hm450.hg38.manifest.tsv",sep="\t", header=T)

x = readRDS("/root/TCGA/Rnbeads/SKCM/RnBeads_normalization/betaVALUES.rds")
meanx = rowMeans(x)

info = info[,c(1,2,3,5)]

ix = match(info[,4], names(meanx) )

table( (info[,4]) == (names(meanx[ix])) )

bg = cbind(info[,1:3],meanx[ix])
colnames(bg) = NULL
rownames(bg) = NULL

write.table(bg,"SKCM_mean_beta.bedgraph",sep="\t",col.names=F,row.names=F,quote=F)
#######################################################################################################
info = read.table("hm450.hg38.manifest.tsv",sep="\t", header=T)
info = info[,c(1,2,3,5)]
######################################## TRAIN_SAMPLE ########################################
GSE120878_anno = read.table("GSE120878_annotation.txt")
x = readRDS("/home/rtm/vivek/navi/meth_GEO/GSE120878_beta.rds")
track=as.character(GSE120878_anno[,5])

meanx = rowMeans(x[,track=="melanoma"])
ix = match(info[,4], names(meanx) )
table( (info[,4]) == (names(meanx[ix])) )
bg = cbind(info[,1:3],meanx[ix])
colnames(bg) = NULL
rownames(bg) = NULL
bg = bg[!is.na(bg[,4]),]
bg = bg[!is.na(bg[,2]),]
bg[,2]=bg[,2]+1
bg = bg[!duplicated(apply(bg[,1:3],1,paste,collapse="") ),]
write.table(bg,"melanoma_train_mean_beta.bedgraph",sep="\t",col.names=F,row.names=F,quote=F)

meanx = rowMeans(x[,track=="nevus"])
ix = match(info[,4], names(meanx) )
table( (info[,4]) == (names(meanx[ix])) )
bg = cbind(info[,1:3],meanx[ix])
colnames(bg) = NULL
rownames(bg) = NULL
bg = bg[!is.na(bg[,4]),]
bg = bg[!is.na(bg[,2]),]
bg[,2]=bg[,2]+1
bg = bg[!duplicated(apply(bg[,1:3],1,paste,collapse="") ),]
write.table(bg,"nevus_train_mean_beta.bedgraph",sep="\t",col.names=F,row.names=F,quote=F)
######################################## prev 450k ########################################
GSE86355_anno = read.table("GSE86355_anno.txt")
x = readRDS("/home/rtm/vivek/navi/meth_GEO/GSE86355_beta.rds")
track=as.character(GSE86355_anno[,2])

meanx = rowMeans(x[,track=="MELANOMA"])
ix = match(info[,4], names(meanx) )
table( (info[,4]) == (names(meanx[ix])) )
bg = cbind(info[,1:3],meanx[ix])
colnames(bg) = NULL
rownames(bg) = NULL
bg = bg[!is.na(bg[,4]),]
bg = bg[!is.na(bg[,2]),]
bg[,2]=bg[,2]+1
dim(bg)
bg = bg[!duplicated(apply(bg[,1:3],1,paste,collapse="") ),]
dim(bg)
write.table(bg,"melanoma_prev450k_mean_beta.bedgraph",sep="\t",col.names=F,row.names=F,quote=F)

meanx = rowMeans(x[,track=="NEVI"])
ix = match(info[,4], names(meanx) )
table( (info[,4]) == (names(meanx[ix])) )
bg = cbind(info[,1:3],meanx[ix])
colnames(bg) = NULL
rownames(bg) = NULL
bg = bg[!is.na(bg[,4]),]
bg = bg[!is.na(bg[,2]),]
bg[,2]=bg[,2]+1
bg = bg[!duplicated(apply(bg[,1:3],1,paste,collapse="") ),]
write.table(bg,"nevi_prev450k_mean_beta.bedgraph",sep="\t",col.names=F,row.names=F,quote=F)
###############################################################################################################################
#######################################################################################################
#######################################################################################################
#######################################################################################################
#######################################################################################################
info = read.table("hm450.hg38.manifest.tsv",sep="\t", header=T)
info = info[,c(1,2,3,5)]
library(matrixStats)
######################################## TRAIN_SAMPLE ########################################
GSE120878_anno = read.table("GSE120878_annotation.txt")
x = readRDS("/home/rtm/vivek/navi/meth_GEO/GSE120878_beta.rds")
track=as.character(GSE120878_anno[,5])

meanx = rowMedians(x[,track=="melanoma"])
names(meanx) = rownames(x)
ix = match(info[,4], names(meanx) )
table( (info[,4]) == (names(meanx[ix])) )
bg = cbind(info[,1:3],meanx[ix])
colnames(bg) = NULL
rownames(bg) = NULL
bg = bg[!is.na(bg[,4]),]
bg = bg[!is.na(bg[,2]),]
bg[,2]=bg[,2]+1
bg = bg[!duplicated(apply(bg[,1:3],1,paste,collapse="") ),]
write.table(bg,"melanoma_train_median_beta.bedgraph",sep="\t",col.names=F,row.names=F,quote=F)

meanx = rowMedians(x[,track=="nevus"])
names(meanx) = rownames(x)
ix = match(info[,4], names(meanx) )
table( (info[,4]) == (names(meanx[ix])) )
bg = cbind(info[,1:3],meanx[ix])
colnames(bg) = NULL
rownames(bg) = NULL
bg = bg[!is.na(bg[,4]),]
bg = bg[!is.na(bg[,2]),]
bg[,2]=bg[,2]+1
bg = bg[!duplicated(apply(bg[,1:3],1,paste,collapse="") ),]
write.table(bg,"nevus_train_median_beta.bedgraph",sep="\t",col.names=F,row.names=F,quote=F)
######################################## prev 450k ########################################
GSE86355_anno = read.table("GSE86355_anno.txt")
x = readRDS("/home/rtm/vivek/navi/meth_GEO/GSE86355_beta.rds")
track=as.character(GSE86355_anno[,2])

meanx = rowMedians(x[,track=="MELANOMA"])
names(meanx) = rownames(x)
ix = match(info[,4], names(meanx) )
table( (info[,4]) == (names(meanx[ix])) )
bg = cbind(info[,1:3],meanx[ix])
colnames(bg) = NULL
rownames(bg) = NULL
bg = bg[!is.na(bg[,4]),]
bg = bg[!is.na(bg[,2]),]
bg[,2]=bg[,2]+1
dim(bg)
bg = bg[!duplicated(apply(bg[,1:3],1,paste,collapse="") ),]
dim(bg)
write.table(bg,"melanoma_prev450k_median_beta.bedgraph",sep="\t",col.names=F,row.names=F,quote=F)

meanx = rowMedians(x[,track=="NEVI"])
names(meanx) = rownames(x)
ix = match(info[,4], names(meanx) )
table( (info[,4]) == (names(meanx[ix])) )
bg = cbind(info[,1:3],meanx[ix])
colnames(bg) = NULL
rownames(bg) = NULL
bg = bg[!is.na(bg[,4]),]
bg = bg[!is.na(bg[,2]),]
bg[,2]=bg[,2]+1
bg = bg[!duplicated(apply(bg[,1:3],1,paste,collapse="") ),]
write.table(bg,"nevi_prev450k_median_beta.bedgraph",sep="\t",col.names=F,row.names=F,quote=F)
##########################################################################################################################
#######################################################################################################
options(bitmapType="cairo")
options(scipen=999)
library(gplots)
library(factoextra)
library(RColorBrewer)
colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(9))
############################################################################################
info = read.table("hm450.hg38.manifest.tsv",sep="\t", header=T)
info = info[,c(1,2,3,5)]
biv = read.table("meth_nhm/poised_kmeans_zmet_5k_3clusters.bed", sep="\t", header=F)
more ../hm450.hg38.manifest.tsv |cut -f 1,2,3,5|grep -v "CpG_chrm"|grep -v "NA" > hm450.hg38.manifest_impo.tsv
grep -v "#chrom" poised_kmeans_zmet_5k_3clusters.bed|cut -f1,2,3|awk -F"\t" '{print $1"\t"$2-500"\t"$2+500}'|bedtools intersect -a hm450.hg38.manifest_impo.tsv -b -|uniq > poised_cpgs.txt
######################################## TRAIN_SAMPLE ########################################
cpg = read.table("meth_nhm/poised_cpgs.txt", sep="\t")
GSE120878_anno = read.table("GSE120878_annotation.txt")
x = readRDS("/home/rtm/vivek/navi/meth_GEO/GSE120878_beta.rds")

track=as.character(GSE120878_anno[,5])
 track[track=="melanoma"]=1
  track[track=="nevus"]=2
  track=as.numeric(track)
  colores=c("#ffb3ba","#baffc9")
  clab=as.character(colores[track])

x_cpg = x[ rownames(x) %in% cpg[,4] , ]
dim(x_cpg)
x_cpg=x_cpg[complete.cases(x_cpg),]
dim(x_cpg)


png("heatmap_GSE120878_bivalent_promoters.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
x = heatmap.2(as.matrix(x_cpg),col=colors,scale="none", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="", ylab="CpGs in Bivalent Promoters",key.title="Methylation lvl",ColSideColors=clab)
legend("topright",legend=c("Melanoma","Nevi"),fill=c("#ffb3ba","#baffc9"), border=T, bty="n" )
dev.off()
######################################## 450k prev ########################################
GSE86355_anno = read.table("GSE86355_anno.txt")
x = readRDS("/home/rtm/vivek/navi/meth_GEO/GSE86355_beta.rds")

track=as.character(GSE86355_anno[,2])
 track[track=="MELANOMA"]=1
  track[track=="NEVI"]=2
  track=as.numeric(track)
  colores=c("#ffb3ba","#baffc9")
  clab=as.character(colores[track])

x_cpg = x[ rownames(x) %in% cpg[,4] , which(colnames(x) %in% GSE86355_anno[,1]) ]
dim(x_cpg)
x_cpg=x_cpg[complete.cases(x_cpg),]
dim(x_cpg)

png("heatmap_GSE86355_bivalent_promoters.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
x = heatmap.2(as.matrix(x_cpg),col=colors,scale="none", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="", ylab="CpGs in Bivalent Promoters",key.title="Methylation lvl",ColSideColors=clab)
legend("topright",legend=c("Melanoma","Nevi"),fill=c("#ffb3ba","#baffc9"), border=T, bty="n" )
dev.off()

############################################################################################
# HEATMAP CPGS of POISED GENES
info = read.table("hm450.hg38.manifest.tsv",sep="\t", header=T)
biv = read.table("meth_nhm/poised_kmeans_zmet_5k_3clusters.bed", sep="\t", header=F)

info=info[as.character(info[,20]) %in% as.character(biv[,4]),]
######################################## TRAIN_SAMPLE ########################################
cpg = as.character(info$probeID)

GSE120878_anno = read.table("GSE120878_annotation.txt")
x = readRDS("/home/rtm/vivek/navi/meth_GEO/GSE120878_beta.rds")

track=as.character(GSE120878_anno[,5])
 track[track=="melanoma"]=1
  track[track=="nevus"]=2
  track=as.numeric(track)
  colores=c("#ffb3ba","#baffc9")
  clab=as.character(colores[track])

x_cpg = x[ rownames(x) %in% cpg , ]
dim(x_cpg)
x_cpg=x_cpg[complete.cases(x_cpg),]
dim(x_cpg)

png("heatmap_GSE120878_bivalent_genebody.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
x = heatmap.2(as.matrix(x_cpg),col=colors,scale="none", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="", ylab="CpGs in Bivalent Promoters",key.title="Methylation lvl",ColSideColors=clab)
legend("topright",legend=c("Melanoma","Nevi"),fill=c("#ffb3ba","#baffc9"), border=T, bty="n" )
dev.off()

######################################## 450k prev ########################################
GSE86355_anno = read.table("GSE86355_anno.txt")
x = readRDS("/home/rtm/vivek/navi/meth_GEO/GSE86355_beta.rds")

track=as.character(GSE86355_anno[,2])
 track[track=="MELANOMA"]=1
  track[track=="NEVI"]=2
  track=as.numeric(track)
  colores=c("#ffb3ba","#baffc9")
  clab=as.character(colores[track])

x_cpg = x[ rownames(x) %in% cpg , which(colnames(x) %in% GSE86355_anno[,1]) ]
dim(x_cpg)
x_cpg=x_cpg[complete.cases(x_cpg),]
dim(x_cpg)

png("heatmap_GSE86355_bivalent_genebody.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
x = heatmap.2(as.matrix(x_cpg),col=colors,scale="none", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="", ylab="CpGs in Bivalent Promoters",key.title="Methylation lvl",ColSideColors=clab)
legend("topright",legend=c("Melanoma","Nevi"),fill=c("#ffb3ba","#baffc9"), border=T, bty="n" )
dev.off()
