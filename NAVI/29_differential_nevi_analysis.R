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

table(dmc.Nevi.vs.non$diffmeth.p.adj.fdr<0.01 & abs(dmc.Nevi.vs.non$mean.diff)>.40)
table(dmc.NN1.vs.non$diffmeth.p.adj.fdr<0.01 & abs(dmc.NN1.vs.non$mean.diff)>.40)
table(dmc.NN2.vs.non$diffmeth.p.adj.fdr<0.01 & abs(dmc.NN2.vs.non$mean.diff)>.40)

N0vnull <- which(dmc.Nevi.vs.non$diffmeth.p.adj.fdr<0.01 & abs(dmc.Nevi.vs.non$mean.diff)>.40)
N1vnull <- which(dmc.NN1.vs.non$diffmeth.p.adj.fdr<0.01 & abs(dmc.NN1.vs.non$mean.diff)>.40)
N2vnull <- which(dmc.NN2.vs.non$diffmeth.p.adj.fdr<0.01 & abs(dmc.NN2.vs.non$mean.diff)>.40)

Nvnull<-unique(c(N0vnull,N1vnull,N2vnull))
length(Nvnull)

#beta <- meth(combined.rnb.set.norm,row.names=TRUE)
meth.norm.sig = beta[Nvnull,]
meth.norm.sig = meth.norm.sig[complete.cases(meth.norm.sig),]

column_ha = HeatmapAnnotation(Type = as.character(combined.rnb.set.norm@pheno$Tumor), 
                              col = list(Type = c("Nevi" = "blue", "NewNevi1" = "green", "NewNevi2" = "orange") ) )

set.seed(10)
kmeans.mat<- kmeans(meth.norm.sig, 3)
table(kmeans.mat$cluster)

hmp<-Heatmap(meth.norm.sig,
show_row_names = FALSE,show_column_names = FALSE,name = "Methylation",row_dend_reorder = TRUE, column_dend_reorder = TRUE,
column_title="", column_title_side = "bottom", row_title="", row_title_side = "right",split=kmeans.mat$cluster, #km = 3,
top_annotation = column_ha, clustering_distance_columns = "pearson", clustering_distance_rows = "pearson",col=colors)

hmp = draw(hmp)

lapply(row_order(hmp), function(x) length(x) )

pdf("NEVI_differential_analysis_heatmap_40methdiff.pdf")
hmp
dev.off()
#####################################################
#main table C1
ix = which(info[,4] %in% names(kmeans.mat$cluster)[kmeans.mat$cluster==1] )
tmp = as.data.frame(info[ix,])
tmp = cbind(tmp[,1],tmp[,2],tmp[,2]+1,tmp[,3:6])
colnames(tmp)[1] <- "chr";colnames(tmp)[2] <- "start";colnames(tmp)[3] <- "end";
write.table(tmp,"NEVI_differential_analysis_cluster1_40methdiff.txt",quote=F,col.names=F,row.names=F,sep="\t")

#Pie chart C1
tmp$UCSC_RefGene_Group[tmp$UCSC_RefGene_Group==""]<-"Intergenic"
pietable<-table(unlist(lapply(strsplit(tmp$UCSC_RefGene_Group,";"),unique)))
names(pietable) = paste(names(pietable)," ",round(pietable/sum(pietable)*100,digits=2),"%",sep="")
pdf("NEVI_differential_analysis_cluster1_40methdiff_pie.pdf",width=12)
pie(sort(pietable), main="C1",cex=2)
dev.off()
       
#bed C1
bed <- tmp[,1:3]
rownames(bed) <- NULL
colnames(bed) <- NULL
bed[,2] <- bed[,2]-25
bed[,3] <- bed[,3]+25
write.table(bed,"NEVI_differential_analysis_cluster1_40methdiff.bed",quote=F,col.names=F,row.names=F,sep="\t")

#Gene.Table C1
gene.table1 <- sort(table(unlist(lapply(strsplit(tmp[,6],";"),unique))),decreasing=TRUE)
gene.table1 <- as.data.frame(gene.table1)
colnames(gene.table1) <- c("Gene","Ncpg")
write.table(gene.table1,"NEVI_differential_analysis_cluster1_40methdiff_genesAssociated.txt",quote=F,col.names=F,row.names=F,sep="\t")

#####################################################
#main table C2
ix = which(info[,4] %in% names(kmeans.mat$cluster)[kmeans.mat$cluster==2] )
tmp = as.data.frame(info[ix,])
tmp = cbind(tmp[,1],tmp[,2],tmp[,2]+1,tmp[,3:6])
colnames(tmp)[1] <- "chr";colnames(tmp)[2] <- "start";colnames(tmp)[3] <- "end";
write.table(tmp,"NEVI_differential_analysis_cluster2_40methdiff.txt",quote=F,col.names=F,row.names=F,sep="\t")

