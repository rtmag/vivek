suppressMessages(library(RnBeads))
library(ComplexHeatmap)
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
dmc.Nevi.vs.non <-get.table(nevidiff, get.comparisons(nevidiff)[1], "sites", return.data.frame=TRUE)
dmc.NN1.vs.non <-get.table(nevidiff, get.comparisons(nevidiff)[2], "sites", return.data.frame=TRUE)
dmc.NN2.vs.non <-get.table(nevidiff, get.comparisons(nevidiff)[3], "sites", return.data.frame=TRUE)

table(dmc.Nevi.vs.non$diffmeth.p.adj.fdr<0.05 & abs(dmc.Nevi.vs.non$mean.diff)>.25)
table(dmc.NN1.vs.non$diffmeth.p.adj.fdr<0.05 & abs(dmc.NN1.vs.non$mean.diff)>.25)
table(dmc.NN2.vs.non$diffmeth.p.adj.fdr<0.05 & abs(dmc.NN2.vs.non$mean.diff)>.25)

N0vnull <- which(dmc.Nevi.vs.non$diffmeth.p.adj.fdr<0.05 & abs(dmc.Nevi.vs.non$mean.diff)>.25)
N1vnull <- which(dmc.NN1.vs.non$diffmeth.p.adj.fdr<0.05 & abs(dmc.NN1.vs.non$mean.diff)>.25)
N2vnull <- which(dmc.NN2.vs.non$diffmeth.p.adj.fdr<0.05 & abs(dmc.NN2.vs.non$mean.diff)>.25)

# NEVI VS NN1
rnb.set.tmp <- remove.samples(combined.rnb.set.norm,samples(combined.rnb.set.norm)[combined.rnb.set.norm@pheno$Tumor=="NewNevi2"])
nevidiff.Nevi.NN1 <- rnb.execute.computeDiffMeth(rnb.set.tmp,pheno.cols=c("Tumor"))
comparison <- get.comparisons(nevidiff.Nevi.NN1)[1]
dmc.Nevi.vs.NN1 <-get.table(nevidiff.Nevi.NN1, comparison, "sites", return.data.frame=TRUE)

# NEVI VS NN2
rnb.set.tmp <- remove.samples(combined.rnb.set.norm,samples(combined.rnb.set.norm)[combined.rnb.set.norm@pheno$Tumor=="NewNevi1"])
nevidiff.Nevi.NN2 <- rnb.execute.computeDiffMeth(rnb.set.tmp,pheno.cols=c("Tumor"))
comparison <- get.comparisons(nevidiff.Nevi.NN2)[1]
dmc.Nevi.vs.NN2 <-get.table(nevidiff.Nevi.NN2, comparison, "sites", return.data.frame=TRUE)

# NN1 VS NN2
rnb.set.tmp <- remove.samples(combined.rnb.set.norm,samples(combined.rnb.set.norm)[combined.rnb.set.norm@pheno$Tumor=="Nevi"])
nevidiff.NN1.NN2 <- rnb.execute.computeDiffMeth(rnb.set.tmp,pheno.cols=c("Tumor"))
comparison <- get.comparisons(nevidiff.NN1.NN2)[1]
dmc.NN1.NN2 <-get.table(nevidiff.NN1.NN2, comparison, "sites", return.data.frame=TRUE)

table(dmc.Nevi.vs.NN1$diffmeth.p.adj.fdr<0.05 & abs(dmc.Nevi.vs.NN1$mean.diff)>.25)
table(dmc.Nevi.vs.NN2$diffmeth.p.adj.fdr<0.05 & abs(dmc.Nevi.vs.NN2$mean.diff)>.25)
table(dmc.NN1.NN2$diffmeth.p.adj.fdr<0.05 & abs(dmc.NN1.NN2$mean.diff)>.25)

N0vN1 <- which(dmc.Nevi.vs.NN1$diffmeth.p.adj.fdr<0.05 & abs(dmc.Nevi.vs.NN1$mean.diff)>.25)
N0vN2 <- which(dmc.Nevi.vs.NN2$diffmeth.p.adj.fdr<0.05 & abs(dmc.Nevi.vs.NN2$mean.diff)>.25)
N1vN2 <- which(dmc.NN1.NN2$diffmeth.p.adj.fdr<0.05 & abs(dmc.NN1.NN2$mean.diff)>.25)

NvN<-unique(c(N0vN1,N0vN2,N1vN2))
Nvnull<-unique(c(N0vnull,N1vnull,N2vnull))

length(NvN)
length(Nvnull)

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
clab[clab=="NewNevi1"]="green"
clab[clab=="NewNevi2"]="red"

