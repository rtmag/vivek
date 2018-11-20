library(Rsubread)
options(scipen=999)
library(edgeR)

data<-featureCounts(c(
"/root/vivek/vivek_new_rna_seq/bam/NHM_1_Aligned.sortedByCoord.out.bam",
"/root/vivek/vivek_new_rna_seq/bam/NHM_2_Aligned.sortedByCoord.out.bam",
"/root/vivek/vivek_new_rna_seq/bam/NHM_3_Aligned.sortedByCoord.out.bam",
"/root/vivek/vivek_new_rna_seq/bam/BRAF_1_Aligned.sortedByCoord.out.bam",
"/root/vivek/vivek_new_rna_seq/bam/BRAF_2_Aligned.sortedByCoord.out.bam",
"/root/vivek/vivek_new_rna_seq/bam/BRAF_3_Aligned.sortedByCoord.out.bam",
"/root/vivek/vivek_new_rna_seq/bam/CDKN2A_1_Aligned.sortedByCoord.out.bam",
"/root/vivek/vivek_new_rna_seq/bam/CDKN2A_2_Aligned.sortedByCoord.out.bam",
"/root/vivek/vivek_new_rna_seq/bam/CDKN2A_3_Aligned.sortedByCoord.out.bam",
"/root/vivek/vivek_new_rna_seq/bam/BRAF_+_CDKN2A_1_Aligned.sortedByCoord.out.bam",
"/root/vivek/vivek_new_rna_seq/bam/BRAF_+_CDKN2A_2_Aligned.sortedByCoord.out.bam",
"/root/vivek/vivek_new_rna_seq/bam/BRAF_+_CDKN2A_3_Aligned.sortedByCoord.out.bam",
"crest_Aligned.sortedByCoord.out.bam"),
annot.ext="/root/resources/gencode.v27.annotation.gtf",
isGTFAnnotationFile=TRUE,
minMQS=4,
strandSpecific=0,
isPairedEnd=FALSE,
autosort=TRUE,
nthreads=55,
GTF.attrType="gene_name"
)

saveRDS(data,"NHM_crest_featureCounts.rds")
############################################################################################################
data = readRDS("NHM_crest_featureCounts.rds")

dat=data[[1]]
colnames(dat)=c("NHM_1","NHM_2","NHM_3","BRAF_1","BRAF_2","BRAF_3",
                 "CDKN2A_1","CDKN2A_2","CDKN2A_3","B_C_1","B_C_2","B_C_3",
               "CREST")

saveRDS(dat,"NHM_crest_counts.rds")

############################################################################################################
x <- DGEList(counts=data$counts, genes=data$annotation[,c("GeneID","Length")])
x_rpkm <- rpkm(x,x$genes$Length)

colnames(x_rpkm)=c("NHM_1","NHM_2","NHM_3","BRAF_1","BRAF_2","BRAF_3",
                "CDKN2A_1","CDKN2A_2","CDKN2A_3","B_C_1","B_C_2","B_C_3")

saveRDS(x_rpkm,"NHM_rpkm.rds")
############################################################################################################

options(scipen=999)
library(DESeq2)
library(gplots)
library(factoextra)
library(RColorBrewer)

countData = readRDS("NHM_crest_counts.rds")

design<-data.frame(group=c("BRAF","BRAF","BRAF",
                "B_C","B_C","B_C",
                "CDKN2A","CDKN2A","CDKN2A",
                "NHM","NHM","NHM","CREST") )

dLRT <- DESeqDataSetFromMatrix(countData = countData, colData = design, design = ~ group )
dLRT <- DESeq(dLRT, test="LRT", reduced=~1)
dLRT_vsd <- varianceStabilizingTransformation(dLRT)
dLRT_res = results(dLRT)
vsd = assay(dLRT_vsd)



pdf("CREST_pca_samples.pdf")
plotPCA(dLRT_vsd,ntop=50000,intgroup=c("group"))
dev.off()

pdf("CREST_heatmap_samples.pdf")
library("RColorBrewer")
library("pheatmap")
sampleDists <- dist(t(assay(dLRT_vsd)))
sampleDistMatrix <- as.matrix(sampleDists)
colors <- colorRampPalette( rev(brewer.pal(9, "Blues")) )(255)
pheatmap(sampleDistMatrix,
         clustering_distance_rows=sampleDists,
         clustering_distance_cols=sampleDists,
         col=colors)
