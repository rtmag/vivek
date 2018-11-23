suppressMessages(library(RnBeads))

rnb.set.norm=load.rnb.set("/home/rtm/vivek/navi/EPIC/RnBeads/RnBeads_normalization/rnb.set.norm.RData.zip")
rnb.set.norm@pheno = data.frame(rnb.set.norm@pheno, 
           Tumor = c("Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi",
                     "Melanoma","MIS","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi"),
           Patient = c("1","1","2","2","3","3","4","4",
                     "5","5","6","6","7","7","8","8") )

rnb.set.norm_no910=remove.samples(rnb.set.norm,samples(rnb.set.norm)[9:10])