beta <- meth(combined.rnb.set.norm,row.names=TRUE)

meth.norm.sig = beta[dmc_table$diffmeth.p.adj.fdr<0.05 & abs(dmc_table$mean.diff)>.25,]
meth.norm.sig = meth.norm.sig[complete.cases(meth.norm.sig),]

###################################################################################################

meth.norm.sig = beta[NvN,]
meth.norm.sig = meth.norm.sig[complete.cases(meth.norm.sig),]

png("heatmap-NvN.png",width= 3.25,
  height= 5.25,units="in",
  res=1200,pointsize=4)
heatmap.2(as.matrix(meth.norm.sig),col=colors,scale="none", trace="none",
          distfun = function(x) get_dist(x,method="pearson"),dendrogram='both',
xlab="", ylab="",key.title="Methylation lvl",ColSideColors=clab,labRow = FALSE,labCol=FALSE)
legend("topright",legend=c("Nevi","NewNevi1","NewNevi2"),fill=c("blue","green","red"), border=T, bty="n" )
dev.off()

meth.norm.sig = beta[Nvnull,]
meth.norm.sig = meth.norm.sig[complete.cases(meth.norm.sig),]

png("heatmap-NvNull.png",width= 3.25,
  height= 5.25,units="in",
  res=1200,pointsize=4)
x=heatmap.2(as.matrix(meth.norm.sig),col=colors,scale="none", trace="none",
          distfun = function(x) get_dist(x,method="pearson"),dendrogram='both',
xlab="", ylab="",key.title="Methylation lvl",ColSideColors=clab,labRow = FALSE,labCol=FALSE)
legend("topright",legend=c("Nevi","NewNevi1","NewNevi2"),fill=c("blue","green","red"), border=T, bty="n" )
dev.off()

###################################################################################################
hc <- as.hclust( x$rowDendrogram )
groups=cutree( hc, k=3 )
track2=as.numeric(groups)
colores2=c("grey","orange","purple")
clab2=(colores2[track2])

png("heatmap-NvNull_rowSideColors_K3.png",width= 3.25,
  height= 5.25,units="in",
  res=1200,pointsize=4)
x=heatmap.2(as.matrix(meth.norm.sig),col=colors,scale="none", trace="none",
          distfun = function(x) get_dist(x,method="pearson"),dendrogram='both',
xlab="", ylab="",key.title="Methylation lvl",RowSideColors=clab2,ColSideColors=clab,labRow = FALSE,labCol=FALSE)
legend("topright",legend=c("Nevi","NewNevi1","NewNevi2"),fill=c("blue","green","red"), border=T, bty="n" )
dev.off()


ix = which(info[,4] %in% names(groups)[groups==1] )
tmp = as.data.frame(info[ix,])
tmp = cbind(tmp[,1],tmp[,2]-1,tmp[,2]+1,tmp[,3:6])
write.table(tmp,"Nevi_GreyCluster.bed",quote=F,col.names=F,row.names=F,sep="\t")

ix = which(info[,4] %in% names(groups)[groups==2] )
tmp = as.data.frame(info[ix,])
tmp = cbind(tmp[,1],tmp[,2]-1,tmp[,2]+1,tmp[,3:6])
write.table(tmp,"Nevi_OrangeCluster.bed",quote=F,col.names=F,row.names=F,sep="\t")

ix = which(info[,4] %in% names(groups)[groups==3] )
tmp = as.data.frame(info[ix,])
tmp = cbind(tmp[,1],tmp[,2]-1,tmp[,2]+1,tmp[,3:6])
write.table(tmp,"Nevi_PurpleCluster.bed",quote=F,col.names=F,row.names=F,sep="\t")


###################################################################################################
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
###################################################################################################
###################################################################################################
###################################################################################################

rnb.set.norm=load.rnb.set("/home/rtm/vivek/navi/EPIC_2nd_batch/RnBeads/RnBeads_normalization/rnb.set.norm.filtered.RData.zip")
rnb.set.norm.new=load.rnb.set("/home/rtm/vivek/navi/new_epic/RnBeads/RnBeads_normalization/rnb.set.norm.filtered.RData.zip")

rnb.set.nevi=remove.samples(rnb.set.norm,samples(rnb.set.norm)[rnb.set.norm@pheno$Tumor!="Nevi"])

combined.rnb.set.norm <- combine(rnb.set.nevi, rnb.set.norm.new)

