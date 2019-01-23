
library(Rsubread)

sink("featureCounts.log")
x=read.table('k4_intk27.bed',sep="\t",stringsAsFactors=F)
ann = data.frame(GeneID=paste(x[,1],x[,2],x[,3],x[,4],sep="_!_"),Chr=x[,1],Start=x[,2],End=x[,3],Strand='+')

bam.files <- c('/root/vivek/chip-seq/bam/NHM_H3K4me3_rmdup.bam',
              '/root/vivek/chip-seq/bam/CDKN2A+BRAF_H3K4me3_rmdup.bam')
k4 <- featureCounts(bam.files,annot.ext=ann,isPairedEnd=FALSE,nthreads=40)
################################################################################################################
x=read.table('k27_intk4.bed',sep="\t",stringsAsFactors=F)
ann = data.frame(GeneID=paste(x[,1],x[,2],x[,3],x[,4],sep="_!_"),Chr=x[,1],Start=x[,2],End=x[,3],Strand='+')

bam.files <- c('/root/vivek/chip-seq/bam/NHM_H3K27me3_rmdup.bam',
              '/root/vivek/chip-seq/bam/CDKN2A+BRAF_H3K27me3_rmdup.bam')
k27 <- featureCounts(bam.files,annot.ext=ann,isPairedEnd=FALSE,nthreads=40)
sink()

library(edgeR)
k4bed=read.table('k4_intk27.bed',sep="\t",stringsAsFactors=F)
k27bed=read.table('k27_intk4.bed',sep="\t",stringsAsFactors=F)


k4_x <- DGEList(counts=k4$counts, genes=k4$annotation[,c("GeneID","Length")])
k4_rpkm <- rpkm(k4_x,k4_x$genes$Length)
colnames(k4_rpkm) = c("NHM","NBC")

k27_x <- DGEList(counts=k27$counts, genes=k27$annotation[,c("GeneID","Length")])
k27_rpkm <- rpkm(k27_x,k27_x$genes$Length)
colnames(k27_rpkm) = c("NHM","NBC")



