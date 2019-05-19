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

######################################## TRAIN_SAMPLE ########################################
info = read.table("hm450.hg38.manifest.tsv",sep="\t", header=T)
x = readRDS("/home/rtm/vivek/navi/meth_GEO/GSE120878_beta.rds")
meanx = rowMeans(x)
info = info[,c(1,2,3,5)]
ix = match(info[,4], names(meanx) )
table( (info[,4]) == (names(meanx[ix])) )
bg = cbind(info[,1:3],meanx[ix])
colnames(bg) = NULL
rownames(bg) = NULL
write.table(bg,"train_mean_beta.bedgraph",sep="\t",col.names=F,row.names=F,quote=F)

######################################## prev 450k ########################################
info = read.table("hm450.hg38.manifest.tsv",sep="\t", header=T)
x = readRDS("/home/rtm/vivek/navi/meth_GEO/GSE86355_beta.rds")
meanx = rowMeans(x)
info = info[,c(1,2,3,5)]
ix = match(info[,4], names(meanx) )
table( (info[,4]) == (names(meanx[ix])) )
bg = cbind(info[,1:3],meanx[ix])
colnames(bg) = NULL
rownames(bg) = NULL
write.table(bg,"prev450k_mean_beta.bedgraph",sep="\t",col.names=F,row.names=F,quote=F)
