############################################################################################
suppressMessages(library(RnBeads))
options(scipen=999)
############################################################################################
rnb.set.norm=load.rnb.set("/home/rtm/vivek/navi/EPIC_2nd_batch/RnBeads/RnBeads_normalization/rnb.set.norm.RData.zip")

meth.norm<-meth(rnb.set.norm)
colnames(meth.norm) = as.character(rnb.set.norm@pheno[,1])
rownames(meth.norm) = rownames(rnb.set.norm@sites)
saveRDS(meth.norm,"beta_48samples.RDS")
############################################################################################
rnb.set.norm@pheno = data.frame(rnb.set.norm@pheno, 
           Tumor = c("Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi",
                     "Melanoma","MIS","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi",
                    "Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi",
                    "Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi",
                    "Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi",
                    "Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi"),
           Patient = c("1","1","2","2","3","3","4","4",
                     "5","5","6","6","7","7","8","8",
                      "9","9","10","10","11","11","12","12",
                      "13","13","14","14","15","15","16","16",
                      "17","17","18","18","19","19","20","20",
                      "21","21","22","22","23","23","24","24") )
############################################################################################
rnb.set.norm_no910=remove.samples(rnb.set.norm,samples(rnb.set.norm)[9:10])
rnb.options("columns.pairing"=c("Tumor"="Patient"))

MvsN_dmc <- rnb.execute.computeDiffMeth(rnb.set.norm_no910,pheno.cols=c("Tumor"))

comparison <- get.comparisons(MvsN_dmc)[1]
dmc_table <-get.table(MvsN_dmc, comparison, "sites", return.data.frame=TRUE)

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

