
library(Rsubread)
options(scipen=999)

data<-featureCounts(c(
"BRAF_1_Aligned.sortedByCoord.out.bam",
"BRAF_2_Aligned.sortedByCoord.out.bam",
"BRAF_3_Aligned.sortedByCoord.out.bam",
"BRAF_+_CDKN2A_1_Aligned.sortedByCoord.out.bam",
"BRAF_+_CDKN2A_2_Aligned.sortedByCoord.out.bam",
"BRAF_+_CDKN2A_3_Aligned.sortedByCoord.out.bam",
"CDKN2A_1_Aligned.sortedByCoord.out.bam",
"CDKN2A_2_Aligned.sortedByCoord.out.bam",
"CDKN2A_3_Aligned.sortedByCoord.out.bam",
"NHM_1_Aligned.sortedByCoord.out.bam",
"NHM_2_Aligned.sortedByCoord.out.bam",
"NHM_3_Aligned.sortedByCoord.out.bam"),
annot.ext="/root/resources/gencode.v27.annotation.gtf",
isGTFAnnotationFile=TRUE,
minMQS=4,
strandSpecific=0,
isPairedEnd=TRUE,
#PE_orientation="rf",
autosort=TRUE,
nthreads=40,
GTF.attrType="gene_name"
)

dat=data[[1]]
colnames(dat)=c("BRAF_1","BRAF_2","BRAF_3",
                "B_C_1","B_C_2","B_C_3",
                "CDKN2A_1","CDKN2A_2","CDKN2A_3",
                "NHM_1","NHM_2","NHM_3")

saveRDS(dat,"NHM_counts.rds")

############################################################################################################

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

dLRT <- DESeqDataSetFromMatrix(countData = countData, colData = design, design = ~ group )
dLRT <- DESeq(dLRT, test="LRT", reduced=~1)
dLRT_vsd <- varianceStabilizingTransformation(dLRT)
dLRT_res = results(dLRT)
vsd = assay(dLRT_vsd)

pdf("Diagnostic_pca_all_samples.pdf")
plotPCA(dLRT_vsd,ntop=50000,intgroup=c("group"))
dev.off()

saveRDS(vsd,"NHM_vsd.rds")

############################################################################################################
postscript("anova.ps",height=10,width=10,horizontal=F)
sig_vsd = vsd[which(dLRT_res$padj<0.05),]

colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))
heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="", ylab="Genes",key.title="Gene expression",cexCol=.8)
dev.off()

postscript("anova_othercolor.ps",height=10,width=10,horizontal=F)
sig_vsd = vsd[which(dLRT_res$padj<0.05),]

colors <- colorRampPalette(c("blue","white","red"))(45)
heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="", ylab="Genes",key.title="Gene expression",cexCol=.8)
dev.off()
############################################################################################################
  options(scipen=999)
  library(DESeq2)
  library(gplots)
  library(factoextra)
  library(RColorBrewer)

