# on tblab server
suppressMessages(library(RnBeads))
options(bitmapType="cairo")
options(scipen=999)

rnb.set.filtered=load.rnb.set("/home/rtm/vivek/navi/EPIC_2nd_batch/RnBeads/RnBeads_normalization/rnb.set.norm.filtered.RData.zip")
beta_promoter<-meth(rnb.set.filtered,type = "promoters",row.names=T)
saveRDS(beta_promoter,"beta_promoter.rds")
####################################################################################################################################
# scp -i /Users/wone/CSI/tblab_access/rtm/id_rsa rtm@137.132.97.29:/home/rtm/vivek/navi/prame/beta_promoter.rds .
####################################################################################################################################
hunter <- read.csv("PRC2cluster-CancerCell.csv")
hunter <- as.character(hunter[,1])

poised <- read.table("poised_kmeans_zmet_5k_3clusters.bed",sep="\t",header=FALSE,stringsAsFactors=FALSE)

beta <- readRDS("beta_promoter.rds")

library(clusterProfiler)
library(org.Hs.eg.db)
             
gene.df <- bitr(rownames(beta), fromType = "ENSEMBL",
                        toType = c( "ENTREZID", "SYMBOL"),
                        OrgDb = org.Hs.eg.db)
                        
ix <- match(rownames(beta),gene.df[,1])
