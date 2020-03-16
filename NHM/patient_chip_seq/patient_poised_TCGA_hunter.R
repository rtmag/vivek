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

beta <- readRDS("beta_promoter.rds")

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
meth.norm.centered = beta_poised
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

#######################################################################
