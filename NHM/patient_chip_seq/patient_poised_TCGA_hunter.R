suppressMessages(library(RnBeads))
options(bitmapType="cairo")
options(scipen=999)

rnb.set.filtered=load.rnb.set("/root/TCGA/Rnbeads/SKCM/RnBeads_normalization/rnb.set.norm.RData.zip")
beta_promoter<-meth(rnb.set.filtered,type = "promoters",row.names=T)
saveRDS(beta_promoter,"SKCM_beta_promoter.rds")

####################################################################################################################################
# scp -i /Users/wone/CSI/tblab_access/rtm/id_rsa rtm@137.132.97.29:/home/rtm/vivek/navi/prame/beta_promoter.rds .
####################################################################################################################################

hunter <- read.csv("PRC2cluster-CancerCell.csv")
hunter <- as.character(hunter[,1])

poised <- read.table("poised_kmeans_zmet_5k_3clusters.bed",sep="\t",header=FALSE,stringsAsFactors=FALSE)

poised_in_hunter <- poised[,4][poised[,4] %in% hunter]

beta <- readRDS("SKCM_beta_promoter.rds")

library(clusterProfiler)
library(org.Hs.eg.db)
             
gene.df <- bitr(rownames(beta), fromType = "ENSEMBL",
                        toType = c( "ENTREZID", "SYMBOL"),
                        OrgDb = org.Hs.eg.db)
                        
ix <- match(rownames(beta),gene.df[,1])
beta <- beta[!is.na(ix),]
gene.df <- gene.df[ix[!is.na(ix)],]

rownames(beta) <- gene.df[,3]
####################################################################################################################################
beta_poised <- beta[rownames(beta) %in% poised[,4],]
beta_poised_in_hunter <- beta[rownames(beta) %in% poised_in_hunter,]

library(gplots)
library(factoextra)
library(RColorBrewer)

colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(9))

########################################################################
meth.norm = beta_poised

#######################################################################

png("heatmap_TCGA_poised_in_hunter_233_genes.png",width= 2,
  height= 3.25,units="in",
  res=1200,pointsize=4)
heatmap.2(as.matrix(beta_poised_in_hunter),col=colors,scale="none", 
          trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
          labRow = FALSE,labCol = "",xlab="", ylab="CpGs",key.title="Methylation lvl" )
dev.off()


png("heatmap_TCGA_poised.png",width= 2,
  height= 3.25,units="in",
  res=1200,pointsize=4)
heatmap.2(as.matrix(beta_poised),col=colors,scale="none", 
          trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
          labRow = FALSE,labCol = "",xlab="", ylab="CpGs",key.title="Methylation lvl" )
dev.off()