combined.rnb.set.norm@pheno$Tumor <- as.character(combined.rnb.set.norm@pheno$Tumor)
combined.rnb.set.norm@pheno$Tumor[24:31] <- "NewNevi1"
combined.rnb.set.norm@pheno$Tumor[32:39] <- "NewNevi2"
combined.rnb.set.norm@pheno$Tumor <- as.factor(combined.rnb.set.norm@pheno$Tumor)
######
beta <- meth(combined.rnb.set.norm,row.names=TRUE)
beta.sd <- apply(beta,1,sd)

clab=as.character(combined.rnb.set.norm@pheno$Tumor)

# 0.5 %
beta.005<-beta[ order(beta.sd,decreasing=TRUE)[1:round(length(beta.sd)*0.005)], ]

column_ha = HeatmapAnnotation(Type = clab, col = list(Type = c("Nevi" = "blue", "NewNevi1" = "green", "NewNevi2" = "purple") ) )

pdf("NEVI_SD_heatmap_top_0.005_cpg.pdf",width=9)
Heatmap(beta.005,
show_row_names = FALSE,show_column_names = TRUE,name = "Methylation",row_dend_reorder = TRUE, column_dend_reorder = TRUE,
column_title="Top 0.5% CpGs with the highest SD", column_title_side = "bottom", row_title="", row_title_side = "right",
top_annotation = column_ha, clustering_distance_columns = "pearson", clustering_distance_rows = "pearson")
dev.off()

# 1%
beta.005<-beta[ order(beta.sd,decreasing=TRUE)[1:round(length(beta.sd)*0.01)], ]

pdf("NEVI_SD_heatmap_top_0.01_cpg.pdf",width=9)
Heatmap(beta.005,
show_row_names = FALSE,show_column_names = TRUE,name = "Methylation",row_dend_reorder = TRUE, column_dend_reorder = TRUE,
column_title="Top 1% CpGs with the highest SD", column_title_side = "bottom", row_title="", row_title_side = "right",
top_annotation = column_ha, clustering_distance_columns = "pearson", clustering_distance_rows = "pearson")
dev.off()

# 2.5%
beta.005<-beta[ order(beta.sd,decreasing=TRUE)[1:round(length(beta.sd)*0.025)], ]

pdf("NEVI_SD_heatmap_top_0.025_cpg.pdf",width=9)
Heatmap(beta.005,
show_row_names = FALSE,show_column_names = TRUE,name = "Methylation",row_dend_reorder = TRUE, column_dend_reorder = TRUE,
column_title="Top 2.5% CpGs with the highest SD", column_title_side = "bottom", row_title="", row_title_side = "right",
top_annotation = column_ha, clustering_distance_columns = "pearson", clustering_distance_rows = "pearson")
dev.off()
# 5%
beta.005<-beta[ order(beta.sd,decreasing=TRUE)[1:round(length(beta.sd)*0.05)], ]

pdf("NEVI_SD_heatmap_top_0.05_cpg.pdf",width=9)
Heatmap(beta.005,
show_row_names = FALSE,show_column_names = TRUE,name = "Methylation",row_dend_reorder = TRUE, column_dend_reorder = TRUE,
column_title="Top 5% CpGs with the highest SD", column_title_side = "bottom", row_title="", row_title_side = "right",
top_annotation = column_ha, clustering_distance_columns = "pearson", clustering_distance_rows = "pearson")
dev.off()

##################
# Whiting groups 

rnb.set.norm.newNevi2=remove.samples(rnb.set.norm.new,samples(rnb.set.norm.new)[grep("_BN",rnb.set.norm.new@pheno$Sample_ID)])

tmpPheno <- rnb.set.norm.newNevi2@pheno
nevGroup = as.character(tmpPheno$Sample_ID)
nevGroup[grep("11-080",nevGroup)] <- "G1"
nevGroup[grep("11-078",nevGroup)] <- "G1"
nevGroup[grep("11-020",nevGroup)] <- "G1"

nevGroup[grep("11-166",nevGroup)] <- "G2"
nevGroup[grep("11-292",nevGroup)] <- "G2"
nevGroup[grep("12-277",nevGroup)] <- "G2"

nevGroup[grep("10-049",nevGroup)] <- "G3"
nevGroup[grep("11-281",nevGroup)] <- "G3"


tmpPheno <- data.frame(tmpPheno, nevGroup = nevGroup)
rnb.set.norm.newNevi2@pheno <- tmpPheno

newNevi2.diff <- rnb.execute.computeDiffMeth(rnb.set.norm.newNevi2,pheno.cols=c("nevGroup"))

dmc.NNG1.vs.non <-get.table(newNevi2.diff, get.comparisons(newNevi2.diff)[1], "sites", return.data.frame=TRUE)
dmc.NNG2.vs.non <-get.table(newNevi2.diff, get.comparisons(newNevi2.diff)[2], "sites", return.data.frame=TRUE)
dmc.NNG3.vs.non <-get.table(newNevi2.diff, get.comparisons(newNevi2.diff)[3], "sites", return.data.frame=TRUE)

