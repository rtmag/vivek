
library(Rsubread)
options(scipen=999)


data<-featureCounts(c(
"22121b_Aligned.sortedByCoord.out.bam",
"22121n1_Aligned.sortedByCoord.out.bam",
"5009b2_Aligned.sortedByCoord.out.bam",
"5009n2_Aligned.sortedByCoord.out.bam",
"75350b_Aligned.sortedByCoord.out.bam",
"75350n_Aligned.sortedByCoord.out.bam",
"81374b1_Aligned.sortedByCoord.out.bam",
"81374n1_Aligned.sortedByCoord.out.bam",
"82483b1_Aligned.sortedByCoord.out.bam",
"82483n2_Aligned.sortedByCoord.out.bam",
"93178b1_Aligned.sortedByCoord.out.bam",
"93178n1_Aligned.sortedByCoord.out.bam"),
annot.ext="/logical_dev/resources/gencode.v28.chr_patch_hapl_scaff.annotation.gtf",
isGTFAnnotationFile=TRUE,
minMQS=4,
strandSpecific=2,
isPairedEnd=TRUE,
autosort=TRUE,
nthreads=15,
GTF.attrType="gene_name"
)

dat=data[[1]]
colnames(dat)=c("b2","n2",
                "b5","n5",
                "b7","n7",
                "b81","n81",
                "b82","n82",
                "b9","n9")

saveRDS(dat,"bapoma_counts.rds")
##############################################################################################################

countData=readRDS("bapoma_counts.rds")
options(scipen=999)
library(DESeq2)
library(gplots)
library(factoextra)
library(RColorBrewer)

design<-data.frame(patient = c("2","2","5","5","7","7","81","81","82","82","9","9"),
                    status = c("bap","norm","bap","norm","bap","norm","bap","norm","bap","norm","bap","norm") )

dds <- DESeqDataSetFromMatrix(countData = countData, colData = design, design = ~ patient + status )
dds <- DESeq(dds)
dds_vsd <- varianceStabilizingTransformation(dds)
dds_res = results(dds)
vsd = assay(dds_vsd)

pdf("Diagnostic_pca_all_samples_patient.pdf")
plotPCA(dds_vsd,ntop=20000,intgroup=c("status"))
dev.off()

saveRDS(vsd,"bapoma_vsd_patient.rds")
##############################################################################################################
A = "Normal"
B = "Bapoma"
  # Volcano
  title= "norm_vs_bap_volcano_patient.pdf"
  pdf(title)
  plot(dds_res$log2FoldChange,-log10(dds_res$padj),xlab=expression('Log'[2]*paste(' Fold Change ')),
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
  title= "norm_vs_bap_heatmap_patient.ps"
  postscript(title,height=10,width=10,horizontal=F)
  sig_vsd = vsd[which(abs(dds_res$log2FoldChange)>1 & dds_res$padj<0.05),]
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))
  heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  labRow = FALSE,xlab="", ylab="Genes",key.title="Gene expression",cexCol=.8)
  dev.off()

  title= "norm_vs_bap_heatmap_FDR5_patient.pdf"
  pdf(title,height=10,width=10)
  sig_vsd = vsd[which(dds_res$padj<0.05),]
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))
  heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  labRow = FALSE,xlab="", ylab=paste(dim(sig_vsd)[1]," Genes"),key.title="Gene expression",cexCol=.8)
  dev.off()

# MAplot
  title= "norm_vs_bap_maplot_patient.pdf"
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
  title= "norm_vs_bap_genes_ranked_table_FCFDR_patient.rnk"
  write.table(rankedlist,title, sep="\t", quote=F,col.names=F,row.names=F)
# Significant Results ordered by log2FC
  csv_table = dds_res[which(dds_res$padj<0.05 & abs(dds_res$log2FoldChange)>1),]
  csv_table = csv_table[order(csv_table$log2FoldChange),]
  title= "norm_vs_bap_differentially_expressed_genes_patient.csv"
  write.csv(csv_table,title)
# Full list ordered by log2FC
  write.csv(  dds_res,"norm_vs_bap_differentially_expressed_genes_allGenes_patient.csv")

#############################################################################################################

#removing patient 81
#design<-data.frame(patient = c("2","2","5","5","7","7","81","81","82","82","9","9"),
#                    status = c("bap","norm","bap","norm","bap","norm","bap","norm","bap","norm","bap","norm") )
design<-data.frame(patient = c("2","2","5","5","7","7","82","82","9","9"),
                    status = c("bap","norm","bap","norm","bap","norm","bap","norm","bap","norm") )
#removing patient 81
dds <- DESeqDataSetFromMatrix(countData = countData[,c(1:6,9:12)], colData = design, design = ~ patient + status )
dds <- DESeq(dds)
dds_vsd <- varianceStabilizingTransformation(dds)
dds_res = results(dds)
vsd = assay(dds_vsd)

pdf("Diagnostic_pca_all_samples_patient81Removed.pdf")
plotPCA(dds_vsd,ntop=50000,intgroup=c("status"))
dev.off()

saveRDS(vsd,"bapoma_vsd_patient81Removed.rds")
##############################################################################################################
A = "Normal"
B = "Bapoma"
  # Volcano
  title= "norm_vs_bap_volcano_patient81Removed.pdf"
  pdf(title)
  plot(dds_res$log2FoldChange,-log10(dds_res$padj),xlab=expression('Log'[2]*paste(' Fold Change ')),
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
  title= "norm_vs_bap_heatmap_patient81Removed.ps"
  postscript(title,height=10,width=10,horizontal=F)
  sig_vsd = vsd[which(abs(dds_res$log2FoldChange)>1 & dds_res$padj<0.05),]
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))
  heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  labRow = FALSE,xlab="", ylab="Genes",key.title="Gene expression",cexCol=.8)
  dev.off()

  title= "norm_vs_bap_heatmap_FDR5_patient81Removed.pdf"
  pdf(title,height=10,width=10)
  sig_vsd = vsd[which(dds_res$padj<0.05),]
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))
  heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  labRow = FALSE,xlab="", ylab=paste(dim(sig_vsd)[1]," Genes"),key.title="Gene expression",cexCol=.8)
  dev.off()

# MAplot
  title= "norm_vs_bap_maplot_patient81Removed.pdf"
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
  title= "norm_vs_bap_genes_ranked_table_FCFDR_patient81Removed.rnk"
  write.table(rankedlist,title, sep="\t", quote=F,col.names=F,row.names=F)
# Significant Results ordered by log2FC
  csv_table = dds_res[which(dds_res$padj<0.05 & abs(dds_res$log2FoldChange)>1),]
  csv_table = csv_table[order(csv_table$log2FoldChange),]
  title= "norm_vs_bap_differentially_expressed_genes_patient81Removed.csv"
  write.csv(csv_table,title)
# Full list ordered by log2FC
  write.csv(  dds_res,"norm_vs_bap_differentially_expressed_genes_allGenes_patient81Removed.csv")
