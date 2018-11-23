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
diff.var <- rnb.execute.diffVar(rnb.set,cmp.cols,region.types="sites")
comparison <- get.comparisons(diff.var)[1]
tab.sites <- get.table(diff.var,comparison,"sites",return.data.frame=TRUE)
                                        
