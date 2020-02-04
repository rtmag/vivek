############################################################################################
suppressMessages(library(RnBeads))
options(bitmapType="cairo")
options(scipen=999)
library(RColorBrewer)
colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(9))

############################################################################################
rnb.set.norm=load.rnb.set("/home/rtm/vivek/navi/EPIC_2nd_batch/RnBeads/RnBeads_normalization/rnb.set.norm.RData.zip")

rnb.set.norm@pheno = data.frame(rnb.set.norm@pheno, 
           Tumor = c("Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi",
                     "Melanoma","MIS","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi",
                    "Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi",
                    "Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi",
                    "Melanoma","Nevi","Nevi","Melanoma","Melanoma","Nevi","Melanoma","Nevi",
                    "Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi"),
           Patient = c("1","1","2","2","3","3","4","4",
                     "5","5","6","6","7","7","8","8",
                      "9","9","10","10","11","11","12","12",
                      "13","13","14","14","15","15","16","16",
                      "17","17","18","18","19","19","20","20",
                      "21","21","22","22","23","23","24","24") )

rnb.set.norm@pheno = data.frame(rnb.set.norm@pheno,sample
############################################################################################
# CDKN2A
chrom <- "chr9"
start <- 21962751
end <-   21999999

sample.grouping <- list()
samples <- 1:48
sample.grouping$Melanoma <- samples[rnb.set.norm@pheno$Tumor=="Melanoma"]
sample.grouping$Nevi <- samples[rnb.set.norm@pheno$Tumor=="Nevi"]

pdf("CDKN2A_NEVI_METH_SHOT.pdf",height=12,width=12)
rnb.plot.locus.profile(rnb.set.norm,chrom,start,end,grps=sample.grouping,smooth.profile="narrow",
                      cvals.meth =c("#0031f7","#0031f7","grey","#AD0021","#AD0021") )
dev.off()

patient.grp <- as.numeric(as.character(rnb.set.norm@pheno$Patient))
for(i in 1:max(patient.grp) ){
  rnb.options("identifiers.column"= 1) 
  rnb.set.norm_i=remove.samples(rnb.set.norm,samples(rnb.set.norm)[patient.grp!=i])
  sample.grouping_i <- list()
  samples_i <- 1:2
  sample.grouping_i$Melanoma <- samples_i[rnb.set.norm_i@pheno$Tumor=="Melanoma"]
  sample.grouping_i$Nevi <- samples_i[rnb.set.norm_i@pheno$Tumor!="Melanoma"]

  title<-paste0("CDKN2A_NEVI_METH_SHOT_patient",i,".pdf")
  pdf(title)
  rnb.plot.locus.profile(rnb.set.norm_i,chrom,start,end,grps=sample.grouping_i,
                         smooth.profile="narrow",cvals.meth =c("#0031f7","#0031f7","grey","#AD0021","#AD0021") )
  dev.off()
}

# fixing patient 18
  rnb.set.norm_pat18=remove.samples(rnb.set.norm,samples(rnb.set.norm)[patient.grp!=18])
  rnb.set.norm_pat18_mel=remove.samples(rnb.set.norm_pat18,samples(rnb.set.norm_pat18)[1])
  rnb.set.norm_pat18_nev=remove.samples(rnb.set.norm_pat18,samples(rnb.set.norm_pat18)[2])

  fixed.rnb.set.norm_pat18 <- combine(rnb.set.norm_pat18_mel, rnb.set.norm_pat18_nev)

  rnb.options("identifiers.column"= 1) 
  sample.grouping_i <- list()
  samples_i <- 1:2
  sample.grouping_i$Melanoma <- samples_i[fixed.rnb.set.norm_pat18@pheno$Tumor=="Melanoma"]
  sample.grouping_i$Nevi <- samples_i[fixed.rnb.set.norm_pat18@pheno$Tumor=="Nevi"]

  title<-paste0("CDKN2A_NEVI_METH_SHOT_patient18.pdf")
  pdf(title)
  rnb.plot.locus.profile(fixed.rnb.set.norm_pat18,chrom,start,end,grps=sample.grouping_i,
                         smooth.profile="narrow",cvals.meth =c("#0031f7","#0031f7","grey","#AD0021","#AD0021") )
  dev.off()

#  rnb.options("identifiers.column"= NULL) 