#Pie chart C2
tmp$UCSC_RefGene_Group[tmp$UCSC_RefGene_Group==""]<-"Intergenic"
pietable<-table(unlist(lapply(strsplit(tmp$UCSC_RefGene_Group,";"),unique)))
names(pietable) = paste(names(pietable)," ",round(pietable/sum(pietable)*100,digits=2),"%",sep="")
pdf("NEVI_differential_analysis_cluster2_40methdiff_pie.pdf",width=12)
pie(sort(pietable), main="C2",cex=2)
dev.off()
       
#bed C2
bed <- tmp[,1:3]
rownames(bed) <- NULL
colnames(bed) <- NULL
bed[,2] <- bed[,2]-25
bed[,3] <- bed[,3]+25
write.table(bed,"NEVI_differential_analysis_cluster2_40methdiff.bed",quote=F,col.names=F,row.names=F,sep="\t")

#Gene.Table C2
gene.table2 <- sort(table(unlist(lapply(strsplit(tmp[,6],";"),unique))),decreasing=TRUE)
gene.table2 <- as.data.frame(gene.table2)
colnames(gene.table2) <- c("Gene","Ncpg")
write.table(gene.table2,"NEVI_differential_analysis_cluster2_40methdiff_genesAssociated.txt",quote=F,col.names=F,row.names=F,sep="\t")
       
#####################################################
#main table C3
ix = which(info[,4] %in% names(kmeans.mat$cluster)[kmeans.mat$cluster==3] )
tmp = as.data.frame(info[ix,])
tmp = cbind(tmp[,1],tmp[,2],tmp[,2]+1,tmp[,3:6])
write.table(tmp,"NEVI_differential_analysis_cluster3_40methdiff.txt",quote=F,col.names=F,row.names=F,sep="\t")

#Pie chart C3
tmp$UCSC_RefGene_Group[tmp$UCSC_RefGene_Group==""]<-"Intergenic"
pietable<-table(unlist(lapply(strsplit(tmp$UCSC_RefGene_Group,";"),unique)))
names(pietable) = paste(names(pietable)," ",round(pietable/sum(pietable)*100,digits=2),"%",sep="")
pdf("NEVI_differential_analysis_cluster3_40methdiff_pie.pdf",width=12)
pie(sort(pietable), main="C3",cex=2)
dev.off()
       
#bed C3
bed <- tmp[,1:3]
rownames(bed) <- NULL
colnames(bed) <- NULL
bed[,2] <- bed[,2]-25
bed[,3] <- bed[,3]+25
write.table(tmp,"NEVI_differential_analysis_cluster3_40methdiff.bed",quote=F,col.names=F,row.names=F,sep="\t")

#Gene.Table C3
gene.table3 <- sort(table(unlist(lapply(strsplit(tmp[,6],";"),unique))),decreasing=TRUE)
gene.table3 <- as.data.frame(gene.table3)
colnames(gene.table3) <- c("Gene","Ncpg")
write.table(gene.table3,"NEVI_differential_analysis_cluster3_40methdiff_genesAssociated.txt",quote=F,col.names=F,row.names=F,sep="\t")
########################################################################################################################
library(clusterProfiler)
library(DOSE)
library(enrichplot)
library("org.Hs.eg.db")
       
geneEntrez <- list(Cluster1 = as.character(gene.table1[,1]),
    Cluster2 = as.character(gene.table2[,1]),
    Cluster3 = as.character(gene.table3[,1]))

#names(geneEntrez) <- c("Dis.H2+Myc","Pro.H2+Myc",
#                       "Dis.H2-Myc","Pro.H2-Myc")

x=compareCluster(geneEntrez, fun='enrichGO',
                 OrgDb         = org.Mm.eg.db,
                 ont           = "BP")
pdf("dotplot.pdf",height=10,width=10)
dotplot(x, showCategory=15, includeAll=FALSE)
dev.off()
########################################################################################################################
########################################################################################################################
# NN0 VS NN1
rnb.set.tmp <- remove.samples(combined.rnb.set.norm,samples(combined.rnb.set.norm)[combined.rnb.set.norm@pheno$Tumor=="NewNevi2"])
nevidiff.G1.G2 <- rnb.execute.computeDiffMeth(rnb.set.tmp,pheno.cols=c("Tumor"))
comparison <- get.comparisons(nevidiff.G1.G2)[1]
dmc.G1.vs.G2 <-get.table(nevidiff.G1.G2, comparison, "sites", return.data.frame=TRUE)

# NN0 VS NN2
rnb.set.tmp <- remove.samples(combined.rnb.set.norm,samples(combined.rnb.set.norm)[combined.rnb.set.norm@pheno$Tumor=="NewNevi1"])
nevidiff.G1.G3 <- rnb.execute.computeDiffMeth(rnb.set.tmp,pheno.cols=c("Tumor"))
comparison <- get.comparisons(nevidiff.G1.G3)[1]
dmc.G1.vs.G3 <-get.table(nevidiff.G1.G3, comparison, "sites", return.data.frame=TRUE)

# NN1 VS NN3
rnb.set.tmp <- remove.samples(combined.rnb.set.norm,samples(combined.rnb.set.norm)[combined.rnb.set.norm@pheno$Tumor=="Nevi"])
nevidiff.G2.G3 <- rnb.execute.computeDiffMeth(rnb.set.tmp,pheno.cols=c("Tumor"))
comparison <- get.comparisons(nevidiff.G2.G3)[1]
dmc.G2.vs.G3 <-get.table(nevidiff.G2.G3, comparison, "sites", return.data.frame=TRUE)


