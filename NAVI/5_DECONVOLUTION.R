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
nevi = meth.filtered[,tumor=="Nevi"]
k = 10
datafile = nevi
results <- refactor(datafile,k)

colors <- rev(colorRampPalette( (brewer.pal(9, "PuOr")) )(9))

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

k = 4
results <- refactor(datafile,k)
png("heatmap_REFACTOR_K4_NEVI_10KCpG.png",width= 3.25,
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

####################################################################################
library(sva)

edata = exprs(bladderEset)
mod = model.matrix(~as.factor(cancer), data=pheno)
n.sv = num.sv(edata,mod,method="leek")
