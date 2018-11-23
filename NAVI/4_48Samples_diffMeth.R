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
