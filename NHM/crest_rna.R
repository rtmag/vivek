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
