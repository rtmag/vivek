
library(Rsubread)
options(scipen=999)

sink("RNA-Seq_featureCounts.log")

data<-featureCounts(c(
"R26_Aligned.sortedByCoord.out.bam",
"R27_Aligned.sortedByCoord.out.bam",
"R28_Aligned.sortedByCoord.out.bam",
"R29_Aligned.sortedByCoord.out.bam",
"R30_Aligned.sortedByCoord.out.bam",
"R31_Aligned.sortedByCoord.out.bam",
"R32_Aligned.sortedByCoord.out.bam",
"R33_Aligned.sortedByCoord.out.bam",
"R34_Aligned.sortedByCoord.out.bam",
"R35_Aligned.sortedByCoord.out.bam",
"R36_Aligned.sortedByCoord.out.bam",
"R37_Aligned.sortedByCoord.out.bam",
"R38_Aligned.sortedByCoord.out.bam",
"R39_Aligned.sortedByCoord.out.bam",
"R40_Aligned.sortedByCoord.out.bam",
"S10_Aligned.sortedByCoord.out.bam",
"S11_Aligned.sortedByCoord.out.bam",
"S12_Aligned.sortedByCoord.out.bam",
"S13_Aligned.sortedByCoord.out.bam",
"S14_Aligned.sortedByCoord.out.bam",
"S15_Aligned.sortedByCoord.out.bam",
"S16_Aligned.sortedByCoord.out.bam",
"S17_Aligned.sortedByCoord.out.bam",
"S18_Aligned.sortedByCoord.out.bam",
"S1_Aligned.sortedByCoord.out.bam",
"S2_Aligned.sortedByCoord.out.bam",
"S38_Aligned.sortedByCoord.out.bam",
"S3_Aligned.sortedByCoord.out.bam",
"S4_Aligned.sortedByCoord.out.bam",
"S5_Aligned.sortedByCoord.out.bam",
"S6_Aligned.sortedByCoord.out.bam",
"S7_Aligned.sortedByCoord.out.bam",
"S8_Aligned.sortedByCoord.out.bam",
"S9_Aligned.sortedByCoord.out.bam"),
annot.ext="/root/resources/gencode.v27.annotation.gtf",
isGTFAnnotationFile=TRUE,
minMQS=4,
strandSpecific=0,
isPairedEnd=TRUE,
autosort=TRUE,
nthreads=40,
GTF.attrType="gene_name"
)

sink()


dat=data[[1]]
colnames(dat)=c("R26","R27","R28","R29","R30","R31","R32","R33","R34","R35","R36","R37","R38","R39","R40",
                "R1","R2","R18","R9","R15","R16","R6","R8","R21","R13","R14","B1","R22","R3","R12","R11","R4","R5","R7")

x = dat[,c(16:17,29,32,33,22,34,23,19,31,30,25,26,20,21,18,24,28,1:15,27)]

saveRDS(x,"Feature_counts.rds")
#################################################################################################################################
countData=readRDS("Feature_counts.rds")
options(scipen=999)
library(DESeq2)
library(gplots)
library(factoextra)
library(RColorBrewer)

design<-data.frame(cell=c(
"Normal","Nevus","Melanoma", #1-3
"Normal","Nevus","Melanoma", #4-6
"Normal","Nevus","Melanoma", #7-9
         "Nevus","Melanoma", #10-12
         "Nevus","Melanoma", #13-14
         "Nevus","Melanoma", #15-16
                 "Melanoma", #18
         "Nevus","Melanoma", #21-22
"Normal","MIS","Melanoma",   #26-28
"Normal","Nevus","Melanoma", #29-31
         "Nevus","Melanoma", #32-33
         "Nevus","Melanoma", #34-35
         "Nevus","Melanoma", #36-37
"Normal","Nevus","Melanoma" #38-40
                          ),
patient=c(
1,1,1,
2,2,2,
3,3,3,
4,4,
5,5,
6,6,
7,
8,8,
9,9,9,
10,10,10,
11,11,
12,12,
13,13,
14,14,14)
)


#################################################################################################################################
dLRT <- DESeqDataSetFromMatrix(countData = countData[,1:33], colData = design, design = ~ cell )
dLRT <- DESeq(dLRT, test="LRT", reduced=~1)
dLRT_vsd <- varianceStabilizingTransformation(dLRT)
dLRT_res = results(dLRT)
vsd = assay(dLRT_vsd)
saveRDS(vsd,"NHM_vsd.rds")

