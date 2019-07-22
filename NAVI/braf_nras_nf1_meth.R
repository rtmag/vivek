
############################################################################################
suppressMessages(library(RnBeads))
options(bitmapType="cairo")
options(scipen=999)
############################################################################################
rnb.set.norm=load.rnb.set("/home/rtm/vivek/navi/EPIC_2nd_batch/RnBeads/RnBeads_normalization/rnb.set.norm.filtered.RData.zip")
############################################################################################
rnb.set.norm@pheno = data.frame(rnb.set.norm@pheno, 
           BRAF = c("WT","WT","NA","NA","NA","NA","MUT","MUT","MUT","MUT","MUT","MUT","NA","NA",
           "WT","NA","MUT","NA","MUT","MUT","NA","WT","MUT","NA","WT","WT","NA","NA","MUT","NA",
           "WT","WT","WT","WT","NA","NA","NA","NA","NA","NA","NA","NA","WT","MUT","MUT","NA","NA","NA"),
           
           NRAS = c("WT","WT","NA","NA","NA","NA","MUT","MUT","WT","WT","WT","WT","NA","NA",
           "WT","NA","WT","NA","WT","WT","NA","MUT","WT","NA","MUT","MUT","NA","NA","WT","NA","MUT",
           "MUT","WT","WT","NA","NA","NA","NA","NA","NA","NA","NA","WT","WT","WT","NA","NA","NA"),
           
           NF1 = c("WT","WT","NA","NA","NA","NA","MUT","MUT","MUT","MUT","WT","WT","NA","NA",
           "MUT","NA","WT","NA","WT","WT","NA","WT","MUT","NA","WT","WT","NA","NA","WT","NA",
           "WT","WT","WT","WT","NA","NA","NA","NA","NA","NA","NA","NA","MUT","WT","WT","NA","NA","NA") )
           
           
           
############################################################################################
                    
meth.norm<-meth(rnb.set.norm)
colnames(meth.norm) = as.character(rnb.set.norm@pheno[,1])
rownames(meth.norm) = rownames(rnb.set.norm@sites)
mval.norm <- mval(rnb.set.norm,row.names=T)

