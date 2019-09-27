suppressMessages(library(RnBeads))

options(scipen=999)
library(gplots)
library(factoextra)
library(RColorBrewer)
colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(9))
options(bitmapType="cairo")

# annotation load (hg19)

library("IlluminaHumanMethylationEPICanno.ilm10b4.hg19")
data(IlluminaHumanMethylationEPICanno.ilm10b4.hg19)
info<-getAnnotation(IlluminaHumanMethylationEPICanno.ilm10b4.hg19)

info = info[,c(1,2,3,4,22,24)]


rnb.set.norm=load.rnb.set("/home/rtm/vivek/navi/EPIC_2nd_batch/RnBeads/RnBeads_normalization/rnb.set.norm.filtered.RData.zip")
rnb.set.norm.new=load.rnb.set("/home/rtm/vivek/navi/new_epic/RnBeads/RnBeads_normalization/rnb.set.norm.filtered.RData.zip")

rnb.set.nevi=remove.samples(rnb.set.norm,samples(rnb.set.norm)[rnb.set.norm@pheno$Tumor!="Nevi"])

combined.rnb.set.norm <- combine(rnb.set.nevi, rnb.set.norm.new)

combined.rnb.set.norm@pheno$Tumor <- as.character(combined.rnb.set.norm@pheno$Tumor)
combined.rnb.set.norm@pheno$Tumor[24:31] <- "NewNevi1"
combined.rnb.set.norm@pheno$Tumor[32:39] <- "NewNevi2"
combined.rnb.set.norm@pheno$Tumor <- as.factor(combined.rnb.set.norm@pheno$Tumor)

nevidiff <- rnb.execute.computeDiffMeth(combined.rnb.set.norm,pheno.cols=c("Tumor"))
comparison <- get.comparisons(nevidiff)[1]
dmc_table <-get.table(nevidiff, comparison, "sites", return.data.frame=TRUE)

# VOLCANO

png("volcano-Nevi_vs_NewNevi.png",width= 3.25,
  height= 5.25,units="in",
  res=1200,pointsize=4)
plot(dmc_table$mean.diff,-log10(dmc_table$diffmeth.p.adj.fdr),xlab=expression('Log'[2]*paste(' Fold Change ')),
              ylab=expression('-Log'[10]*' Q-values'),col=alpha("grey",.5),pch=20 )
  abline(v=-.25,lty = 2,col="grey")
  abline(v=.25,lty = 2,col="grey")
  abline(h=-log10(0.05),lty = 2,col="grey")
  points(dmc_table$mean.diff[abs(dmc_table$mean.diff)>.25 & dmc_table$diffmeth.p.adj.fdr<0.05],
       -log10(dmc_table$diffmeth.p.adj.fdr)[abs(dmc_table$mean.diff)>.25 & dmc_table$diffmeth.p.adj.fdr<0.05],
      col="red",pch=20)
  legend("topright", paste("HiMeth Nevi:",length(which(dmc_table$mean.diff>.25 & dmc_table$diffmeth.p.adj.fdr<0.05))), bty="n") 
  legend("topleft", paste("HiMeth NewNevi:",length(which(dmc_table$mean.diff<(-.25) & dmc_table$diffmeth.p.adj.fdr<0.05))), bty="n") 
  dev.off()
#

clab=as.character(combined.rnb.set.norm@pheno$Tumor)
clab[clab=="Nevi"]="blue"
clab[clab=="NewNevi"]="green"

beta <- meth(combined.rnb.set.norm,row.names=TRUE)

meth.norm.sig = beta[dmc_table$diffmeth.p.adj.fdr<0.05 & abs(dmc_table$mean.diff)>.25,]
meth.norm.sig = meth.norm.sig[complete.cases(meth.norm.sig),]

png("heatmap-Nevi_vs_NewNevi.png",width= 3.25,
  height= 5.25,units="in",
  res=1200,pointsize=4)
heatmap.2(as.matrix(meth.norm.sig),col=colors,scale="none", trace="none",
          distfun = function(x) get_dist(x,method="pearson"),dendrogram='both',
xlab="", ylab="",key.title="Methylation lvl",ColSideColors=clab,labRow = FALSE,labCol=FALSE)
legend("topright",legend=c("Nevi","NewNevi"),fill=c("blue","green"), border=T, bty="n" )
dev.off()


hi_newnevi = rownames(beta)[dmc_table$diffmeth.p.adj.fdr<0.05 &  (dmc_table$mean.diff)<(-.25)]
ix = which(info[,4] %in% hi_newnevi )
hi_newnevi_bed = as.data.frame(info[ix,])
hi_newnevi_bed = cbind(hi_newnevi_bed[,1],hi_newnevi_bed[,2]-1,hi_newnevi_bed[,2]+1,hi_newnevi_bed[,3:6])
write.table(hi_newnevi_bed,"hiMeth_NewNevi.bed",quote=F,col.names=F,row.names=F,sep="\t")

hi_nevi = rownames(beta)[dmc_table$diffmeth.p.adj.fdr<0.05 &  (dmc_table$mean.diff)>(.25)]
ix = which(info[,4] %in% hi_nevi )
hi_nevi_bed = as.data.frame(info[ix,])
hi_nevi_bed = cbind(hi_nevi_bed[,1],hi_nevi_bed[,2]-1,hi_nevi_bed[,2]+1,hi_nevi_bed[,3:6])
write.table(hi_nevi_bed,"hiMeth_Nevi.bed",quote=F,col.names=F,row.names=F,sep="\t")