table(dmc.NNG1.vs.non$diffmeth.p.adj.fdr<0.1 & abs(dmc.NNG1.vs.non$mean.diff)>.1)
table(dmc.NNG2.vs.non$diffmeth.p.adj.fdr<0.1 & abs(dmc.NNG2.vs.non$mean.diff)>.1) #2 cpg
table(dmc.NNG3.vs.non$diffmeth.p.adj.fdr<0.1 & abs(dmc.NNG3.vs.non$mean.diff)>.1) #10 cpg

N0vnull <- which(dmc.NNG1.vs.non$diffmeth.p.adj.fdr<0.1 & abs(dmc.NNG1.vs.non$mean.diff)>.25)
N1vnull <- which(dmc.NNG2.vs.non$diffmeth.p.adj.fdr<0.1 & abs(dmc.NNG2.vs.non$mean.diff)>.25)
N2vnull <- which(dmc.NNG3.vs.non$diffmeth.p.adj.fdr<0.1 & abs(dmc.NNG3.vs.non$mean.diff)>.25)

########################################################################################################################
########################################################################################################################
# G1 VS G2
rnb.set.tmp <- remove.samples(rnb.set.norm.newNevi2,samples(rnb.set.norm.newNevi2)[rnb.set.norm.newNevi2@pheno$nevGroup=="G3"])
nevidiff.G1.G2 <- rnb.execute.computeDiffMeth(rnb.set.tmp,pheno.cols=c("nevGroup"))
comparison <- get.comparisons(nevidiff.G1.G2)[1]
dmc.G1.vs.G2 <-get.table(nevidiff.G1.G2, comparison, "sites", return.data.frame=TRUE)

# G1 VS G3
rnb.set.tmp <- remove.samples(rnb.set.norm.newNevi2,samples(rnb.set.norm.newNevi2)[rnb.set.norm.newNevi2@pheno$nevGroup=="G2"])
nevidiff.G1.G3 <- rnb.execute.computeDiffMeth(rnb.set.tmp,pheno.cols=c("nevGroup"))
comparison <- get.comparisons(nevidiff.G1.G3)[1]
dmc.G1.vs.G3 <-get.table(nevidiff.G1.G3, comparison, "sites", return.data.frame=TRUE)

# G2 VS G3
rnb.set.tmp <- remove.samples(rnb.set.norm.newNevi2,samples(rnb.set.norm.newNevi2)[rnb.set.norm.newNevi2@pheno$nevGroup=="G1"])
nevidiff.G2.G3 <- rnb.execute.computeDiffMeth(rnb.set.tmp,pheno.cols=c("nevGroup"))
comparison <- get.comparisons(nevidiff.G2.G3)[1]
dmc.G2.vs.G3 <-get.table(nevidiff.G2.G3, comparison, "sites", return.data.frame=TRUE)


table(dmc.G1.vs.G2$diffmeth.p.adj.fdr<0.05 & abs(dmc.G1.vs.G2$mean.diff)>.25)
table(dmc.G1.vs.G3$diffmeth.p.adj.fdr<0.05 & abs(dmc.G1.vs.G3$mean.diff)>.25)
table(dmc.G2.vs.G3$diffmeth.p.adj.fdr<0.05 & abs(dmc.G2.vs.G3$mean.diff)>.25)
# VOLCANO

png("volcano_Nevi_G1.vs.G2.png",width= 3.25,
  height= 5.25,units="in",
  res=1200,pointsize=4)
dmc_table<-dmc.G1.vs.G2
plot(dmc_table$mean.diff,-log10(dmc_table$diffmeth.p.adj.fdr),xlab="Beta value difference",
              ylab=expression('-Log'[10]*' Q-values'),col=alpha("grey",.5),pch=20,xlim=c(-1,1),ylim=c(0,2) )
  abline(v=-.25,lty = 2,col="grey")
  abline(v=.25,lty = 2,col="grey")
  abline(h=-log10(0.05),lty = 2,col="grey")
  points(dmc_table$mean.diff[abs(dmc_table$mean.diff)>.25 & dmc_table$diffmeth.p.adj.fdr<0.05],
       -log10(dmc_table$diffmeth.p.adj.fdr)[abs(dmc_table$mean.diff)>.25 & dmc_table$diffmeth.p.adj.fdr<0.05],
      col="red",pch=20)
  legend("topright", paste("HiMeth NeviG1:",length(which(dmc_table$mean.diff>.25 & dmc_table$diffmeth.p.adj.fdr<0.05))), bty="n") 
  legend("topleft", paste("HiMeth NeviG2:",length(which(dmc_table$mean.diff<(-.25) & dmc_table$diffmeth.p.adj.fdr<0.05))), bty="n") 
  dev.off()