dev.off()
##########################################################################################
pdf("NHM_heatmap_samples.pdf")
library("RColorBrewer")
library("pheatmap")
sampleDists <- dist(t(assay(dLRT_vsd)))
sampleDistMatrix <- as.matrix(sampleDists)
rownames(sampleDistMatrix) <- paste(dLRT_vsd$condition, dLRT_vsd$type, sep="-")
colnames(sampleDistMatrix) <- NULL
colors <- colorRampPalette( rev(brewer.pal(9, "Blues")) )(255)
pheatmap(sampleDistMatrix,
         clustering_distance_rows=sampleDists,
         clustering_distance_cols=sampleDists,
         col=colors)
dev.off()

############################ NO CREST
design<-data.frame(group=c("BRAF","BRAF","BRAF",
                "B_C","B_C","B_C",
                "CDKN2A","CDKN2A","CDKN2A",
                "NHM","NHM","NHM") )
dLRT <- DESeqDataSetFromMatrix(countData = countData[,1:12], colData = design, design = ~ group )
dLRT <- DESeq(dLRT, test="LRT", reduced=~1)
dLRT_res = results(dLRT)
dLRT_vsd <- varianceStabilizingTransformation(dLRT)
vsd = assay(dLRT_vsd)
#############

sig_vsd = vsd[which(dLRT_res$padj<0.00001),]
rownames(sig_vsd) = c()
colors = colorRampPalette(c("green","black","red"))(20)

png("NHM_crest_ANOVA_heatmap.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
  heatmap.2(as.matrix(sig_vsd),col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="",key.title="Gene expression",cexCol=.9,cexRow=.9,labRow = FALSE)
dev.off()

pdf("NHM_heatmap_samples.pdf")
library("RColorBrewer")
library("pheatmap")
sampleDists <- dist(t(assay(dLRT_vsd)))
sampleDistMatrix <- as.matrix(sampleDists)
colors <- colorRampPalette( rev(brewer.pal(9, "Blues")) )(255)
pheatmap(sampleDistMatrix,
         clustering_distance_rows=sampleDists,
         clustering_distance_cols=sampleDists,
         col=colors)
dev.off()
#############

options(scipen=999)
library(DESeq2)
library(gplots)
library(factoextra)
library(RColorBrewer)

countData = readRDS("NHM_crest_counts.rds")

design<-data.frame(group=c("BRAF","BRAF","BRAF",
                "B_C","B_C","B_C",
                "CDKN2A","CDKN2A","CDKN2A",
                "NHM","NHM","NHM","CREST") )

dLRT <- DESeqDataSetFromMatrix(countData = countData, colData = design, design = ~ group )
dLRT <- DESeq(dLRT, test="LRT", reduced=~1)
dLRT_vsd <- varianceStabilizingTransformation(dLRT)
vsd = assay(dLRT_vsd)

gmt = read.table(pipe("more ~/Downloads/GO_term_summary_20181120_104959.txt |cut -f2|sort|uniq|tail -n +2"),stringsAsFactors=F)
gmt = toupper(gmt[,1])

sig_vsd = vsd[rownames(vsd) %in% gmt,]
sig_vsd = sig_vsd[apply(sig_vsd,1,sd)!=0,]

colnames(sig_vsd) = c("NHM","NHM","NHM","BRAF","BRAF","BRAF","CDKN2A","CDKN2A","CDKN2A",
                      "BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A","CREST")
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))

  heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="CREST Genes",key.title="Gene expression",cexCol=.65,cexRow=.6)

##################################################################################################################################
sig_vsd = vsd[rownames(vsd) %in% c("SOX10","SOX9","NFKB1","NFKB2","SNAI1","SNAI2",
                                   "FOXD3","PAX3","PAX7","AP2A1","AP2A2","ID1","ID2"),]
sig_vsd = sig_vsd[apply(sig_vsd,1,sd)!=0,]

colnames(sig_vsd) = c("NHM","NHM","NHM","BRAF","BRAF","BRAF","CDKN2A","CDKN2A","CDKN2A",
                      "BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A","CREST")
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))

  heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="CREST Genes",key.title="Gene expression",cexCol=.65,cexRow=.6)
##################################################################################################################################
sig_vsd = vsd[rownames(vsd) %in% c("DCN","LUM","PDGFRA","EDNRA","BMP5","CRABP1","ITGB1","ENG","PHLDA1","CD44","SOX10",
                                   "ERBB3","MCAM","NGFR","SCG3","PHOX2B","CHGA"),]
sig_vsd = sig_vsd[apply(sig_vsd,1,sd)!=0,]

colnames(sig_vsd) = c("NHM","NHM","NHM","BRAF","BRAF","BRAF","CDKN2A","CDKN2A","CDKN2A",
                      "BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A","CREST")
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))

  heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="CREST Genes",key.title="Gene expression",cexCol=.65,cexRow=.6)