pdf("Diagnostic_pca_all_samples.pdf")
plotPCA(dLRT_vsd,ntop=50000,intgroup=c("cell"))
dev.off()


sig_vsd = vsd[which(dLRT_res$padj<0.05),]

track=as.character(design$cell)
track[track=="Normal"]=1
track[track=="Melanoma"]=2
track[track=="Nevus"]=3
track[track=="MIS"]=4

track=as.numeric(track)
colores=c("#ffdfba","#ffb3ba","#baffc9","#bae1ff")
clab=as.character(colores[track])

colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(9))

png("anova_heatmap.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="", ylab=paste(dim(sig_vsd)[1],"Genes"),key.title="Gene expression",cexCol=.8,ColSideColors=clab)
legend("topright",legend=c("Normal","Melanoma","Nevi","MIS"),fill=c("#ffdfba","#ffb3ba","#baffc9","#bae1ff"), border=T, bty="n" )
dev.off()
############################################################################################################

deseq_analysis = function( countData, vsd, A, A_ix, B, B_ix, clab){
  # DESEQ2
  design <- data.frame( group = c( rep(A, length(A_ix)), rep(B, length(B_ix)) ) )
  dds <- DESeqDataSetFromMatrix(countData = countData[, c(A_ix, B_ix) ], colData = design, design = ~ group )
  dds <- DESeq(dds)
  dds_res = results(dds,contrast=c("group",A,B))
  # Volcano
  title= paste(A,"_VS_",B,"_volcano.pdf",sep="")
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
  title= paste(A,"_VS_",B,"_heatmap.png",sep="")  
png(title,width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
  sig_vsd = vsd[which(abs(dds_res$log2FoldChange)>1 & dds_res$padj<0.05), c(A_ix, B_ix)]
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(9))
  cclab = clab[c(A_ix, B_ix)]
  heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  labRow = FALSE,xlab="", ylab=paste(dim(sig_vsd)[1],"Genes"),key.title="Gene expression",cexCol=.8,ColSideColors=cclab)
  legend("topright",legend=c("Normal","Melanoma","Nevi","MIS"),fill=c("#ffdfba","#ffb3ba","#baffc9","#bae1ff"), border=T, bty="n")
  dev.off()
  # Heatmap ALL
  title= paste(A,"_VS_",B,"_heatmap_all_samples.png",sep="")
png(title,width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
  sig_vsd = vsd[which(abs(dds_res$log2FoldChange)>1 & dds_res$padj<0.05),]
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(9))
  heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  labRow = FALSE,xlab="", ylab=paste(dim(sig_vsd)[1],"Genes"),key.title="Gene expression",cexCol=.8,ColSideColors=clab)
  legend("topright",legend=c("Normal","Melanoma","Nevi","MIS"),fill=c("#ffdfba","#ffb3ba","#baffc9","#bae1ff"), border=T, bty="n" )
  dev.off()
# MAplot
  title= paste(A,"_VS_",B,"_maplot.pdf",sep="")
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
  title= paste(A,"_VS_",B,"_genes_ranked_table_FCFDR.rnk",sep="")
  write.table(rankedlist,title, sep="\t", quote=F,col.names=F,row.names=F)
# Significant Results ordered by log2FC
#  csv_table = dds_res[which(dds_res$padj<0.05 & abs(dds_res$log2FoldChange)>1),]
  csv_table = dds_res
  csv_table = csv_table[order(csv_table$log2FoldChange),]
  title= paste(A,"_VS_",B,"_differentially_expressed_genes.csv",sep="")
  write.csv(csv_table,title)
}


# 1) Normal VS Nevi
deseq_analysis(countData, vsd, A="Normal", A_ix=which(design$cell=="Normal"), B="Nevus", B_ix=which(design$cell=="Nevus"), clab=clab )

# 2) Normal VS Melanoma
deseq_analysis(countData, vsd, A="Normal", A_ix=which(design$cell=="Normal"),B="Melanoma", B_ix=which(design$cell=="Melanoma"),clab=clab)

# 3) Nevi VS Melanoma
deseq_analysis(countData, vsd, A="Nevus", A_ix=which(design$cell=="Nevus"), B="Melanoma", B_ix=which(design$cell=="Melanoma"),clab=clab)
