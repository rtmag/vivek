source("https://raw.githubusercontent.com/rtmag/refactor/master/R/refactor.R")
options(scipen=999)
library(gplots)
library(factoextra)
library(RColorBrewer)

 tumor = c("Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi",
                     "Melanoma","MIS","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi",
                    "Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi",
                    "Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi",
                    "Melanoma","Nevi","Nevi","Melanoma","Melanoma","Nevi","Melanoma","Nevi",
                    "Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi")
                    
meth.filtered = readRDS("meth.filtered.rds")

meth.filtered.centered = readRDS("meth.filtered.centered.rds")
# Select CpGs with difference of no more than 10% BetaScore in at least one paired patient sample
idx = meth.filtered.centered[rowSums(meth.filtered.centered >=0 & meth.filtered.centered <=0.05 ) >= 8, ]
##########################################################################################
nevi = meth.filtered[,tumor=="Nevi"]
datafile = nevi
colors <- rev(colorRampPalette( (brewer.pal(9, "PuOr")) )(9))
#

k = 10
results <- refactor(datafile,k)

png("heatmap_REFACTOR_K10_NEVI_10KCpG.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
all.meth.norm = nevi[rownames(nevi) %in% head(names(results$RankedProbeNames[1,]),10000), ]
heatmap.2(as.matrix(all.meth.norm),col=colors,scale="none", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="", ylab="CpGs",key.title="Methylation lvl")
dev.off()

k = 8
results <- refactor(datafile,k)
png("heatmap_REFACTOR_K8_NEVI_10KCpG.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
all.meth.norm = nevi[rownames(nevi) %in% head(names(results$RankedProbeNames[1,]),10000), ]
heatmap.2(as.matrix(all.meth.norm),col=colors,scale="none", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="", ylab="CpGs",key.title="Methylation lvl")
dev.off()

k = 6
results <- refactor(datafile,k)
png("heatmap_REFACTOR_K6_NEVI_10KCpG.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
all.meth.norm = nevi[rownames(nevi) %in% head(names(results$RankedProbeNames[1,]),10000), ]
heatmap.2(as.matrix(all.meth.norm),col=colors,scale="none", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="", ylab="CpGs",key.title="Methylation lvl")
dev.off()

k = 5
results <- refactor(datafile,k)
png("heatmap_REFACTOR_K5_NEVI_10KCpG.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
all.meth.norm = nevi[rownames(nevi) %in% head(names(results$RankedProbeNames[1,]),10000), ]
heatmap.2(as.matrix(all.meth.norm),col=colors,scale="none", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="", ylab="CpGs",key.title="Methylation lvl")
dev.off()


k = 3
results <- refactor(datafile,k)
png("heatmap_REFACTOR_K3_NEVI_10KCpG.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
all.meth.norm = nevi[rownames(nevi) %in% head(names(results$RankedProbeNames[1,]),10000), ]
heatmap.2(as.matrix(all.meth.norm),col=colors,scale="none", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="", ylab="CpGs",key.title="Methylation lvl")
dev.off()

k = 4
results <- refactor(datafile,k)
png("heatmap_REFACTOR_K4_NEVI_10KCpG.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
all.meth.norm = nevi[rownames(nevi) %in% head(names(results$RankedProbeNames[1,]),10000), ]
heatmap.2(as.matrix(all.meth.norm),col=colors,scale="none", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="", ylab="CpGs",key.title="Methylation lvl")
dev.off()

melanoma = meth.filtered[,tumor=="Melanoma"]
png("heatmap_REFACTOR_K4_NEVI_projectedMELANOMA_10KCpG.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
all.meth.norm = melanoma[rownames(melanoma) %in% head(names(results$RankedProbeNames[1,]),10000), ]
heatmap.2(as.matrix(all.meth.norm),col=colors,scale="none", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="", ylab="CpGs",key.title="Methylation lvl")
dev.off()

png("heatmap_REFACTOR_K4_NEVI_projectedBOTH_NoDiffPatiets_8440CpG.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
all.meth.norm = meth.filtered[rownames(meth.filtered) %in% head(names(results$RankedProbeNames[1,]),8440), ]
all.meth.norm= all.meth.norm[rownames(all.meth.norm) %in% rownames(idx),]
heatmap.2(as.matrix(all.meth.norm),col=colors,scale="none", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="", ylab="CpGs",key.title="Methylation lvl")
dev.off()

####################################################################################
idx = meth.filtered.centered[rowSums(meth.filtered.centered >=0 & meth.filtered.centered <=0.05 ) >= 24, ]

png("heatmap_REFACTOR_K4_NEVI_projectedBOTH_NoDiffPatiets_8440CpG.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
all.meth.norm = meth.filtered[rownames(meth.filtered) %in% head(names(results$RankedProbeNames[1,]),100000), ]
all.meth.norm= all.meth.norm[rownames(all.meth.norm) %in% rownames(idx),]
heatmap.2(as.matrix(all.meth.norm),col=colors,scale="none", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="", ylab=paste(dim(all.meth.norm)[1],"CpGs"),key.title="Methylation lvl")
dev.off()



####################################################################################
rowSums(meth.filtered.centered >=0 & meth.filtered.centered <=0.05 ) >= 24
