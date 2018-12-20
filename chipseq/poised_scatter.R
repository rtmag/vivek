computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K4me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K4me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K4me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K4me3.bw \
-R ~/resources/hg38_tss.bed --referencePoint center \
--sortRegions keep -bs 20 -a 1000 -b 1000 -p max -out H3K4me3_TSS_1k.mat --missingDataAsZero --outFileNameMatrix H3K4me3_TSS_1k.rtxt

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K27me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27me3.bw \
-R ~/resources/hg38_tss.bed --referencePoint center \
--sortRegions keep -bs 20 -a 1000 -b 1000 -p max -out H3K27me3_TSS_1k.mat --missingDataAsZero --outFileNameMatrix H3K27me3_TSS_1k.rtxt
#######################################################
######
 library(RColorBrewer)

bed = read.table("hg38_tss.bed",sep="\t",stringsAsFactors=F)
k4 = read.table(pipe("grep -v '#' H3K4me3_TSS_1k.rtxt|grep -v 'genes'"),sep="\t")
k27 = read.table(pipe("grep -v '#' H3K27me3_TSS_1k.rtxt|grep -v 'genes'"),sep="\t")
rna = readRDS("NHM_vsd.rds")


ix = match(bed[,4],rownames(rna))
k4 = k4[!is.na(ix),]
k27 = k27[!is.na(ix),]
rna=rna[ix[!is.na(ix)],]
rbPal <- colorRampPalette(c('grey','blue','red'))

pdf("poised_scatter.pdf")
par(mfrow=c(2,2))
col_rna_log2fc <- rbPal(200)[as.numeric(cut(rowMeans(rna[,10:12]),breaks = 200))]
plot(log2(rowSums(k4[,1:100])),log2(rowSums(k27[,1:100])),xlab="Log2 H3K4me3 TSS",ylab="Log2 H3K27me3",col = col_rna_log2fc,
pch = 20,main="NHM")
#
col_rna_log2fc <- rbPal(200)[as.numeric(cut(rowMeans(rna[,1:3]),breaks = 200))]
plot(log2(rowSums(k4[,101:200])),log2(rowSums(k27[,101:200])),xlab="Log2 H3K4me3 TSS",ylab="Log2 H3K27me3",col = col_rna_log2fc,
pch = 20,main="BRAF")
#
col_rna_log2fc <- rbPal(200)[as.numeric(cut(rowMeans(rna[,4:6]),breaks = 200))]
plot(log2(rowSums(k4[,201:300])),log2(rowSums(k27[,201:300])),xlab="Log2 H3K4me3 TSS",ylab="Log2 H3K27me3",col = col_rna_log2fc,
pch = 20,main="CDKN2A")
#
col_rna_log2fc <- rbPal(200)[as.numeric(cut(rowMeans(rna[,7:9]),breaks = 200))]
plot(log2(rowSums(k4[,301:400])),log2(rowSums(k27[,301:400])),xlab="Log2 H3K4me3 TSS",ylab="Log2 H3K27me3",col = col_rna_log2fc,
pch = 20,main="BRAF+CDKN2A")
dev.off()


par(mfrow=c(2,2))
col_rna_log2fc <- rbPal(200)[as.numeric(cut(rowMeans(rna[,10:12]),breaks = 200))]
plot(log10(rowSums(k4[,1:100])),log10(rowSums(k27[,1:100])),xlab="log10 H3K4me3 TSS",ylab="log10 H3K27me3",col = col_rna_log2fc,
pch = 20,main="NHM")
#
col_rna_log2fc <- rbPal(200)[as.numeric(cut(rowMeans(rna[,1:3]),breaks = 200))]
plot(log10(rowSums(k4[,101:200])),log10(rowSums(k27[,101:200])),xlab="log10 H3K4me3 TSS",ylab="log10 H3K27me3",col = col_rna_log2fc,
pch = 20,main="BRAF")
#
col_rna_log2fc <- rbPal(200)[as.numeric(cut(rowMeans(rna[,4:6]),breaks = 200))]
plot(log10(rowSums(k4[,201:300])),log10(rowSums(k27[,201:300])),xlab="log10 H3K4me3 TSS",ylab="log10 H3K27me3",col = col_rna_log2fc,
pch = 20,main="CDKN2A")
#
col_rna_log2fc <- rbPal(200)[as.numeric(cut(rowMeans(rna[,7:9]),breaks = 200))]
plot(log10(rowSums(k4[,301:400])),log10(rowSums(k27[,301:400])),xlab="log10 H3K4me3 TSS",ylab="log10 H3K27me3",col = col_rna_log2fc,
pch = 20,main="BRAF+CDKN2A")

#######################################################
######

countData=readRDS("NHM_counts.rds")
options(scipen=999)
library(DESeq2)
library(gplots)
library(factoextra)
library(RColorBrewer)


design<-data.frame(group=c("BRAF","BRAF","BRAF",
                "B_C","B_C","B_C",
                "CDKN2A","CDKN2A","CDKN2A",
                "NHM","NHM","NHM") )

  design <- data.frame( group = c("B_C","B_C","B_C", "NHM","NHM","NHM" ) )
  dds <- DESeqDataSetFromMatrix(countData = countData[, c(4:6, 10:12) ], colData = design, design = ~ group )
  dds <- DESeq(dds)
  dds_res = results(dds,contrast=c("group","B_C","NHM"))

 library(RColorBrewer)

