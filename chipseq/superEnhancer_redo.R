cat /root/vivek/chip-seq/ROSE/NHM_40/NHM_H3K27ac_40_Gateway_SuperEnhancers.bed \
/root/vivek/chip-seq/ROSE/BRAF_40/BRAF_H3K27ac_40_Gateway_SuperEnhancers.bed \
/root/vivek/chip-seq/ROSE/CDKN2A_40/CDKN2A_H3K27ac_40_Gateway_SuperEnhancers.bed \
/root/vivek/chip-seq/ROSE/CDKN2A+BRAF_40/CDKN2A+BRAF_H3K27ac_40_Gateway_SuperEnhancers.bed|sort -k1,1 -k2,2n| \
bedtools merge -i - > superEnhancer_redo_merge.bed

##################################################################
library(Rsubread)
options(scipen=999)
library(DESeq2)


x=read.table('NHM_BC_sp.bed',sep="\t",stringsAsFactors=F)

ann = data.frame(GeneID=paste(x[,1],x[,2],x[,3],sep="_!_"),Chr=x[,1],Start=x[,2],End=x[,3],Strand='+')

bam.files <- c('/root/vivek/chip-seq/bam/NHM_H3K27ac_rmdup.bam',
              '/root/vivek/chip-seq/bam/BRAF_H3K27ac_rmdup.bam',
              '/root/vivek/chip-seq/bam/CDKN2A+BRAF_H3K27ac_rmdup.bam')

fc_SE <- featureCounts(bam.files,annot.ext=ann,isPairedEnd=TRUE,nthreads=60)

x=fc_SE$counts
colnames(x) = c("NHM","BRAF","CB")
saveRDS(x,"superEnhancer_counts.rds")
######
options(scipen=999)
library(DESeq2)

x= readRDS("superEnhancer_counts.rds")

colData <- data.frame(group=c("NHM","BRAF","CB") )
dds <- DESeqDataSetFromMatrix(
       countData = x,
       colData = colData,
       design = ~ group)

dds <- estimateSizeFactors(dds)
counts = counts(dds, normalized=TRUE)
fc=counts[,3]/counts[,1]
sig=counts[fc>1.8,]

sig = sig[complete.cases(sig),]
bed = rownames(sig[complete.cases(sig),])
write.table(gsub("_!_","\t",bed,perl=T),"Significant_Open_80Percent_in_BRAF-CDKN2A_SUB-SuperEnhancer.bed",sep="\t",quote=F,row.name=F,col.name=F)

fc=counts[,1]/counts[,3]
sig=counts[fc>1.8,]


sig = sig[complete.cases(sig),]
bed = rownames(sig[complete.cases(sig),])
write.table(gsub("_!_","\t",bed,perl=T),"Significant_Open_80Percent_in_NHM_SUB-SuperEnhancer.bed",sep="\t",quote=F,row.name=F,col.name=F)

