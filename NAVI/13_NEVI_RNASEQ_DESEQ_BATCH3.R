# scp  # KESO
# -r -P  # KAKARIKO
# 60035 #KANARIO
# #KINOA
#172.18.149.78 #KREMBLIM

library(Rsubread)
options(scipen=999)

sink("RNA_Seq_featureCounts_batch3.log")

data<-featureCounts(c(
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/B1_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R01_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R02_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R03_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R04_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R05_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R06_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R07_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R08_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R09_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R11_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R12_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R13_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R14_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R15_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R16_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R18_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R21_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R22_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R26_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R27_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R28_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R29_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R30_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R31_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R32_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R33_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R34_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R35_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R36_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R37_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R38_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R39_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R40_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/bam3/R41_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/bam3/R42_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/bam3/R43_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/bam3/R44_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/bam3/R45_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/bam3/R46_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/bam3/R47_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/bam3/R48_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/bam3/R49_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/bam3/R50_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/bam3/R51_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/bam3/R52_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/bam3/R53_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/bam3/R54_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/bam3/R55_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/bam3/R56_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/bam3/R59_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/bam3/R60_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/bam3/R61_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/bam3/R62_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/bam3/R63_Aligned.sortedByCoord.out.bam"),
annot.ext="/home/references/gencode.v27.annotation.gtf",
isGTFAnnotationFile=TRUE,
minMQS=4,
strandSpecific=0,
isPairedEnd=TRUE,
autosort=TRUE,
nthreads=24,
GTF.attrType="gene_name"
)
sink()

saveRDS(data,"RNA_Seq_featureCounts_batch3_output.rds")

countData=data[[1]]
colnames(countData) = gsub("X.home.rtm.vivek.navi.rnaseq.RNA_seq.bam.","",colnames(countData))
colnames(countData) = gsub("X.home.rtm.vivek.navi.rnaseq.bam3.","",colnames(countData))
colnames(countData) = gsub("_Aligned.sortedByCoord.out.bam","",colnames(countData))
saveRDS(countData,"NEVI_counts.rds")
####################################################################################################
####################################################################################################

options(scipen=999)
library(DESeq2)
library(gplots)
library(factoextra)
library(RColorBrewer)

countData=readRDS("NEVI_counts.rds")
anno=read.csv("sample_list_RNA_NEVI_ANNO.csv",header=FALSE,stringsAsFactor=FALSE)
anno = rbind(anno, c("B1","B1","B1"))
anno[,2] = gsub("NA-","",anno[,2])

design<-data.frame(RNA_ID=colnames(countData),
                   VM_ID=rep(0,dim(countData)[2]),
                   Type=rep(0,dim(countData)[2]),
                   Batch=rep(0,dim(countData)[2]))

design$VM_ID = anno[match(design[,1],anno[,2]),1]
design$Type = anno[match(design[,1],anno[,2]),3]
design$Type[is.na(design$Type)] = "Normal"
design$Type[26:34] = "Unclassified"
design$Batch[1:25] = 1 ; design$Batch[20:34] = 2 ; design$Batch[35:55] = 3
################################################################################################
# Removing B1 sample
countData = countData [,2:dim(countData)[2]] 
design = design[2:dim(design)[1],]
################################################################################################
dLRT <- DESeqDataSetFromMatrix(countData = countData, colData = design, design = ~ Type )
dLRT <- DESeq(dLRT, test="LRT", reduced=~1)
dLRT_vsd <- varianceStabilizingTransformation(dLRT)
dLRT_res = results(dLRT)
vsd = assay(dLRT_vsd)

pdf("Diagnostic_pca_all_samples.pdf")
plotPCA(dLRT_vsd,ntop=50000,intgroup=c("Type","Batch"))
dev.off()

saveRDS(vsd,"NHM_vsd.rds")
