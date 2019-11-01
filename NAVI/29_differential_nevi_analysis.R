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
dmc.Nevi.vs.non <-get.table(nevidiff, get.comparisons(nevidiff)[1], "sites", return.data.frame=TRUE)
dmc.NN1.vs.non <-get.table(nevidiff, get.comparisons(nevidiff)[2], "sites", return.data.frame=TRUE)
dmc.NN2.vs.non <-get.table(nevidiff, get.comparisons(nevidiff)[3], "sites", return.data.frame=TRUE)

table(dmc.Nevi.vs.non$diffmeth.p.adj.fdr<0.05 & abs(dmc.Nevi.vs.non$mean.diff)>.25)
table(dmc.NN1.vs.non$diffmeth.p.adj.fdr<0.05 & abs(dmc.NN1.vs.non$mean.diff)>.25)
table(dmc.NN2.vs.non$diffmeth.p.adj.fdr<0.05 & abs(dmc.NN2.vs.non$mean.diff)>.25)

table(dmc.Nevi.vs.non$diffmeth.p.adj.fdr<0.05 & abs(dmc.Nevi.vs.non$mean.diff)>.50)
table(dmc.NN1.vs.non$diffmeth.p.adj.fdr<0.05 & abs(dmc.NN1.vs.non$mean.diff)>.50)
table(dmc.NN2.vs.non$diffmeth.p.adj.fdr<0.05 & abs(dmc.NN2.vs.non$mean.diff)>.50)

N0vnull <- which(dmc.Nevi.vs.non$diffmeth.p.adj.fdr<0.05 & abs(dmc.Nevi.vs.non$mean.diff)>.25)
N1vnull <- which(dmc.NN1.vs.non$diffmeth.p.adj.fdr<0.05 & abs(dmc.NN1.vs.non$mean.diff)>.25)
N2vnull <- which(dmc.NN2.vs.non$diffmeth.p.adj.fdr<0.05 & abs(dmc.NN2.vs.non$mean.diff)>.25)

##########


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