deseq_analysis = function( countData, vsd, A, A_ix, B, B_ix){
  # DESEQ2
  design <- data.frame( group = c( rep(A, 3), rep(B, 3) ) )
  dds <- DESeqDataSetFromMatrix(countData = countData[, c(A_ix, B_ix) ], colData = design, design = ~ group )
  dds <- DESeq(dds)
  dds_res = results(dds,contrast=c("group",A,B))
  # Volcano
  title= paste(A,"_VS_",B,"_volcano.pdf")
  pdf(title)
  plot(dds_res$log2FoldChange,-log10(dds_res$padj),xlab=expression('Log'[2]*paste(' Fold Change ',A,' / ',B)),
              ylab=expression('-Log'[10]*' Q-values'),col=alpha("grey",.5),pch=20 )
  abline(v=-1,lty = 2,col="grey")
  abline(v=1,lty = 2,col="grey")
  abline(h=-log10(0.05),lty = 2,col="grey")
  points(dds_res$log2FoldChange[abs(dds_res$log2FoldChange)>1 & dds_res$padj<0.05],
       -log10(dds_res$padj)[abs(dds_res$log2FoldChange)>1 & dds_res$padj<0.05],
      col="red",pch=20)
  legend("topright", paste(A,":",length(which(dds_res$log2FoldChange>1 & dds_res$padj<0.05))), bty="n") 
  legend("topleft", paste(B,":",length(which(dds_res$log2FoldChange<(-1) & dds_res$padj<0.05))), bty="n") 
  dev.off()
  # Heatmap
  title= paste(A,"_VS_",B,"_heatmap.ps")
  postscript(title,height=10,width=10,horizontal=F)
  sig_vsd = vsd[which(abs(dds_res$log2FoldChange)>1 & dds_res$padj<0.05), c(A_ix, B_ix)]
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))
  heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  labRow = FALSE,xlab="", ylab="Genes",key.title="Gene expression",cexCol=.8)
  dev.off()
  # Heatmap ALL
  title= paste(A,"_VS_",B,"_heatmap_all_samples.ps")
  postscript(title,height=10,width=10,horizontal=F)
  sig_vsd = vsd[which(abs(dds_res$log2FoldChange)>1 & dds_res$padj<0.05),]
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))
  heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  labRow = FALSE,xlab="", ylab="Genes",key.title="Gene expression",cexCol=.8)
  dev.off()
# MAplot
  title= paste(A,"_VS_",B,"_maplot.ps")
  pdf(title)
  plotMA(dds_res)
  dev.off()
# RankedListFor GSEA
  up_reg = dds_res[ which(dds_res$log2FoldChange>0),]
  up_reg = up_reg[ !is.na(up_reg$padj),]
  up_reg_log=-log(up_reg$padj)
  names(up_reg_log) = rownames(up_reg)
  dw_reg = dds_res[ which(dds_res$log2FoldChange<0),]
  dw_reg = dw_reg[ !is.na(dw_reg$padj),]
  dw_reg_log=log(dw_reg$padj)
  names(dw_reg_log) = rownames(dw_reg)

  rankedlist = cbind(sort(c(up_reg_log,dw_reg_log),decreasing=T) )
  rankedlist = data.frame(ensid=rownames(rankedlist), log10FDR=rankedlist)
  title= paste(A,"_VS_",B,"_genes_ranked_table_FCFDR.rnk")
  write.table(rankedlist,title, sep="\t", quote=F,col.names=F,row.names=F)
# Significant Results ordered by log2FC
  csv_table = dds_res[which(dds_res$padj<0.05 & abs(dds_res$log2FoldChange)>1),]
  csv_table = csv_table[order(csv_table$log2FoldChange),]
  title= paste(A,"_VS_",B,"_differentially_expressed_genes.csv")
  write.csv(csv_table,title)
}

countData=readRDS("NHM_counts.rds")
vsd = readRDS("NHM_vsd.rds")

# 1) NHM VS BRAF
deseq_analysis(countData, vsd, A="NHM", A_ix=10:12, B="BRAF", B_ix=1:3)

# 2) NHM VS CDKN2A
deseq_analysis(countData, vsd, A="NHM", A_ix=10:12, B="CDKN2A", B_ix=4:6)

# 3) NHM VS BRAF_CDKN2A
deseq_analysis(countData, vsd, A="NHM", A_ix=10:12, B="BRAF_CDKN2A", B_ix=7:9)

# 4) BRAF VS BRAF_CDKN2A
deseq_analysis(countData, vsd, A="BRAF", A_ix=1:3, B="BRAF_CDKN2A", B_ix=7:9)

# 5) CDKN2A VS BRAF_CDKN2A
deseq_analysis(countData, vsd, A="CDKN2A", A_ix=10:12, B="BRAF_CDKN2A", B_ix=7:9)


