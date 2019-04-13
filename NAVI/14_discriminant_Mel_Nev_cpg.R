############################################################################################
suppressMessages(library(RnBeads))
options(bitmapType="cairo")
options(scipen=999)
library(gplots)
library(factoextra)
library(RColorBrewer)
############################################################################################
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


meth.norm.sig=meth.norm[ dmc_table$diffmeth.p.adj.fdr<0.05 & abs(dmc_table$mean.diff)>.25 ,]
meth.norm.sig = meth.norm.sig[complete.cases(meth.norm.sig),]
dim(meth.norm.sig)

meth.norm.sig=meth.norm[ dmc_table$diffmeth.p.adj.fdr<0.05 & abs(dmc_table$mean.quot.log2)>1.5 ,]
meth.norm.sig = meth.norm.sig[complete.cases(meth.norm.sig),]
dim(meth.norm.sig)


png("heatmap_FDR5e-3_DIF80_no9_no10_Nocentered.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
x = heatmap.2(as.matrix(meth.norm.sig),col=colors,scale="none", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="", ylab="CpGs",key.title="Methylation lvl",ColSideColors=clab)
legend("topright",legend=c("Melanoma","Nevi","MIS"),fill=c("#ffb3ba","#baffc9","#bae1ff"), border=T, bty="n" )
dev.off()
#######################################################################################
