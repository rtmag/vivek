suppressMessages(library(RnBeads))

options(scipen=999)
library(gplots)
library(factoextra)
library(RColorBrewer)
colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(9))

rnb.set.norm=load.rnb.set("/home/rtm/vivek/navi/EPIC_2nd_batch/RnBeads/RnBeads_normalization/rnb.set.norm.filtered.RData.zip")
rnb.set.norm.new=load.rnb.set("/home/rtm/vivek/navi/new_epic/RnBeads/RnBeads_normalization/rnb.set.norm.filtered.RData.zip")

rnb.set.nevi=remove.samples(rnb.set.norm,samples(rnb.set.norm)[rnb.set.norm@pheno$Tumor!="Nevi"])


combined.rnb.set.norm <- combine(rnb.set.nevi, rnb.set.norm.new)

combined.rnb.set.norm@pheno$Tumor <- as.character(combined.rnb.set.norm@pheno$Tumor)
combined.rnb.set.norm@pheno$Tumor[is.na(combined.rnb.set.norm@pheno$Tumor)] <- "NewNevi"
combined.rnb.set.norm@pheno$Tumor <- as.factor(combined.rnb.set.norm@pheno$Tumor)

nevidiff <- rnb.execute.computeDiffMeth(combined.rnb.set.norm,pheno.cols=c("Tumor"))
comparison <- get.comparisons(nevidiff)[1]
dmc_table <-get.table(nevidiff, comparison, "sites", return.data.frame=TRUE)


clab=combined.rnb.set.norm@pheno$Tumor
clab[clab=="Nevi"]="blue"
clab[clab=="NewNevi"]="green"

meth.norm.sig = meth.norm[BRAF_table$diffmeth.p.adj.fdr<0.1 | NRAS_table$diffmeth.p.adj.fdr<0.1 |NF1_table$diffmeth.p.adj.fdr<0.1,]

png("heatmap-test.png",width= 3.25,
  height= 5.25,units="in",
  res=1200,pointsize=4)
heatmap.3(as.matrix(meth.norm.sig),col=colors,scale="none", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="", ylab="CpGs",key.title="Methylation lvl",ColSideColors=as.matrix(clab))
dev.off()

legend("topright",legend=c("Melanoma","Nevi","MIS"),fill=c("#ffb3ba","#baffc9","#bae1ff"), border=T, bty="n" )