table(dmc.G1.vs.G2$diffmeth.p.adj.fdr<0.05 & abs(dmc.G1.vs.G2$mean.diff)>.3)
table(dmc.G1.vs.G3$diffmeth.p.adj.fdr<0.05 & abs(dmc.G1.vs.G3$mean.diff)>.3)
table(dmc.G2.vs.G3$diffmeth.p.adj.fdr<0.05 & abs(dmc.G2.vs.G3$mean.diff)>.3)
# VOLCANO

png("volcano_Nevi.vs.NewNevi1.png",width= 3.25,
  height= 5.25,units="in",
  res=1200,pointsize=4)
dmc_table<-dmc.G1.vs.G2
plot(dmc_table$mean.diff,-log10(dmc_table$diffmeth.p.adj.fdr),xlab="Beta value difference",
              ylab=expression('-Log'[10]*' Q-values'),col=alpha("grey",.5),pch=20,xlim=c(-1,1),ylim=c(0,2) )
  abline(v=-.5,lty = 2,col="grey")
  abline(v=.5,lty = 2,col="grey")
  abline(h=-log10(0.05),lty = 2,col="grey")
  points(dmc_table$mean.diff[abs(dmc_table$mean.diff)>.5 & dmc_table$diffmeth.p.adj.fdr<0.05],
       -log10(dmc_table$diffmeth.p.adj.fdr)[abs(dmc_table$mean.diff)>.5 & dmc_table$diffmeth.p.adj.fdr<0.05],
      col="red",pch=20)
  legend("topright", paste("HiMeth Nevi:",length(which(dmc_table$mean.diff>.5 & dmc_table$diffmeth.p.adj.fdr<0.05))), bty="n") 
  legend("topleft", paste("HiMeth NewNevi1:",length(which(dmc_table$mean.diff<(-.5) & dmc_table$diffmeth.p.adj.fdr<0.05))), bty="n") 
  dev.off()

png("volcano_Nevi.vs.NewNevi2.png",width= 3.25,
  height= 5.25,units="in",
  res=1200,pointsize=4)
dmc_table<-dmc.G1.vs.G3
plot(dmc_table$mean.diff,-log10(dmc_table$diffmeth.p.adj.fdr),xlab="Beta value difference",
              ylab=expression('-Log'[10]*' Q-values'),col=alpha("grey",.5),pch=20,xlim=c(-1,1),ylim=c(0,2) )
  abline(v=-.5,lty = 2,col="grey")
  abline(v=.5,lty = 2,col="grey")
  abline(h=-log10(0.05),lty = 2,col="grey")
  points(dmc_table$mean.diff[abs(dmc_table$mean.diff)>.5 & dmc_table$diffmeth.p.adj.fdr<0.05],
       -log10(dmc_table$diffmeth.p.adj.fdr)[abs(dmc_table$mean.diff)>.5 & dmc_table$diffmeth.p.adj.fdr<0.05],
      col="red",pch=20)
  legend("topright", paste("HiMeth Nevi:",length(which(dmc_table$mean.diff>.5 & dmc_table$diffmeth.p.adj.fdr<0.05))), bty="n") 
  legend("topleft", paste("HiMeth NewNevi2:",length(which(dmc_table$mean.diff<(-.5) & dmc_table$diffmeth.p.adj.fdr<0.05))), bty="n") 
  dev.off()

png("volcano_NewNevi1.vs.NewNevi2.png",width= 3.25,
  height= 5.25,units="in",
  res=1200,pointsize=4)
dmc_table<-dmc.G2.vs.G3
plot(dmc_table$mean.diff,-log10(dmc_table$diffmeth.p.adj.fdr),xlab="Beta value difference",
              ylab=expression('-Log'[10]*' Q-values'),col=alpha("grey",.5),pch=20,xlim=c(-1,1),ylim=c(0,2) )
  abline(v=-.5,lty = 2,col="grey")
  abline(v=.5,lty = 2,col="grey")
  abline(h=-log10(0.05),lty = 2,col="grey")
  points(dmc_table$mean.diff[abs(dmc_table$mean.diff)>.5 & dmc_table$diffmeth.p.adj.fdr<0.05],
       -log10(dmc_table$diffmeth.p.adj.fdr)[abs(dmc_table$mean.diff)>.5 & dmc_table$diffmeth.p.adj.fdr<0.05],
      col="red",pch=20)
  legend("topright", paste("HiMeth NewNevi1:",length(which(dmc_table$mean.diff>.5 & dmc_table$diffmeth.p.adj.fdr<0.05))), bty="n") 
  legend("topleft", paste("HiMeth NewNevi2:",length(which(dmc_table$mean.diff<(-.5) & dmc_table$diffmeth.p.adj.fdr<0.05))), bty="n") 
  dev.off()
#
########################################################################################################################
########################################################################################################################
