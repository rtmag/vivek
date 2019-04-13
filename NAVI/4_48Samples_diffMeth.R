############################################################################################
suppressMessages(library(RnBeads))
options(bitmapType="cairo")
options(scipen=999)
############################################################################################
rnb.set.norm=load.rnb.set("/home/rtm/vivek/navi/EPIC_2nd_batch/RnBeads/RnBeads_normalization/rnb.set.norm.RData.zip")

meth.norm<-meth(rnb.set.norm)
colnames(meth.norm) = as.character(rnb.set.norm@pheno[,1])
rownames(meth.norm) = rownames(rnb.set.norm@sites)
mval.norm <- mval(rnb.set.norm,row.names=T)

#saveRDS(meth.norm,"beta_48samples.RDS")
############################################################################################
############################################################################################
rnb.set.norm@pheno = data.frame(rnb.set.norm@pheno, 
           Tumor = c("Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi",
                     "Melanoma","MIS","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi",
                    "Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi",
                    "Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi",
                    "Melanoma","Nevi","Nevi","Melanoma","Melanoma","Nevi","Melanoma","Nevi",
                    "Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi"),
           Patient = c("1","1","2","2","3","3","4","4",
                     "5","5","6","6","7","7","8","8",
                      "9","9","10","10","11","11","12","12",
                      "13","13","14","14","15","15","16","16",
                      "17","17","18","18","19","19","20","20",
                      "21","21","22","22","23","23","24","24") )
############################################################################################
rnb.set.filtered <- rnb.execute.context.removal(rnb.set.norm)$dataset
rnb.set.filtered <- rnb.execute.sex.removal(rnb.set.filtered)$dataset
rnb.set.filtered <- rnb.execute.snp.removal(rnb.set.filtered, snp="any")$dataset
rnb.set.filtered <- rnb.execute.na.removal(rnb.set.filtered)$dataset
save.rnb.set(rnb.set.filtered,path="/home/rtm/vivek/navi/EPIC_2nd_batch/RnBeads/RnBeads_normalization/rnb.set.norm.filtered.RData")
#######################################################################
rnb.set.norm_no910=remove.samples(rnb.set.norm,samples(rnb.set.filtered)[9:10])
rnb.options("columns.pairing"=c("Tumor"="Patient"))
rnb.options("differential.variability"=FALSE)
# Multiprocess
num.cores <- 20
parallel.setup(num.cores)
diff_path = file.path("/home/rtm/vivek/navi/EPIC_2nd_batch/RnB_Diff_report")

#rnb.run.differential(rnb.set.norm_no910,diff_path)

MvsN_dmc <- rnb.execute.computeDiffMeth(rnb.set.norm_no910,pheno.cols=c("Tumor"))

comparison <- get.comparisons(MvsN_dmc)[1]
dmc_table <-get.table(MvsN_dmc, comparison, "sites", return.data.frame=TRUE)

#####################
genes_table <-get.table(MvsN_dmc, comparison, "genes", return.data.frame=TRUE)
gns = read.csv("/home/rtm/vivek/navi/EPIC_2nd_batch/RnB_Diff_report/differential_methylation_data/diffMethTable_region_cmp16_genes.csv")
genes_table = cbind(gns[,1:5],genes_table)
table(genes_table$comb.p.adj.fdr<0.05 & abs(genes_table$mean.mean.diff)>.15)
x=genes_table[genes_table$comb.p.adj.fdr<0.05 & abs(genes_table$mean.mean.diff)>.15,]
write.csv(x, "MvsN_genes.csv")
#####################
#####################
genes_table <-get.table(MvsN_dmc, comparison, "promoters", return.data.frame=TRUE)
gns=read.csv("/home/rtm/vivek/navi/EPIC_2nd_batch/RnB_Diff_report/differential_methylation_data/diffMethTable_region_cmp16_promoters.csv")
genes_table = cbind(gns[,1:5],genes_table)
table(genes_table$comb.p.adj.fdr<0.05 & abs(genes_table$mean.mean.diff)>.15)
x=genes_table[genes_table$comb.p.adj.fdr<0.05 & abs(genes_table$mean.mean.diff)>.15,]
write.csv(x, "MvsN_promoters.csv")
#####################
write.csv(dmc_table,"melanoma_vs_nevi_DMC_table.csv")
############################################################################################
rnb.options("differential.variability"=TRUE)
diff.var <- rnb.execute.diffVar(rnb.set.norm_no910,pheno.cols=c("Tumor"),region.types="sites")
comparison <- get.comparisons(diff.var)[1]
tab.sites <- get.table(diff.var,comparison,"sites",return.data.frame=TRUE)
############################################################################################