bed = read.table("hg38_tss.bed",sep="\t",stringsAsFactors=F)
k4 = read.table(pipe("grep -v '#' H3K4me3_TSS_1k.rtxt|grep -v 'genes'"),sep="\t")
k27 = read.table(pipe("grep -v '#' H3K27me3_TSS_1k.rtxt|grep -v 'genes'"),sep="\t")
rna = readRDS("NHM_vsd.rds")

rna = rna[which(rownames(rna) %in% rownames(dds_res)[which(dds_res$padj<0.05 & abs(dds_res$log2FoldChange)>1)]),]

ix = match(bed[,4],rownames(rna))
k4 = k4[!is.na(ix),]
k27 = k27[!is.na(ix),]
rna=rna[ix[!is.na(ix)],]
rbPal <- colorRampPalette(c('grey','blue','red','red','red'))

pdf("poised_scatter_DE_BC_VS_NHM.pdf")
par(mfrow=c(2,2))
col_rna_log2fc <- rbPal(200)[as.numeric(cut(rowMeans(rna[,10:12]),breaks = 200))]
plot(log2(rowSums(k4[,1:100])),log2(rowSums(k27[,1:100])),xlab="Log2 H3K4me3 TSS",ylab="Log2 H3K27me3",col = col_rna_log2fc,
pch = 20,main="NHM")
#
col_rna_log2fc <- rbPal(200)[as.numeric(cut(rowMeans(rna[,1:3]),breaks = 200))]
plot(log2(rowSums(k4[,101:200])),log2(rowSums(k27[,101:200])),xlab="Log2 H3K4me3 TSS",ylab="Log2 H3K27me3",col = col_rna_log2fc,
pch = 20,main="BRAF")
#
col_rna_log2fc <- rbPal(200)[as.numeric(cut(rowMeans(rna[,4:6]),breaks = 200))]
plot(log2(rowSums(k4[,201:300])),log2(rowSums(k27[,201:300])),xlab="Log2 H3K4me3 TSS",ylab="Log2 H3K27me3",col = col_rna_log2fc,
pch = 20,main="CDKN2A")
#
col_rna_log2fc <- rbPal(200)[as.numeric(cut(rowMeans(rna[,7:9]),breaks = 200))]
plot(log2(rowSums(k4[,301:400])),log2(rowSums(k27[,301:400])),xlab="Log2 H3K4me3 TSS",ylab="Log2 H3K27me3",col = col_rna_log2fc,
pch = 20,main="BRAF+CDKN2A")
dev.off()

pdf("poised_scatter_DE_BC_VS_NHM_difference_chip.pdf")
rbPal <- colorRampPalette(c('blue','blue','grey','red','red'))
col_rna_log2fc <- rbPal(200)[as.numeric(cut(rowMeans(rna[,7:9])-rowMeans(rna[,10:12]),breaks = 200))]
plot(log2(rowSums(k4[,301:400]))-log2(rowSums(k4[,1:100])),log2(rowSums(k27[,301:400]))-log2(rowSums(k27[,1:100])),
xlab="NBC VS NHM Log2 H3K4me3 TSS",ylab="NBC VS NHM Log2 H3K27me3",col = col_rna_log2fc,
pch = 20,main="NBC VS NHM")
dev.off()
###################################################################################################################
###################################################################################################################
###################################################################################################################
poised = read.table("~/CSI/vivek/new_rnaseq/chip_seq_integration/poised_kmeans_zmet_5k.bed",sep="\t")
poised = as.character(poised[,4])
rna = readRDS("NHM_vsd.rds")

rna = rna[which(rownames(rna) %in% poised),]

bed = read.table("hg38_tss.bed",sep="\t",stringsAsFactors=F)
k4 = read.table(pipe("grep -v '#' H3K4me3_TSS_1k.rtxt|grep -v 'genes'"),sep="\t")
k27 = read.table(pipe("grep -v '#' H3K27me3_TSS_1k.rtxt|grep -v 'genes'"),sep="\t")

ix = match(bed[,4],rownames(rna))
k4 = k4[!is.na(ix),]
k27 = k27[!is.na(ix),]
rna=rna[ix[!is.na(ix)],]
rbPal <- colorRampPalette(c('grey','blue','red','red','red'))


pdf("CHROMHMM_poised_scatter_DE_BC_VS_NHM_difference_chip.pdf")
rbPal <- colorRampPalette(c('blue','blue','blue','grey','red','red','red','red'))
col_rna_log2fc <- rbPal(200)[as.numeric(cut(rowMeans(rna[,7:9])-rowMeans(rna[,10:12]),breaks = 200))]
plot(log2(rowSums(k4[,301:400]))-log2(rowSums(k4[,1:100])),log2(rowSums(k27[,301:400]))-log2(rowSums(k27[,1:100])),
xlab="NBC VS NHM Log2 H3K4me3 TSS",ylab="NBC VS NHM Log2 H3K27me3",col = col_rna_log2fc,
pch = 20,main="NBC VS NHM")
dev.off()
