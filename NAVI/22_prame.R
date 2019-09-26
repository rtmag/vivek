############################################################################################
suppressMessages(library(RnBeads))
options(bitmapType="cairo")
options(scipen=999)
library(gplots)
library(factoextra)
library(RColorBrewer)
############################################################################################
rnb.set.norm=load.rnb.set("/home/rtm/vivek/navi/EPIC_2nd_batch/RnBeads/RnBeads_normalization/rnb.set.norm.filtered.RData.zip")


library("IlluminaHumanMethylationEPICanno.ilm10b4.hg19")
data(IlluminaHumanMethylationEPICanno.ilm10b4.hg19)
info<-getAnnotation(IlluminaHumanMethylationEPICanno.ilm10b4.hg19)

info = info[,c(1,2,3,4,22,24)]

ix = which(info[,4] %in% hi_nevi )
hi_nevi_bed = as.data.frame(info[ix,])
hi_nevi_bed = cbind(hi_nevi_bed[,1],hi_nevi_bed[,2]-1,hi_nevi_bed[,2]+1,hi_nevi_bed[,3:6])