meth.norm <- readRDS("beta_48samples.RDS")
dmc_table <- read.csv("melanoma_vs_nevi_DMC_table.csv")


options(scipen=999)
library(gplots)
library(factoextra)
library(RColorBrewer)

track=as.character(rnb.set.norm@pheno$Tumor)
track[track=="Melanoma"]=1
track[track=="Nevi"]=2
track[track=="MIS"]=3


track=as.numeric(track)
colores=c("#ffb3ba","#baffc9","#bae1ff")
clab=as.character(colores[track])

colors <- rev(colorRampPalette( (brewer.pal(9, "PuOr")) )(20))


meth.norm.sig=meth.norm[which(dmc_table$diffmeth.p.adj.fdr<0.05 & abs(dmc_table$mean.diff)>.15),]
meth.norm.sig = meth.norm.sig[complete.cases(meth.norm.sig),]


png("heatmap_FDR5e-3_DIF80_no9_no10_Nocentered.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
x = heatmap.2(as.matrix(meth.norm.sig),col=colors,scale="none", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="", ylab="CpGs",key.title="Methylation lvl",ColSideColors=clab)
legend("topright",legend=c("Melanoma","Nevi","MIS"),fill=c("#ffb3ba","#baffc9","#bae1ff"), border=T, bty="n" )
dev.off()
############################################################################################
meth.norm.centered = meth.norm
for(ix in 1:dim(meth.norm)[1]){ 
           meth.norm.centered[ix,1] = meth.norm[ix,1]-mean(meth.norm[ix,1:2])
           meth.norm.centered[ix,2] = meth.norm[ix,2]-mean(meth.norm[ix,1:2])
           meth.norm.centered[ix,3] = meth.norm[ix,3]-mean(meth.norm[ix,3:4])
           meth.norm.centered[ix,4] = meth.norm[ix,4]-mean(meth.norm[ix,3:4])
           meth.norm.centered[ix,5] = meth.norm[ix,5]-mean(meth.norm[ix,5:6])
           meth.norm.centered[ix,6] = meth.norm[ix,6]-mean(meth.norm[ix,5:6])
           meth.norm.centered[ix,7] = meth.norm[ix,7]-mean(meth.norm[ix,7:8])
           meth.norm.centered[ix,8] = meth.norm[ix,8]-mean(meth.norm[ix,7:8])
           meth.norm.centered[ix,9] = meth.norm[ix,9]-mean(meth.norm[ix,9:10])
           meth.norm.centered[ix,10] = meth.norm[ix,10]-mean(meth.norm[ix,9:10])
           meth.norm.centered[ix,11] = meth.norm[ix,11]-mean(meth.norm[ix,11:12])
           meth.norm.centered[ix,12] = meth.norm[ix,12]-mean(meth.norm[ix,11:12])
           meth.norm.centered[ix,13] = meth.norm[ix,13]-mean(meth.norm[ix,13:14])
           meth.norm.centered[ix,14] = meth.norm[ix,14]-mean(meth.norm[ix,13:14])
           meth.norm.centered[ix,15] = meth.norm[ix,15]-mean(meth.norm[ix,15:16])
           meth.norm.centered[ix,16] = meth.norm[ix,16]-mean(meth.norm[ix,15:16])
           meth.norm.centered[ix,17] = meth.norm[ix,17]-mean(meth.norm[ix,17:18])
           meth.norm.centered[ix,18] = meth.norm[ix,18]-mean(meth.norm[ix,17:18])
           meth.norm.centered[ix,19] = meth.norm[ix,19]-mean(meth.norm[ix,19:20])
           meth.norm.centered[ix,20] = meth.norm[ix,20]-mean(meth.norm[ix,19:20])
           meth.norm.centered[ix,21] = meth.norm[ix,21]-mean(meth.norm[ix,21:22])
           meth.norm.centered[ix,22] = meth.norm[ix,22]-mean(meth.norm[ix,21:22])
           meth.norm.centered[ix,23] = meth.norm[ix,23]-mean(meth.norm[ix,23:24])
           meth.norm.centered[ix,24] = meth.norm[ix,24]-mean(meth.norm[ix,23:24])
           meth.norm.centered[ix,25] = meth.norm[ix,25]-mean(meth.norm[ix,25:26])
           meth.norm.centered[ix,26] = meth.norm[ix,26]-mean(meth.norm[ix,25:26])
           meth.norm.centered[ix,27] = meth.norm[ix,27]-mean(meth.norm[ix,27:28])
           meth.norm.centered[ix,28] = meth.norm[ix,28]-mean(meth.norm[ix,27:28])
           meth.norm.centered[ix,29] = meth.norm[ix,29]-mean(meth.norm[ix,29:30])
           meth.norm.centered[ix,30] = meth.norm[ix,30]-mean(meth.norm[ix,29:30])
           meth.norm.centered[ix,31] = meth.norm[ix,31]-mean(meth.norm[ix,31:32])
           meth.norm.centered[ix,32] = meth.norm[ix,32]-mean(meth.norm[ix,31:32])
           meth.norm.centered[ix,33] = meth.norm[ix,33]-mean(meth.norm[ix,33:34])
           meth.norm.centered[ix,34] = meth.norm[ix,34]-mean(meth.norm[ix,33:34])
           meth.norm.centered[ix,35] = meth.norm[ix,35]-mean(meth.norm[ix,35:36])
           meth.norm.centered[ix,36] = meth.norm[ix,36]-mean(meth.norm[ix,35:36])
           meth.norm.centered[ix,37] = meth.norm[ix,37]-mean(meth.norm[ix,37:38])
           meth.norm.centered[ix,38] = meth.norm[ix,38]-mean(meth.norm[ix,37:38])
           meth.norm.centered[ix,39] = meth.norm[ix,39]-mean(meth.norm[ix,39:40])
           meth.norm.centered[ix,40] = meth.norm[ix,40]-mean(meth.norm[ix,39:40])
           meth.norm.centered[ix,41] = meth.norm[ix,41]-mean(meth.norm[ix,41:42])
           meth.norm.centered[ix,42] = meth.norm[ix,42]-mean(meth.norm[ix,41:42])
           meth.norm.centered[ix,43] = meth.norm[ix,43]-mean(meth.norm[ix,43:44])
           meth.norm.centered[ix,44] = meth.norm[ix,44]-mean(meth.norm[ix,43:44])
           meth.norm.centered[ix,45] = meth.norm[ix,45]-mean(meth.norm[ix,45:46])
           meth.norm.centered[ix,46] = meth.norm[ix,46]-mean(meth.norm[ix,45:46])
           meth.norm.centered[ix,47] = meth.norm[ix,47]-mean(meth.norm[ix,47:48])
           meth.norm.centered[ix,48] = meth.norm[ix,48]-mean(meth.norm[ix,47:48])
}
#
meth.norm.centered = readRDS('meth.norm.centered.rds')

meth.norm.sig=meth.norm.centered[which(dmc_table$diffmeth.p.adj.fdr<0.05 & abs(dmc_table$mean.diff)>.15),]
meth.norm.sig = meth.norm.sig[complete.cases(meth.norm.sig),]
colors <- rev(colorRampPalette( (brewer.pal(9, "PuOr")) )(5))

png("heatmap_FDR5e-2_DIF15_no9_no10_centered.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
x = heatmap.2(as.matrix(meth.norm.sig),col=colors,scale="none", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="", ylab="CpGs",key.title="Methylation lvl",ColSideColors=clab)
legend("topright",legend=c("Melanoma","Nevi","MIS"),fill=c("#ffb3ba","#baffc9","#bae1ff"), border=T, bty="n" )
dev.off()

##############################################
# CpG obtention

hc <- as.hclust( x$rowDendrogram )
groups=cutree( hc, k=2 )
track2=as.numeric(groups)
colores2=c("red","blue")
clab2=(colores2[track2])

png("heatmap_FDR5e-2_DIF15_no9_no10_centered_obt.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
heatmap.2(as.matrix(meth.norm.sig),col=colors,scale="none", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="", ylab="CpGs",key.title="Methylation lvl",ColSideColors=clab,RowSideColors=clab2)
legend("topright",legend=c("Melanoma","Nevi","MIS"),fill=c("#ffb3ba","#baffc9","#bae1ff"), border=T, bty="n" )
dev.off()

site_anno_mel_vs_nevi = read.csv("../../RnB_Diff_report/mel_vs_nevi/tables/diffMethTable_site_cmp16.csv")

high_melanoma = site_anno_mel_vs_nevi[site_anno_mel_vs_nevi$cgid %in% names(which(groups==1)),]
high_nevi = site_anno_mel_vs_nevi[site_anno_mel_vs_nevi$cgid %in% names(which(groups==2)),]

write.csv(high_melanoma,"high_melanoma_diffMeth_CpG.csv")
write.csv(high_nevi,"high_nevi_diffMeth_CpG.csv")
##########################################################################################
nevi = meth.norm[,rnb.set.norm@pheno$Tumor=="Nevi"]
melanoma = meth.norm[,rnb.set.norm@pheno$Tumor=="Melanoma"]

meth.norm.sig=nevi[which(dmc_table$diffmeth.p.adj.fdr<0.05 & abs(dmc_table$mean.diff)>.15),]
meth.norm.sig = meth.norm.sig[complete.cases(meth.norm.sig),]
colors <- rev(colorRampPalette( (brewer.pal(9, "PuOr")) )(5))

png("heatmap_NEVI_FDR5e-2_DIF15_no9_no10_centered_obt.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
heatmap.2(as.matrix(meth.norm.sig),col=colors,scale="none", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="", ylab="CpGs",key.title="Methylation lvl",RowSideColors=clab2)
dev.off()

meth.norm.sig=melanoma[which(dmc_table$diffmeth.p.adj.fdr<0.05 & abs(dmc_table$mean.diff)>.15),]
meth.norm.sig = meth.norm.sig[complete.cases(meth.norm.sig),]
colors <- rev(colorRampPalette( (brewer.pal(9, "PuOr")) )(5))

png("heatmap_MELANOMA_FDR5e-2_DIF15_no9_no10_centered_obt.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
heatmap.2(as.matrix(meth.norm.sig),col=colors,scale="none", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="", ylab="CpGs",key.title="Methylation lvl",RowSideColors=clab2)
dev.off()

############################################################################################
# Variance analysis
nevi = mval.norm[,rnb.set.norm@pheno$Tumor=="Nevi"]
melanoma = mval.norm[,rnb.set.norm@pheno$Tumor=="Melanoma"]

neviSD = apply(nevi,1,sd)
melanomaSD = apply(melanoma,1,sd)
allSD = apply(melanoma,1,sd)
############################################################################################
############## Meth PCA
# Nevi VS melanoma
pca <- prcomp(x, center = TRUE,scale. = TRUE)

 Tumor = c("Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi",
                     "Melanoma","MIS","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi",
                    "Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi",
                    "Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi",
                    "Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi",
                    "Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi")

track = Tumor
track[track=="Melanoma"]=1
track[track=="Nevi"]=2
track[track=="MIS"]=3

track=as.numeric(track)
colores=c("red","green","blue")
clab=as.character(colores[track])

sx=summary(pca)

pdf("PCA_Nevi_vs_melanoma_FDR5e-2_DIF15_no9_no10_centered.pdf")
plot(pca$rotation[,1],pca$rotation[,2],col=clab,pch=19,
    xlab=paste("PCA1:",round(sx$importance[2,1]*100,digits=1),"%"),ylab=paste("PCA2:",round(sx$importance[2,2]*100,digits=1),"%"))
legend("topright",legend=c("Melanoma","Nevi","MIS"),fill=c("red","green","blue"), border=T, bty="n" )
dev.off()

# 1% NEVI 8668
topnevi = tail(sort(neviSD),8668)
nevi.meth.norm = meth.norm[rownames(meth.norm) %in% names(topnevi), rnb.set.norm@pheno$Tumor=="Nevi"]

png("heatmap_top1_NEVI.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
x = heatmap.2(as.matrix(nevi.meth.norm),col=colors,scale="none", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="", ylab="CpGs",key.title="Methylation lvl")
dev.off()

# 1% MELANOMA 8668
topmelanoma = tail(sort(melanomaSD),8668)
melanoma.meth.norm = meth.norm[rownames(meth.norm) %in% names(topmelanoma), rnb.set.norm@pheno$Tumor=="Melanoma"]

png("heatmap_top1_Melanoma.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
x = heatmap.2(as.matrix(melanoma.meth.norm),col=colors,scale="none", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="", ylab="CpGs",key.title="Methylation lvl")
dev.off()


melanoma_variation = site_anno_mel_vs_nevi[site_anno_mel_vs_nevi$cgid %in% names(topmelanoma),]
nevi_variation = site_anno_mel_vs_nevi[site_anno_mel_vs_nevi$cgid %in% names(topnevi),]

table(melanoma_variation$Chromosome)
table(nevi_variation$Chromosome)

write.csv(melanoma_variation,"melanoma_variation_CpG.csv")
write.csv(nevi_variation,"nevi_variation_CpG.csv")

# 1% ALL 8668

 Tumor = c("Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi",
                     "Melanoma","MIS","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi",
                    "Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi",
                    "Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi",
                    "Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi",
                    "Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi")

track = Tumor
track[track=="Melanoma"]=1
track[track=="Nevi"]=2
track[track=="MIS"]=3

track=as.numeric(track)
colores=c("red","green","blue")
clab=as.character(colores[track])

topall = tail(sort(allSD),86680)
all.meth.norm = meth.norm[rownames(meth.norm) %in% names(topall), ]
pca <- prcomp(all.meth.norm, center = TRUE,scale. = TRUE)
sx=summary(pca)

pdf("PCA_top10Variation_all.pdf")
plot(pca$rotation[,1],pca$rotation[,2],col=clab,pch=19,
    xlab=paste("PCA1:",round(sx$importance[2,1]*100,digits=1),"%"),ylab=paste("PCA2:",round(sx$importance[2,2]*100,digits=1),"%"))
legend("topright",legend=c("Melanoma","Nevi","MIS"),fill=c("red","green","blue"), border=T, bty="n" )
dev.off()

topall = tail(sort(allSD),(86680/2))
all.meth.norm = meth.norm[rownames(meth.norm) %in% names(topall), ]
pca <- prcomp(all.meth.norm, center = TRUE,scale. = TRUE)
sx=summary(pca)

pdf("PCA_top5Variation_all.pdf")
plot(pca$rotation[,1],pca$rotation[,2],col=clab,pch=19,
    xlab=paste("PCA1:",round(sx$importance[2,1]*100,digits=1),"%"),ylab=paste("PCA2:",round(sx$importance[2,2]*100,digits=1),"%"))
legend("topright",legend=c("Melanoma","Nevi","MIS"),fill=c("red","green","blue"), border=T, bty="n" )
dev.off()

topall = tail(sort(allSD),(8668))
all.meth.norm = meth.norm[rownames(meth.norm) %in% names(topall), ]
pca <- prcomp(all.meth.norm, center = TRUE,scale. = TRUE)
sx=summary(pca)

pdf("PCA_top1Variation_all.pdf")
plot(pca$rotation[,1],pca$rotation[,2],col=clab,pch=19,
    xlab=paste("PCA1:",round(sx$importance[2,1]*100,digits=1),"%"),ylab=paste("PCA2:",round(sx$importance[2,2]*100,digits=1),"%"))
legend("topright",legend=c("Melanoma","Nevi","MIS"),fill=c("red","green","blue"), border=T, bty="n" )
dev.off()
############################################################################################
# Keep from nevi to Melanoma, but form groups whitin neva & melanoma
# 1) Remove sex CpGs
rnb.set.filtered <- rnb.execute.context.removal(rnb.set.norm)$dataset
rnb.set.filtered <- rnb.execute.sex.removal(rnb.set.filtered)$dataset
rnb.set.filtered <- rnb.execute.snp.removal(rnb.set.filtered, snp="any")$dataset
rnb.set.filtered <- rnb.execute.na.removal(rnb.set.filtered)$dataset
meth.filtered <-meth (rnb.set.filtered)
rownames(meth.filtered)<-rownames(rnb.set.filtered@sites)
# 2) Keep CpGs that have no difference between Nevi and Melanoma <.25 in at leasst one CpG
meth.filtered.centered = meth.norm.centered[rownames(meth.norm.centered) %in% rownames(meth.filtered),]
saveRDS(meth.filtered.centered,"meth.filtered.centered.rds")
saveRDS(meth.filtered,"meth.filtered.rds")
saveRDS(Tumor,"Tumor.rds")

# Select CpGs with difference of no more than 10% BetaScore in at least one paired patient sample
idx = meth.filtered.centered[rowSums(meth.filtered.centered >=0 & meth.filtered.centered <=0.05 ) >= 24, ]
# 
meth.filtered.centered = readRDS("meth.filtered.centered.rds")
meth.filtered = readRDS("meth.filtered.rds")
 tumor = c("Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi",
                     "Melanoma","MIS","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi",
                    "Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi",
                    "Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi",
                    "Melanoma","Nevi","Nevi","Melanoma","Melanoma","Nevi","Melanoma","Nevi",
                    "Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi")

nevi = meth.filtered[,tumor=="Nevi"]
melanoma = meth.filtered[,tumor=="Melanoma"]