##################################################################################################################################
design<-data.frame(group=c("NHM","NHM","NHM","BRAF","BRAF","BRAF",
                "CDKN2A","CDKN2A","CDKN2A","B_C","B_C","B_C","CREST") )

design<-data.frame(group=c("1","1","1","1","1","1",
                "1","1","1","2","2","2","2") )

dLRT <- DESeqDataSetFromMatrix(countData = countData, colData = design, design = ~ group )
dLRT <- DESeq(dLRT)

dLRT_res = results(dLRT)

  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))
#.4
pdf("LessSim_SD4.pdf")
sig_vsd = vsd[rownames(vsd) %in% rownames(dLRT_res[which(apply(vsd[,10:13],1,sd)<.4 & dLRT_res$log2FoldChange>1 & dLRT_res$padj<0.05),]),]
sig_vsd = sig_vsd[apply(sig_vsd,1,sd)!=0,]
colnames(sig_vsd) = c("NHM","NHM","NHM","BRAF","BRAF","BRAF","CDKN2A","CDKN2A","CDKN2A",
                      "BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A","CREST")
  heatmap.2(sig_vsd/rowSums(sig_vsd),col=colors,scale="none", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="CREST Genes",key.title="Gene expression",cexCol=.65,cexRow=.2)
dev.off()
# .3
pdf("MedLowSim_SD3.pdf")
sig_vsd = vsd[rownames(vsd) %in% rownames(dLRT_res[which(apply(vsd[,10:13],1,sd)<.3 & dLRT_res$log2FoldChange>1 & dLRT_res$padj<0.05),]),]
sig_vsd = sig_vsd[apply(sig_vsd,1,sd)!=0,]
colnames(sig_vsd) = c("NHM","NHM","NHM","BRAF","BRAF","BRAF","CDKN2A","CDKN2A","CDKN2A",
                      "BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A","CREST")
  heatmap.2(sig_vsd/rowSums(sig_vsd),col=colors,scale="none", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="CREST Genes",key.title="Gene expression",cexCol=.65,cexRow=.3)
dev.off()
#.2
pdf("MedHighSim_SD2.pdf")
sig_vsd = vsd[rownames(vsd) %in% rownames(dLRT_res[which(apply(vsd[,10:13],1,sd)<.2 & dLRT_res$log2FoldChange>1 & dLRT_res$padj<0.05),]),]
sig_vsd = sig_vsd[apply(sig_vsd,1,sd)!=0,]
colnames(sig_vsd) = c("NHM","NHM","NHM","BRAF","BRAF","BRAF","CDKN2A","CDKN2A","CDKN2A",
                      "BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A","CREST")
  heatmap.2(sig_vsd/rowSums(sig_vsd),col=colors,scale="none", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="CREST Genes",key.title="Gene expression",cexCol=.65,cexRow=.5)
dev.off()
#.1
pdf("HighSim_SD3.pdf")
sig_vsd = vsd[rownames(vsd) %in% rownames(dLRT_res[which(apply(vsd[,10:13],1,sd)<.1 & dLRT_res$log2FoldChange>1 & dLRT_res$padj<0.05),]),]
sig_vsd = sig_vsd[apply(sig_vsd,1,sd)!=0,]
colnames(sig_vsd) = c("NHM","NHM","NHM","BRAF","BRAF","BRAF","CDKN2A","CDKN2A","CDKN2A",
                      "BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A","CREST")
  heatmap.2(sig_vsd/rowSums(sig_vsd),col=colors,scale="none", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="CREST Genes",key.title="Gene expression",cexCol=.65,cexRow=.6)
dev.off()

write.table(rownames(dLRT_res[which(apply(vsd[,10:13],1,sd)<.4 & dLRT_res$log2FoldChange>1 & dLRT_res$padj<0.05),]),
                              "LessSim_SD4.txt", quote=F,sep="\t",col.names=F,row.names=F)
write.table(rownames(dLRT_res[which(apply(vsd[,10:13],1,sd)<.3 & dLRT_res$log2FoldChange>1 & dLRT_res$padj<0.05),]),
                              "MedLowSim_SD3.txt", quote=F,sep="\t",col.names=F,row.names=F)
write.table(rownames(dLRT_res[which(apply(vsd[,10:13],1,sd)<.2 & dLRT_res$log2FoldChange>1 & dLRT_res$padj<0.05),]),
                              "MedHighSim_SD2.txt", quote=F,sep="\t",col.names=F,row.names=F)
write.table(rownames(dLRT_res[which(apply(vsd[,10:13],1,sd)<.1 & dLRT_res$log2FoldChange>1 & dLRT_res$padj<0.05),]),
                              "HighSim_SD3.txt", quote=F,sep="\t",col.names=F,row.names=F)
