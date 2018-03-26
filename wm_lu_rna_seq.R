
library(Rsubread)
options(scipen=999)

data<-featureCounts(c(
"/root/vivek/RNAseq_Vivek_UCSF/bam/lu_1_Aligned.sortedByCoord.out.bam",
"/root/vivek/RNAseq_Vivek_UCSF/bam/lu_2_Aligned.sortedByCoord.out.bam",
"/root/vivek/RNAseq_Vivek_UCSF/bam/lu_3_Aligned.sortedByCoord.out.bam",
"/root/vivek/RNAseq_Vivek_UCSF/bam/wm_1_Aligned.sortedByCoord.out.bam",
"/root/vivek/RNAseq_Vivek_UCSF/bam/wm_2_Aligned.sortedByCoord.out.bam",
"/root/vivek/RNAseq_Vivek_UCSF/bam/wm_3_Aligned.sortedByCoord.out.bam"
),
annot.ext="/root/resources/gencode.v27.annotation.gtf",
isGTFAnnotationFile=TRUE,
minMQS=4,
strandSpecific=0,
isPairedEnd=FALSE,
#PE_orientation="rf",
autosort=TRUE,
nthreads=40,
GTF.attrType="gene_name"
)


dat=data[[1]]
colnames(dat)=c("lu_1","lu_2","lu_3","wm_1","wm_2","wm_3")

saveRDS(dat,"lu_wm_counts.rds")

###
countData=readRDS("lu_wm_counts.rds")
options(scipen=999)
library(DESeq2)

colData <- data.frame(cells=gsub("\\_\\d$","",colnames(countData),perl=TRUE) )
dds <- DESeqDataSetFromMatrix(
       countData = countData,
       colData = colData,
       design = ~ cells)

dLRT <- DESeq(dds, test="LRT", reduced=~1)
dLRT_vsd <- varianceStabilizingTransformation(dLRT)
dLRT_res <- results(dLRT)
dLRT_res$padj[is.na(dLRT_res$padj)]=1

pdf("Diagnostic_design_pca.pdf")
plotPCA(dLRT_vsd,ntop=60000,intgroup=c('cells'))
dev.off()
####

countData=readRDS("lu_wm_counts.rds")
options(scipen=999)
library(DESeq2)
library(ggplot2)


colData <- data.frame(cells=gsub("\\_\\d$","",colnames(countData),perl=TRUE) )
dds <- DESeqDataSetFromMatrix(
       countData = countData,
       colData = colData,
       design = ~ cells)

dds <- DESeq(dds)
dds_vsd <- varianceStabilizingTransformation(dds)
dds_res <- results(dds,contrast=c("cells","lu","wm"))
res=dds_res
#table(dds_res$padj<0.01 & abs(dds_res$log2FoldChange)>1)
write.csv(dds_res,"lu_vs_wm_results_table.csv")

pdf("lu_vs_wm_volcanoplot.pdf")
plot(res$log2FoldChange,-log10(res$padj),xlab=expression('Log'[2]*' Fold Change ( LU / WM ) '),
              ylab=expression('-Log'[10]*' Q-values'),col=alpha("grey",.04))
abline(v=-1,lty = 2,col="grey")
abline(v=1,lty = 2,col="grey")
abline(h=-log10(0.05),lty = 2,col="grey")


points(res$log2FoldChange[res$log2FoldChange>1 & res$padj<0.05],
       -log10(res$padj)[res$log2FoldChange>1 & res$padj<0.05],
      col=alpha("#c0392b",.5))

points(res$log2FoldChange[res$log2FoldChange<(-1) & res$padj<0.05],
       -log10(res$padj)[res$log2FoldChange<(-1) & res$padj<0.05],
      col=alpha("#6CA6CD",.5))

legend("topright", paste("LU:",length(which(res$log2FoldChange>1 & res$padj<0.05))), bty="n") 
legend("topleft", paste("WM:",length(which(res$log2FoldChange<(-1) & res$padj<0.05))), bty="n") 
dev.off()

source('https://raw.githubusercontent.com/rtmag/tumor-meth-pipe/master/heatmap3.R')

 library(RColorBrewer)
library(factoextra)
library(gplots)

colors <- colorRampPalette(c("#6CA6CD","white","#c0392b"))(30)

hclustfunc <- function(x) hclust(x, method="complete")
distfunc <- function(x) get_dist(x,method="spearman")

pdf('lu_wm_heatmap.pdf')  
heatmap.2(assay(dds_vsd)[which(dds_res$padj<0.05 & abs(dds_res$log2FoldChange)>1),],col=colors, hclustfun=hclustfunc, 
          distfun=distfunc, labRow = FALSE,xlab="", ylab="genes",
            scale="row", trace="none",key.title="Expression",dendrogram="both",margins = c(2, 2),
           cexRow=.6, cexCol=1,srtCol=25,keysize=0.9)

dev.off()

lu_gene=rownames(dds_res[which(dds_res$padj<0.05 & dds_res$log2FoldChange>1),])
write.table(lu_gene,"lu_genes.txt",sep="\t",quote=F,row.names=F,col.names=F)
wm_gene=rownames(dds_res[which(dds_res$padj<0.05 & dds_res$log2FoldChange<(-1)),])
write.table(wm_gene,"wm_genes.txt",sep="\t",quote=F,row.names=F,col.names=F)

write.csv(assay(dds_vsd)[which(dds_res$padj<0.05 & abs(dds_res$log2FoldChange)>1),],"dds_vsd.csv")

###########################
options(scipen=999)
res=read.csv("lu_vs_wm_results_table.csv",row.names=1)

up_reg = res[ which(res$log2FoldChange>0),]
up_reg = up_reg[ !is.na(up_reg$padj),]
up_reg_log=-log10(up_reg$padj)
names(up_reg_log) = rownames(up_reg)
up_reg_log[up_reg_log==Inf] = max(up_reg_log[up_reg_log!=Inf])

dw_reg = res[ which(res$log2FoldChange<0),]
dw_reg = dw_reg[ !is.na(dw_reg$padj),]
dw_reg_log=log10(dw_reg$padj)
names(dw_reg_log) = rownames(dw_reg)
dw_reg_log[dw_reg_log==-Inf] = min(dw_reg_log[dw_reg_log!=-Inf])

rankedlist = cbind(sort(c(up_reg_log,dw_reg_log),decreasing=T) )
rankedlist = data.frame(ensid=rownames(rankedlist), log10FDR=rankedlist)
write.table(rankedlist,"genes_ranked_lu_vs_wm_FCFDR.rnk", sep="\t", quote=F,col.names=F,row.names=F)