png("volcano_Nevi_G1.vs.G3.png",width= 3.25,
  height= 5.25,units="in",
  res=1200,pointsize=4)
dmc_table<-dmc.G1.vs.G3
plot(dmc_table$mean.diff,-log10(dmc_table$diffmeth.p.adj.fdr),xlab="Beta value difference",
              ylab=expression('-Log'[10]*' Q-values'),col=alpha("grey",.5),pch=20,xlim=c(-1,1),ylim=c(0,2) )
  abline(v=-.25,lty = 2,col="grey")
  abline(v=.25,lty = 2,col="grey")
  abline(h=-log10(0.05),lty = 2,col="grey")
  points(dmc_table$mean.diff[abs(dmc_table$mean.diff)>.25 & dmc_table$diffmeth.p.adj.fdr<0.05],
       -log10(dmc_table$diffmeth.p.adj.fdr)[abs(dmc_table$mean.diff)>.25 & dmc_table$diffmeth.p.adj.fdr<0.05],
      col="red",pch=20)
  legend("topright", paste("HiMeth NeviG1:",length(which(dmc_table$mean.diff>.25 & dmc_table$diffmeth.p.adj.fdr<0.05))), bty="n") 
  legend("topleft", paste("HiMeth NeviG3:",length(which(dmc_table$mean.diff<(-.25) & dmc_table$diffmeth.p.adj.fdr<0.05))), bty="n") 
  dev.off()

png("volcano_Nevi_G2.vs.G3.png",width= 3.25,
  height= 5.25,units="in",
  res=1200,pointsize=4)
dmc_table<-dmc.G2.vs.G3
plot(dmc_table$mean.diff,-log10(dmc_table$diffmeth.p.adj.fdr),xlab="Beta value difference",
              ylab=expression('-Log'[10]*' Q-values'),col=alpha("grey",.5),pch=20,xlim=c(-1,1),ylim=c(0,2) )
  abline(v=-.25,lty = 2,col="grey")
  abline(v=.25,lty = 2,col="grey")
  abline(h=-log10(0.05),lty = 2,col="grey")
  points(dmc_table$mean.diff[abs(dmc_table$mean.diff)>.25 & dmc_table$diffmeth.p.adj.fdr<0.05],
       -log10(dmc_table$diffmeth.p.adj.fdr)[abs(dmc_table$mean.diff)>.25 & dmc_table$diffmeth.p.adj.fdr<0.05],
      col="red",pch=20)
  legend("topright", paste("HiMeth NeviG2:",length(which(dmc_table$mean.diff>.25 & dmc_table$diffmeth.p.adj.fdr<0.05))), bty="n") 
  legend("topleft", paste("HiMeth NeviG3:",length(which(dmc_table$mean.diff<(-.25) & dmc_table$diffmeth.p.adj.fdr<0.05))), bty="n") 
  dev.off()
#
########################################################################################################################
########################################################################################################################

Nvnull<-unique(c(N0vnull,N1vnull,N2vnull))

length(Nvnull)

meth.norm.sig = beta[Nvnull,]
meth.norm.sig = meth.norm.sig[complete.cases(meth.norm.sig),]

png("heatmap-dmc_NewNevi2_3Groups.png",width= 3.25,
  height= 5.25,units="in",
  res=1200,pointsize=4)
x=heatmap.2(as.matrix(meth.norm.sig),col=colors,scale="none", trace="none",
          distfun = function(x) get_dist(x,method="pearson"),dendrogram='both',
xlab="", ylab="",key.title="Methylation lvl",ColSideColors=clab,labRow = FALSE,labCol=FALSE)
legend("topright",legend=c("Nevi","NewNevi1","NewNevi2"),fill=c("blue","green","red"), border=T, bty="n" )
dev.off()



nn2.beta <- meth(rnb.set.norm.newNevi2,row.names=TRUE)
beta.sd <- apply(nn2.beta,1,sd)


column_ha = HeatmapAnnotation(Type = as.character(rnb.set.norm.newNevi2@pheno$nevGroup),
                              col = list(Type = c("G1" = "red", "G2" = "blue", "G3" = "green") ) )


# 1%
beta.005<-nn2.beta[ order(beta.sd,decreasing=TRUE)[1:round(length(beta.sd)*0.01)], ]

