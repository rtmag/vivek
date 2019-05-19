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



