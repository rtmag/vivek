# Boxplot TFAP2C
data <- read_excel("hunterRNAseq.xlsx", sheet = 3)

data = data.frame(data)

expr = data[3:22463,6:47]
sample_name = data[2,6:47]

ix = !1:dim(sample_name)[2] %in% 
c(grep("T21",as.character(sample_name)),grep("JJS13",as.character(sample_name)),grep("JJS17",as.character(sample_name)))

expr = expr[,ix]

group_name = as.character(sample_name[ix])
colnames(group_name) = NULL
group_name[grep("Nev",as.character(group_name))] = "Nev"
group_name[grep("Mel",as.character(group_name))] = "Mel"

colnames(expr) = group_name

gene_name=(data[3:dim(data)[1],4])
gene_name = make.names(gene_name,unique=T)
rownames(expr) = gene_name

saveRDS(expr,"expr_group_name.rds")

library(ggplot2)
library(graphics)
library(scales)
library(vegan)
options(scipen=999)
library(gplots)
library(factoextra)
library(RColorBrewer)
library(openxlsx)
library(beeswarm)

TFAP2C = data.frame(cell = group_name, gene=as.numeric(expr[which(rownames(expr)=="TFAP2C"),]) )

pdf("TFAP2C_Cancer_cell_RNA.pdf")
stripchart(gene ~ cell, vertical = TRUE, data = TFAP2C, jitter = 0.3, 
           ylab = expression('Log2 normalized by sample expected counts TFAP2C'),
    method = "jitter", pch = 20, col = alpha(colour='red',alpha=.5),cex = 2)
boxplot(gene ~ cell,data = TFAP2C,add=TRUE,boxlwd = 2)
dev.off()

####################################################################################################
options(scipen=999)
library(DESeq2)
library(gplots)
library(factoextra)
library(RColorBrewer)

expr = readRDS("expr_group_name.rds")

countData = readRDS("~/CSI/vivek/chip-seq/poised_scatterplot/NHM_counts.rds")
vsd = readRDS("~/CSI/vivek/chip-seq/poised_scatterplot/NHM_vsd.rds")

design <- data.frame( group = c("BRAF","BRAF","BRAF","BC","BC","BC" ) )
  dds <- DESeqDataSetFromMatrix(countData = countData[,1:6], colData = design, design = ~ group )
  dds <- DESeq(dds)
  dds_res = results(dds,contrast=c("group","BC","BRAF"))

  sig_vsd = vsd[which(abs(dds_res$log2FoldChange)>1 & dds_res$padj<0.05), 1:6]
  sig_expr = expr[rownames(expr) %in% rownames(sig_vsd),]

  sig_expr= as.data.frame.matrix(sig_expr)

  sig_vsd = sig_vsd[rownames(sig_vsd) %in% rownames(sig_expr),]

ix = match(rownames(sig_expr),rownames(sig_vsd))
sig_vsd=sig_vsd[ix,]

tt= matrix(as.numeric(unlist(sig_expr)),ncol=35)
rownames(tt) = rownames(sig_expr)
colnames(tt) = colnames(sig_expr)

combined= cbind(sig_vsd-rowMeans(sig_vsd),tt-rowMeans(tt))
combined=combined[complete.cases(combined),]

png("heatmap_NEVI_MEL_NB_NBC.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(9))
  heatmap.2(combined,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  labRow = FALSE,xlab="", ylab="Genes",key.title="Gene expression",cexCol=.8)
dev.off()


png("heatmap_NB_NBC.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(9))
  heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  labRow = FALSE,xlab="", ylab="Genes",key.title="Gene expression",cexCol=.8)
dev.off()

pca <- prcomp(combined, center = TRUE,scale. = TRUE)

track = colnames(combined)
track[grep('BRAF',track)] = 1
track[grep('B_C',track)] = 2
track[track=="Nev"]=3
track[track=="Mel"]=4

track=as.numeric(track)
colores=c("red","green","blue","purple")
clab=as.character(colores[track])

sx=summary(pca)

#pdf("PCA_Nevi_vs_melanoma_FDR5e-2_DIF15_no9_no10_centered.pdf")
plot(pca$rotation[,1],pca$rotation[,2],col=clab,pch=19,
    xlab=paste("PCA1:",round(sx$importance[2,1]*100,digits=1),"%"),ylab=paste("PCA2:",round(sx$importance[2,2]*100,digits=1),"%"))
legend("topright",legend=c("NB","NBC","NEV","MEL"),fill=c("red","green","blue","purple"), border=T, bty="n" )
#dev.off()