pdf("NEVI_group2_SD_heatmap_top_0.01_cpg.pdf",width=9)
Heatmap(beta.005,
show_row_names = FALSE,show_column_names = TRUE,name = "Methylation",row_dend_reorder = TRUE, column_dend_reorder = TRUE,
column_title="Top 1% CpGs with the highest SD", column_title_side = "bottom", row_title="", row_title_side = "right",
top_annotation = column_ha, clustering_distance_columns = "pearson", clustering_distance_rows = "pearson")

dev.off()

# 2.5%
beta.005<-nn2.beta[ order(beta.sd,decreasing=TRUE)[1:round(length(beta.sd)*0.025)], ]
dim(beta.005)

pdf("NEVI_group2_SD_heatmap_top_0.025_cpg.pdf",width=9)
Heatmap(beta.005,
show_row_names = FALSE,show_column_names = TRUE,name = "Methylation",row_dend_reorder = TRUE, column_dend_reorder = TRUE,
column_title="Top 2.5% CpGs with the highest SD", column_title_side = "bottom", row_title="", row_title_side = "right",
top_annotation = column_ha, clustering_distance_columns = "pearson", clustering_distance_rows = "pearson")
dev.off()

# 5%
beta.005<-nn2.beta[ order(beta.sd,decreasing=TRUE)[1:round(length(beta.sd)*0.05)], ]
dim(beta.005)

pdf("NEVI_group2_SD_heatmap_top_0.05_cpg.pdf",width=9)
Heatmap(beta.005,
show_row_names = FALSE,show_column_names = TRUE,name = "Methylation",row_dend_reorder = TRUE, column_dend_reorder = TRUE,
column_title="Top 5% CpGs with the highest SD", column_title_side = "bottom", row_title="", row_title_side = "right",
top_annotation = column_ha, clustering_distance_columns = "pearson", clustering_distance_rows = "pearson")
dev.off()


######################################################################################################################################
######################################################################################################################################
######################################################################################################################################


Mutation_info = c(
  "NA", # VM1
  "NA", # VM2
  "NA", # VM3
  "NA", # VM4
  "BRAF", # VM5
  "BRAF", # VM6
  "BRAF", # VM7
  "BRAF", # VM8
  "BRAF", # VM9
  "BRAF", # VM10
  "BRAF", # VM11
  "BRAF", # VM12
  "BRAF", # VM13
  "BRAF", # VM14
  "NF1", # VM15
  "NF1", # VM16
  "BRAF", # VM17
  "BRAF", # VM18
  "BRAF", # VM19
  "BRAF", # VM20
  "NRAS", # VM21
  "NRAS", # VM22
  "BRAF", # VM23
  "BRAF", # VM24
  "NRAS", # VM25
  "NRAS", # VM26
  "NA", # VM27
  "NA", # VM28
  "BRAF", # VM29
  "BRAF", # VM30
  "NRAS", # VM31
  "NRAS", # VM32
  "NA", # VM33
  "NA", # VM34
  "BRAF", # VM35
  "BRAF", # VM36
  "BRAF", # VM37
  "BRAF", # VM38
  "BRAF", # VM39
  "BRAF", # VM40
  "BRAF", # VM41
  "BRAF", # VM42
  "BRAF", # VM43
  "BRAF", # VM44
  "BRAF", # VM45
  "BRAF", # VM46
  "BRAF", # VM47
  "BRAF") # VM48



naviOnly.rnb.set.norm = rnb.set.norm
naviOnly.rnb.set.norm@pheno <- data.frame(naviOnly.rnb.set.norm@pheno, Mutation = Mutation_info)
rnb.set.nevi=remove.samples(naviOnly.rnb.set.norm,samples(naviOnly.rnb.set.norm)[naviOnly.rnb.set.norm@pheno$Tumor!="Nevi"])
rnb.set.nevi.naviOnly <- remove.samples(rnb.set.nevi,samples(rnb.set.nevi)[rnb.set.nevi@pheno$Mutation=="NA"])

beta <- meth(rnb.set.nevi.naviOnly,row.names=TRUE)
beta.sd <- apply(beta,1,sd)

column_ha = HeatmapAnnotation(Mutation_Type = as.character(rnb.set.nevi.naviOnly@pheno$Mutation),
                              col = list(Mutation_Type = c("BRAF" = "blue", "NRAS" = "green", "NF1" = "purple") ) )

# 0.5 %
beta.005<-beta[ order(beta.sd,decreasing=TRUE)[1:round(length(beta.sd)*0.005)], ]
dim(beta.005)

