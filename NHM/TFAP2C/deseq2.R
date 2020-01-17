library(Rsubread)
options(scipen=999)

data<-featureCounts(c(
"VMRLP-101_S292_Aligned.sortedByCoord.out.bam",
"VMRLP-102_S293_Aligned.sortedByCoord.out.bam",
"VMRLP-103_S294_Aligned.sortedByCoord.out.bam",
"VMRLP-104_S295_Aligned.sortedByCoord.out.bam",
"VMRLP-105_S296_Aligned.sortedByCoord.out.bam",
"VMRLP-106_S297_Aligned.sortedByCoord.out.bam"),
annot.ext="/root/resources/gencode.v27.annotation.gtf",
isGTFAnnotationFile=TRUE,
minMQS=4,
strandSpecific=0,
isPairedEnd=TRUE,
autosort=TRUE,
nthreads=40,
GTF.attrType="gene_name"
)

dat=data[[1]]
colnames(dat)=c("CTRL_1","CTRL_2","CTRL_3",
                "TFAP2CKO_1","TFAP2CKO_2","TFAP2CKO_3")
                
saveRDS(dat,"TFAP2C_counts.rds")
##############################################################################################################
##############################################################################################################
countData=readRDS("TFAP2C_counts.rds")
options(scipen=999)
library(DESeq2)
library(gplots)
library(factoextra)
library(RColorBrewer)

#design<-data.frame( group=c("CTRL","CTRL","CTRL","TFAP2CKO","TFAP2CKO","TFAP2CKO") )
design<-data.frame( group=c("CTRL1","CTRL2","CTRL3","TFAP2CKO1","TFAP2CKO2","TFAP2CKO3") )
#design<-data.frame( group=c("CTRL_1","CTRL_2","CTRL_3","TFAP2CKO_1","TFAP2CKO_2") )

dLRT <- DESeqDataSetFromMatrix(countData = countData, colData = design, design = ~ group )
dLRT <- DESeq(dLRT, test="LRT", reduced=~1)
dLRT_vsd <- varianceStabilizingTransformation(dLRT)
dLRT_res = results(dLRT)
vsd = assay(dLRT_vsd)

pdf("Diagnostic_pca_TFAP2C_names_noKO3.pdf")
plotPCA(dLRT_vsd,ntop=50000,intgroup=c("group"))
dev.off()

saveRDS(vsd,"TFAP2C_vsd.rds")
##############################################################################################################
##############################################################################################################
  design<-data.frame( group=c("CTRL","CTRL","CTRL","TFAP2CKO","TFAP2CKO","TFAP2CKO") )
#  design<-data.frame( group=c("CTRL","CTRL","CTRL","TFAP2CKO","TFAP2CKO") )
  dds <- DESeqDataSetFromMatrix(countData = countData, colData = design, design = ~ group )
  dds <- DESeq(dds)
  dds_res = results(dds,contrast=c("group","TFAP2CKO","CTRL"))
  # Volcano
  title=paste("TFAP2CKO_VS_CTRL_volcano_fc.8.pdf")
  pdf(title)
  plot(dds_res$log2FoldChange,-log10(dds_res$padj),xlab=expression('Log'[2]*paste(' Fold Change ')),
              ylab=expression('-Log'[10]*' Q-values'),col=alpha("grey",.5),pch=20 )
  abline(v=-.8,lty = 2,col="grey")
  abline(v=.8,lty = 2,col="grey")
  abline(h=-log10(0.05),lty = 2,col="grey")
  points(dds_res$log2FoldChange[abs(dds_res$log2FoldChange)>.8 & dds_res$padj<0.05],
       -log10(dds_res$padj)[abs(dds_res$log2FoldChange)>.8 & dds_res$padj<0.05],
      col="red",pch=20)
  legend("topright", paste("TFAP2CKO",":",length(which(dds_res$log2FoldChange>.8 & dds_res$padj<0.05))), bty="n") 
  legend("topleft", paste("CTRL",":",length(which(dds_res$log2FoldChange<(-.8) & dds_res$padj<0.05))), bty="n") 
  dev.off()

  # Heatmap
  title= "TFAP2CKO_VS_CTRL_heatmap.pdf"
  pdf(title,height=10,width=10)
  sig_vsd = vsd[which(abs(dds_res$log2FoldChange)>.8 & dds_res$padj<0.05), ]
  colnames(sig_vsd) <- gsub("_","",colnames(sig_vsd))
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))
  heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Genes",key.title="Gene expression",cexCol=.8)
  dev.off()
##############################################################################################################
write.table(rownames(sig_vsd),"TFAP2C_genelist.txt",quote=F,col.names=F,row.names=F,sep="\t")
##############################################################################################################
library(clusterProfiler)
library(DOSE)
library(enrichplot)
library("org.Hs.eg.db")
library(ReactomePA)
library(reactome.db) 

gene.table1<-read.table("TFAP2C_genelist.txt",sep="\t")

gene1.df <- bitr(as.character(gene.table1[,1]), fromType = "SYMBOL",
        toType = c("ENSEMBL", "ENTREZID"),
        OrgDb = org.Hs.eg.db)

geneEntrez <- list(DownReg = gene1.df$ENTREZID)

x=compareCluster(geneEntrez, fun='enrichGO',
                 OrgDb         = org.Hs.eg.db,
                 ont           = "BP")
       
pdf("dotplot_GOBP_def.pdf",height=10,width=10)
dotplot(x, showCategory=15, includeAll=FALSE)
dev.off()

x=compareCluster(geneEntrez, fun="enrichPathway", organism = "human")

pdf("dotplot_enrichPathway_10.pdf",height=10,width=10)
dotplot(x, showCategory=10, includeAll=FALSE)
dev.off()

x=compareCluster(geneEntrez, fun="groupGO", OrgDb='org.Hs.eg.db')

pdf("dotplot_groupGO_10.pdf",height=10,width=10)
dotplot(x, showCategory=10, includeAll=FALSE)
dev.off()

x=compareCluster(geneEntrez, fun="enrichKEGG", organism = "human", qvalueCutoff = 0.1)

pdf("dotplot_enrichKEGG_10.pdf",height=10,width=12)
dotplot(x, showCategory=10, includeAll=FALSE,font.size=22)
dev.off()