# CENTERING
meth.norm.centered = meth.norm
for(ix in dim(meth.norm)[1]){
           meth.norm.centered[ix,1] = meth.norm[ix,1]-rowMeans(meth.norm[ix,1:2])
           meth.norm.centered[ix,2] = meth.norm[ix,2]-rowMeans(meth.norm[ix,1:2])
           meth.norm.centered[ix,3] = meth.norm[ix,3]-rowMeans(meth.norm[ix,3:4])
           meth.norm.centered[ix,4] = meth.norm[ix,4]-rowMeans(meth.norm[ix,3:4])
           meth.norm.centered[ix,5] = meth.norm[ix,5]-rowMeans(meth.norm[ix,5:6])
           meth.norm.centered[ix,6] = meth.norm[ix,6]-rowMeans(meth.norm[ix,5:6])
           meth.norm.centered[ix,7] = meth.norm[ix,7]-rowMeans(meth.norm[ix,7:8])
           meth.norm.centered[ix,8] = meth.norm[ix,8]-rowMeans(meth.norm[ix,7:8])
           meth.norm.centered[ix,9] = meth.norm[ix,9]-rowMeans(meth.norm[ix,9:10])
           meth.norm.centered[ix,10] = meth.norm[ix,10]-rowMeans(meth.norm[ix,9:10])
           meth.norm.centered[ix,11] = meth.norm[ix,11]-rowMeans(meth.norm[ix,11:12])
           meth.norm.centered[ix,12] = meth.norm[ix,12]-rowMeans(meth.norm[ix,11:12])
           meth.norm.centered[ix,13] = meth.norm[ix,13]-rowMeans(meth.norm[ix,13:14])
           meth.norm.centered[ix,14] = meth.norm[ix,14]-rowMeans(meth.norm[ix,13:14])
           meth.norm.centered[ix,15] = meth.norm[ix,15]-rowMeans(meth.norm[ix,15:16])
           meth.norm.centered[ix,16] = meth.norm[ix,16]-rowMeans(meth.norm[ix,15:16])
           meth.norm.centered[ix,17] = meth.norm[ix,17]-rowMeans(meth.norm[ix,17:18])
           meth.norm.centered[ix,18] = meth.norm[ix,18]-rowMeans(meth.norm[ix,17:18])
           meth.norm.centered[ix,19] = meth.norm[ix,19]-rowMeans(meth.norm[ix,19:20])
           meth.norm.centered[ix,20] = meth.norm[ix,20]-rowMeans(meth.norm[ix,19:20])
           meth.norm.centered[ix,21] = meth.norm[ix,21]-rowMeans(meth.norm[ix,21:22])
           meth.norm.centered[ix,22] = meth.norm[ix,22]-rowMeans(meth.norm[ix,21:22])
           meth.norm.centered[ix,23] = meth.norm[ix,23]-rowMeans(meth.norm[ix,23:24])
           meth.norm.centered[ix,24] = meth.norm[ix,24]-rowMeans(meth.norm[ix,23:24])
           meth.norm.centered[ix,25] = meth.norm[ix,25]-rowMeans(meth.norm[ix,25:26])
           meth.norm.centered[ix,26] = meth.norm[ix,26]-rowMeans(meth.norm[ix,25:26])
           meth.norm.centered[ix,27] = meth.norm[ix,27]-rowMeans(meth.norm[ix,27:28])
           meth.norm.centered[ix,28] = meth.norm[ix,28]-rowMeans(meth.norm[ix,27:28])
           meth.norm.centered[ix,29] = meth.norm[ix,29]-rowMeans(meth.norm[ix,29:30])
           meth.norm.centered[ix,30] = meth.norm[ix,30]-rowMeans(meth.norm[ix,29:30])
           meth.norm.centered[ix,31] = meth.norm[ix,31]-rowMeans(meth.norm[ix,31:32])
           meth.norm.centered[ix,32] = meth.norm[ix,32]-rowMeans(meth.norm[ix,31:32])
           meth.norm.centered[ix,33] = meth.norm[ix,33]-rowMeans(meth.norm[ix,33:34])
           meth.norm.centered[ix,34] = meth.norm[ix,34]-rowMeans(meth.norm[ix,33:34])
           meth.norm.centered[ix,35] = meth.norm[ix,35]-rowMeans(meth.norm[ix,35:36])
           meth.norm.centered[ix,36] = meth.norm[ix,36]-rowMeans(meth.norm[ix,35:36])
           meth.norm.centered[ix,37] = meth.norm[ix,37]-rowMeans(meth.norm[ix,37:38])
           meth.norm.centered[ix,38] = meth.norm[ix,38]-rowMeans(meth.norm[ix,37:38])
           meth.norm.centered[ix,39] = meth.norm[ix,39]-rowMeans(meth.norm[ix,39:40])
           meth.norm.centered[ix,40] = meth.norm[ix,40]-rowMeans(meth.norm[ix,39:40])
           meth.norm.centered[ix,41] = meth.norm[ix,41]-rowMeans(meth.norm[ix,41:42])
           meth.norm.centered[ix,42] = meth.norm[ix,42]-rowMeans(meth.norm[ix,41:42])
           meth.norm.centered[ix,43] = meth.norm[ix,43]-rowMeans(meth.norm[ix,43:44])
           meth.norm.centered[ix,44] = meth.norm[ix,44]-rowMeans(meth.norm[ix,43:44])
           meth.norm.centered[ix,45] = meth.norm[ix,45]-rowMeans(meth.norm[ix,45:46])
           meth.norm.centered[ix,46] = meth.norm[ix,46]-rowMeans(meth.norm[ix,45:46])
           meth.norm.centered[ix,47] = meth.norm[ix,47]-rowMeans(meth.norm[ix,47:48])
           meth.norm.centered[ix,48] = meth.norm[ix,48]-rowMeans(meth.norm[ix,47:48])
}
#

meth.norm.sig=meth.norm[which(dmc_table$diffmeth.p.adj.fdr<0.005 & abs(dmc_table[,3])>.80),]
meth.norm.sig = meth.norm.sig[complete.cases(meth.norm.sig),]

png("heatmap_FDR5e-3_DIF80_no9_no10.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
x = heatmap.2(as.matrix(meth.norm.sig),col=colors,scale="none", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="", ylab="CpGs",key.title="Methylation lvl",ColSideColors=clab)
legend("topright",legend=c("Melanoma","Nevi","MIS"),fill=c("#ffb3ba","#baffc9","#bae1ff"), border=T, bty="n" )
dev.off()