pdf("NEVIonly_mutationType_SD_heatmap_top_0.005_cpg.pdf",width=9)
Heatmap(beta.005,
show_row_names = FALSE,show_column_names = TRUE,name = "Methylation",row_dend_reorder = TRUE, column_dend_reorder = TRUE,
column_title="Top 0.5% CpGs with the highest SD", column_title_side = "bottom", row_title="", row_title_side = "right",
top_annotation = column_ha, clustering_distance_columns = "pearson", clustering_distance_rows = "pearson")
dev.off()

# 1%
beta.005<-beta[ order(beta.sd,decreasing=TRUE)[1:round(length(beta.sd)*0.01)], ]

pdf("NEVIonly_mutationType_SD_heatmap_top_0.01_cpg.pdf",width=9)
Heatmap(beta.005,
show_row_names = FALSE,show_column_names = TRUE,name = "Methylation",row_dend_reorder = TRUE, column_dend_reorder = TRUE,
column_title="Top 1% CpGs with the highest SD", column_title_side = "bottom", row_title="", row_title_side = "right",
top_annotation = column_ha, clustering_distance_columns = "pearson", clustering_distance_rows = "pearson")
dev.off()

# 2.5%
beta.005<-beta[ order(beta.sd,decreasing=TRUE)[1:round(length(beta.sd)*0.025)], ]

pdf("NEVIonly_mutationType_SD_heatmap_top_0.025_cpg.pdf",width=9)
Heatmap(beta.005,
show_row_names = FALSE,show_column_names = TRUE,name = "Methylation",row_dend_reorder = TRUE, column_dend_reorder = TRUE,
column_title="Top 2.5% CpGs with the highest SD", column_title_side = "bottom", row_title="", row_title_side = "right",
top_annotation = column_ha, clustering_distance_columns = "pearson", clustering_distance_rows = "pearson")
dev.off()
# 5%
beta.005<-beta[ order(beta.sd,decreasing=TRUE)[1:round(length(beta.sd)*0.05)], ]

pdf("NEVIonly_mutationType_heatmap_top_0.05_cpg.pdf",width=9)
Heatmap(beta.005,
show_row_names = FALSE,show_column_names = TRUE,name = "Methylation",row_dend_reorder = TRUE, column_dend_reorder = TRUE,
column_title="Top 5% CpGs with the highest SD", column_title_side = "bottom", row_title="", row_title_side = "right",
top_annotation = column_ha, clustering_distance_columns = "pearson", clustering_distance_rows = "pearson")
dev.off()

##################
######################################################################################################################################
######################################################################################################################################
######################################################################################################################################
# NEVI BRAF+NRAS IN GROUP 1 + G2 + G3

Mutation_info = c(
  "NA", # VM1
  "NA", # VM2
  "NA", # VM3
  "NA", # VM4
  "BRAF", # VM5
  "BRAF", # VM6
  "BRAF", # VM7
  "BRAF", # VM8
  "BRAF", # VM9
  "BRAF", # VM10
  "BRAF", # VM11
  "BRAF", # VM12
  "BRAF", # VM13
  "BRAF", # VM14
  "NF1", # VM15
  "NF1", # VM16
  "BRAF", # VM17
  "BRAF", # VM18
  "BRAF", # VM19
  "BRAF", # VM20
  "NRAS", # VM21
  "NRAS", # VM22
  "BRAF", # VM23
  "BRAF", # VM24
  "NRAS", # VM25
  "NRAS", # VM26
  "NA", # VM27
  "NA", # VM28
  "BRAF", # VM29
  "BRAF", # VM30
  "NRAS", # VM31
  "NRAS", # VM32
  "NA", # VM33
  "NA", # VM34
  "BRAF", # VM35
  "BRAF", # VM36
  "BRAF", # VM37
  "BRAF", # VM38
  "BRAF", # VM39
  "BRAF", # VM40
  "BRAF", # VM41
  "BRAF", # VM42
  "BRAF", # VM43
  "BRAF", # VM44
  "BRAF", # VM45
  "BRAF", # VM46
  "BRAF", # VM47
  "BRAF") # VM48

rnb.set.norm.new=load.rnb.set("/home/rtm/vivek/navi/new_epic/RnBeads/RnBeads_normalization/rnb.set.norm.filtered.RData.zip")

rnb.set.norm=load.rnb.set("/home/rtm/vivek/navi/EPIC_2nd_batch/RnBeads/RnBeads_normalization/rnb.set.norm.filtered.RData.zip")
rnb.set.norm@pheno<- data.frame(rnb.set.norm@pheno,Mutation_info=Mutation_info)
rnb.set.norm@pheno$Mutation_info <- as.factor(rnb.set.norm@pheno$Mutation_info)

