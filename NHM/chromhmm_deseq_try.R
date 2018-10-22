system("cat NHM_BRAF_E3.bed BRAF+BC_E3.bed | sort -k1,1 -k2,2n | bedtools merge -i - > merged_E3.bed")

library(Rsubread)

x=read.table('merged_E3.bed',sep="\t",stringsAsFactors=F)

ann = data.frame(GeneID=paste(x[,1],x[,2],x[,3],sep="_!_"),Chr=x[,1],Start=x[,2],End=x[,3],Strand='+')

bam.files <- c('/root/vivek/chip-seq/bam/NHM_H3K27ac_rmdup.bam',
              '/root/vivek/chip-seq/bam/BRAF_H3K27ac_rmdup.bam',
              '/root/vivek/chip-seq/bam/CDKN2A_H3K27ac_rmdup.bam',
              '/root/vivek/chip-seq/bam/CDKN2A+BRAF_H3K27ac_rmdup.bam')

fc_SE <- featureCounts(bam.files,annot.ext=ann,isPairedEnd=TRUE,nthreads=60)

countData=fc_SE$counts
colnames(countData) = c("NHM","BRAF","CDKN2A","CB")

saveRDS(countData,"E3_enhancer_counts.rds")
################################################################################
countData=readRDS("E3_enhancer_counts.rds")
options(scipen=999)
library(DESeq2)
library(gplots)
library(factoextra)
library(RColorBrewer)
library(ggplot2)
options(bitmapType="cairo")

design<-data.frame(group=c("NHM","BRAF","CDKN2A","BC") )

dLRT <- DESeqDataSetFromMatrix(countData = countData, colData = design, design = ~ group )
dLRT <- DESeq(dLRT, test="LRT", reduced=~1)
dLRT_vsd <- varianceStabilizingTransformation(dLRT)
dLRT_res = results(dLRT)
vsd = assay(dLRT_vsd)

pdf("enhancer_pca.pdf")
plotPCA(dLRT_vsd,ntop=150000,intgroup=c('group'))
dev.off()
################################################################################
library(qvalue)
qvalue(dLRT_res$pvalue)
################################################################################
