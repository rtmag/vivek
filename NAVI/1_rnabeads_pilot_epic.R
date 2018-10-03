###############################################################################################################################
### STD PIPE ###
library(RnBeads)
options(bitmapType="cairo")

## Preprocess Sample Sheet ##
pre_sample_sheet = read.table(
    pipe("grep 'VM' /home/rtm/vivek/navi/EPIC/2018_09_18_Vivek_GenStudSS_FFPE_16.csv|perl -pe 's/\\,/\\t/g'|cut -f1,6,7")
    )

colnames(pre_sample_sheet) = c("Sample_ID","Sentrix_ID","Sentrix_Position")
write.csv(pre_sample_sheet,"rnbeads_sample_sheet.csv",row.names=F)

## Options and Parameters ##

#idat files
idat.dir <- file.path("/home/rtm/vivek/navi/EPIC/idat_Raw_Data")

# Sample annotation
sample.annotation <- file.path("/home/rtm/vivek/navi/EPIC/rnbeads_sample_sheet.csv")
rnb.options(import.table.separator=",")

# Report directory
system("rm -fr /home/rtm/vivek/navi/EPIC/RnBeads/RnBeads_report")
report.dir <- file.path("/home/rtm/vivek/navi/EPIC/RnBeads/RnBeads_report")

# Analysis directory
analysis.dir <- "/home/rtm/vivek/navi/EPIC/RnBeads/RnBeads_analysis"

# Vanilla parameters
rnb.options(filtering.sex.chromosomes.removal=TRUE, identifiers.column="Sample_ID")
rnb.options(differential=FALSE)

# Normalization parameters
rnb.options(normalization=TRUE,normalization.method="swan",normalization.background.method="methylumi.noob")

# Multiprocess
num.cores <- 20
parallel.setup(num.cores)

rnb.run.analysis(dir.reports=report.dir, sample.sheet=sample.annotation, data.dir=idat.dir, data.type="infinium.idat.dir")
###############################################################################################################################
## preprocessing
#idat files
idat.dir <- file.path("/home/rtm/vivek/navi/EPIC/idat_Raw_Data")

# Sample annotation
sample.annotation <- file.path("/home/rtm/vivek/navi/EPIC/rnbeads_sample_sheet.csv")
rnb.options(import.table.separator=",")

# Report directory
system("rm -fr /home/rtm/vivek/navi/EPIC/RnBeads/RnBeads_normalization")
report.dir <- file.path("/home/rtm/vivek/navi/EPIC/RnBeads/RnBeads_normalization")

# Vanilla parameters
rnb.options(identifiers.column="Sample_ID")

# Multiprocess
num.cores <- 20
parallel.setup(num.cores)

data.source <- c(idat.dir, sample.annotation)
result <- rnb.run.import(data.source=data.source,data.type="infinium.idat.dir", dir.reports=report.dir)
rnb.set.norm <- rnb.execute.normalization(result$rnb.set, method="swan",bgcorr.method="enmix.oob")

save.rnb.set(rnb.set.norm,path="/home/rtm/vivek/navi/EPIC/RnBeads/RnBeads_normalization/rnb.set.norm.RData")
###############################################################################################################################
suppressMessages(library(RnBeads))

rnb.set.norm=load.rnb.set("/home/rtm/vivek/navi/EPIC/RnBeads/RnBeads_normalization/rnb.set.norm.RData.zip")
rnb.set.norm@pheno = data.frame(rnb.set.norm@pheno, 
           Tumor = c("Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi",
                     "Melanoma","MIS","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi"),
           Patient = c("1","1","2","2","3","3","4","4",
                     "5","5","6","6","7","7","8","8") )

rnb.set.norm_no910=remove.samples(rnb.set.norm,samples(rnb.set.norm)[9:10])
                               
#################
rnb.options("columns.pairing"=c("Tumor"="Patient"))

MvsN_dmc <- rnb.execute.computeDiffMeth(rnb.set.norm_no910,pheno.cols=c("Tumor"))

comparison <- get.comparisons(MvsN_dmc)[1]
dmc_table <-get.table(MvsN_dmc, comparison, "sites", return.data.frame=TRUE)
summary(dmc_table$diffmeth.p.adj.fdr)
summary(dmc_table$mean.diff)



############################################################################################
meth.norm<-meth(rnb.set.norm)

colnames(meth.norm) = as.character(rnb.set.norm@pheno[,1])
rownames(meth.norm) = rownames(rnb.set.norm@sites)

meth.norm.sig=meth.norm[dmc_table$diffmeth.p.adj.fdr<0.3 & abs(dmc_table[,3])>.20,]

options(scipen=999)
library(gplots)
library(factoextra)
library(RColorBrewer)

track=as.character(rnb.set.norm@pheno$Tumor)
track[track=="Melanoma"]=1
track[track=="Nevi"]=2
track[track=="MIS"]=3


track=as.numeric(track)
colores=c("#ffb3ba","#baffc9","#bae1ff")
clab=as.character(colores[track])

colors <- rev(colorRampPalette( (brewer.pal(9, "PuOr")) )(20))
meth.norm.sig = meth.norm.sig[complete.cases(meth.norm.sig),]
pdf("heatmap_FDR30_DIF15_no9_no10.pdf")
x = heatmap.2(as.matrix(meth.norm.sig),col=colors,scale="none", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="", ylab="CpGs",key.title="Methylation lvl",ColSideColors=clab)
legend("topright",legend=c("Melanoma","Nevi","MIS"),fill=c("#ffb3ba","#baffc9","#bae1ff"), border=T, bty="n" )
dev.off()

write.csv(dmc_table,"DMC_table_no910.csv")

#####
meth.sd=apply(meth.norm,1,sd)
meth.norm.sd=meth.norm[order(meth.sd,decreasing=T),]
meth.norm.sd=meth.norm.sd[1:43344,]
pdf("heatmap_top5prcent_variable_43344cpg.pdf")
x = heatmap.2(as.matrix(meth.norm.sd),col=colors,scale="none", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="", ylab="CpGs",key.title="Methylation lvl",ColSideColors=clab)
legend("topright",legend=c("Melanoma","Nevi","MIS"),fill=c("#ffb3ba","#baffc9","#bae1ff"), border=T, bty="n" )
dev.off()

###
prev=read.csv("DMC_table.csv")
dmc_table