rnb.set.nevi=remove.samples(rnb.set.norm,samples(rnb.set.norm)[rnb.set.norm@pheno$Tumor!="Nevi"])
rnb.set.nevi=remove.samples(rnb.set.nevi,samples(rnb.set.nevi)[rnb.set.nevi@pheno$Mutation_info!="BRAF" & 
                                                               rnb.set.nevi@pheno$Mutation_info!="NRAS"])

combined.rnb.set.norm <- combine(rnb.set.nevi, rnb.set.norm.new)

combined.rnb.set.norm@pheno$Tumor <- as.character(combined.rnb.set.norm@pheno$Tumor)
combined.rnb.set.norm@pheno$Tumor[19:26] <- "NewNevi1"
combined.rnb.set.norm@pheno$Tumor[27:34] <- "NewNevi2"
combined.rnb.set.norm@pheno$Tumor <- as.factor(combined.rnb.set.norm@pheno$Tumor)

combined.rnb.set.norm@pheno$Mutation_info[is.na(combined.rnb.set.norm@pheno$Mutation_info)] <- "NA"

combined.rnb.set.norm@pheno$Mutation_info <- as.character(combined.rnb.set.norm@pheno$Mutation_info)
combined.rnb.set.norm@pheno$Mutation_info[19:26] <- "NewNevi1"
combined.rnb.set.norm@pheno$Mutation_info[27:34] <- "NewNevi2"
combined.rnb.set.norm@pheno$Mutation_info <- as.factor(combined.rnb.set.norm@pheno$Mutation_info)
######
beta <- meth(combined.rnb.set.norm,row.names=TRUE)
beta.sd <- apply(beta,1,sd)

clab=as.character(combined.rnb.set.norm@pheno$Mutation_info)

# 0.5 %
column_ha = HeatmapAnnotation(Type = clab, col = list(Type = c("BRAF" = "blue", "NRAS" = "green", 
                                                               "NewNevi1" = "orange", "NewNevi2" = "gold") ) )

# 0.5 %
beta.005<-beta[ order(beta.sd,decreasing=TRUE)[1:round(length(beta.sd)*0.005)], ]
dim(beta.005)

pdf("NEVIonly+NEWNEVI_mutationType_SD_heatmap_top_0.005_cpg.pdf",width=9)
Heatmap(beta.005,
show_row_names = FALSE,show_column_names = TRUE,name = "Methylation",row_dend_reorder = TRUE, column_dend_reorder = TRUE,
column_title="Top 0.5% CpGs with the highest SD", column_title_side = "bottom", row_title="", row_title_side = "right",
top_annotation = column_ha, clustering_distance_columns = "pearson", clustering_distance_rows = "pearson")
dev.off()

# 1%
beta.005<-beta[ order(beta.sd,decreasing=TRUE)[1:round(length(beta.sd)*0.01)], ]

pdf("NEVIonly+NEWNEVI_mutationType_SD_heatmap_top_0.01_cpg.pdf",width=9)
Heatmap(beta.005,
show_row_names = FALSE,show_column_names = TRUE,name = "Methylation",row_dend_reorder = TRUE, column_dend_reorder = TRUE,
column_title="Top 1% CpGs with the highest SD", column_title_side = "bottom", row_title="", row_title_side = "right",
top_annotation = column_ha, clustering_distance_columns = "pearson", clustering_distance_rows = "pearson")
dev.off()

# 2.5%
beta.005<-beta[ order(beta.sd,decreasing=TRUE)[1:round(length(beta.sd)*0.025)], ]

pdf("NEVIonly+NEWNEVI_mutationType_SD_heatmap_top_0.025_cpg.pdf",width=9)
Heatmap(beta.005,
show_row_names = FALSE,show_column_names = TRUE,name = "Methylation",row_dend_reorder = TRUE, column_dend_reorder = TRUE,
column_title="Top 2.5% CpGs with the highest SD", column_title_side = "bottom", row_title="", row_title_side = "right",
top_annotation = column_ha, clustering_distance_columns = "pearson", clustering_distance_rows = "pearson")
dev.off()
# 5%
beta.005<-beta[ order(beta.sd,decreasing=TRUE)[1:round(length(beta.sd)*0.05)], ]

pdf("NEVIonly+NEWNEVI_mutationType_heatmap_top_0.05_cpg.pdf",width=9)
Heatmap(beta.005,
show_row_names = FALSE,show_column_names = TRUE,name = "Methylation",row_dend_reorder = TRUE, column_dend_reorder = TRUE,
column_title="Top 5% CpGs with the highest SD", column_title_side = "bottom", row_title="", row_title_side = "right",
top_annotation = column_ha, clustering_distance_columns = "pearson", clustering_distance_rows = "pearson")
dev.off()

##################
