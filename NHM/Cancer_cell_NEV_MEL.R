# Boxplot TFAP2C
library(readxl)
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

x = TFAP2C[,2]
names(x) = TFAP2C[,1]

zx = c(
x[1]-mean(x[1:2]),
x[2]-mean(x[1:2]),
x[3]-mean(x[3:4]),
x[4]-mean(x[3:4]),
x[5]-mean(x[5:6]),
x[6]-mean(x[5:6]),
x[7]-mean(x[7:8]),
x[8]-mean(x[7:8]),
x[9]-mean(x[9:10]),
x[10]-mean(x[9:10]),
x[11]-mean(x[11:12]),
x[12]-mean(x[11:12]),
x[13]-mean(x[13:14]),
x[14]-mean(x[13:14]),
x[15]-mean(x[15:16]),
x[16]-mean(x[15:16]),
x[17]-mean(x[17:18]),
x[18]-mean(x[17:18]),
x[19]-mean(x[19:20]),
x[20]-mean(x[19:20]),
x[21]-mean(x[21:22]),
x[22]-mean(x[21:22]),
x[23]-mean(x[23:25]),
x[24]-mean(x[23:25]),
x[25]-mean(x[23:25]),
x[26]-mean(x[26:27]),
x[27]-mean(x[26:27]),
x[28]-mean(x[28:29]),
x[29]-mean(x[28:29]),
x[30]-mean(x[30:31]),
x[31]-mean(x[30:31]),
x[32]-mean(x[32:33]),
x[33]-mean(x[32:33]),
x[34]-mean(x[34:35]),
x[35]-mean(x[34:35])
           )

TFAP2C = data.frame(cell = group_name, gene=as.numeric(zx) )

pdf("TFAP2C_Cancer_cell_RNA.pdf")
stripchart(gene ~ cell, vertical = TRUE, data = TFAP2C, jitter = 0.3, 
           ylab = expression('Log2 normalized by sample expected counts TFAP2C'),
    method = "jitter", pch = 20, col = alpha(colour='red',alpha=.5),cex = 2)
boxplot(gene ~ cell,data = TFAP2C,add=TRUE,boxlwd = 2)
dev.off()

TFAP2C$cell<-factor(TFAP2C$cell, levels=c("Nev", "Mel"))

pdf("TFAP2C_Cancer_cell_RNA_overplot_dashed.pdf")
stripchart(gene ~ cell, vertical = TRUE, data = TFAP2C,xlim=c(0,3), main ="TFAP2C",
           ylab = expression('Log2 normalized expected counts centered by patient sample'),
    method = "overplot", pch = 20, col = "red",cex = 2)
boxplot(gene ~ cell,data = TFAP2C,add=TRUE,boxlwd = 2)
dev.off()

pdf("TFAP2C_Cancer_cell_RNA_beeswarm.pdf")
beeswarm(gene ~ cell, vertical = TRUE, data = TFAP2C,xlim=c(0,3), main ="TFAP2C",
           ylab = expression('Log2 normalized expected counts centered by patient sample'),
    method = "swarm", pch = 20, col = alpha(colour='red',alpha=.5),cex = 2)
boxplot(gene ~ cell,data = TFAP2C,add=TRUE,boxlwd = 2)
dev.off()

lines( c(1,2), c(zx[2],zx[1]),lty=2,col="grey" )
lines( c(1,2), c(zx[4],zx[3]),lty=2,col="grey" )
lines( c(1,2), c(zx[6],zx[5]),lty=2,col="grey" )
lines( c(1,2), c(zx[8],zx[7]),lty=2,col="grey" )
lines( c(1,2), c(zx[10],zx[9]),lty=2,col="grey" )
lines( c(1,2), c(zx[12],zx[11]),lty=2,col="grey" )
lines( c(1,2), c(zx[14],zx[13]),lty=2,col="grey" )
lines( c(1,2), c(zx[16],zx[15]),lty=2,col="grey" )
lines( c(1,2), c(zx[18],zx[17]),lty=2,col="grey" )
lines( c(1,2), c(zx[20],zx[19]),lty=2,col="grey" )
lines( c(1,2), c(zx[22],zx[21]),lty=2,col="grey" )
lines( c(1,2), c(zx[24],zx[23]),lty=2,col="grey" )
lines( c(1,2), c(zx[25],zx[23]),lty=2,col="grey" )
lines( c(1,2), c(zx[27],zx[26]),lty=2,col="grey" )
lines( c(1,2), c(zx[29],zx[28]),lty=2,col="grey" )
lines( c(1,2), c(zx[31],zx[30]),lty=2,col="grey" )
lines( c(1,2), c(zx[33],zx[32]),lty=2,col="grey" )
lines( c(1,2), c(zx[35],zx[34]),lty=2,col="grey" )

lines( c(1,2), c(zx[1],zx[2]),lty=2,col="grey" )
lines( c(1,2), c(zx[3],zx[4]),lty=2,col="grey" )
lines( c(1,2), c(zx[5],zx[6]),lty=2,col="grey" )
lines( c(1,2), c(zx[7],zx[8]),lty=2,col="grey" )
lines( c(1,2), c(zx[9],zx[10]),lty=2,col="grey" )
lines( c(1,2), c(zx[11],zx[12]),lty=2,col="grey" )
lines( c(1,2), c(zx[13],zx[14]),lty=2,col="grey" )
lines( c(1,2), c(zx[15],zx[16]),lty=2,col="grey" )
lines( c(1,2), c(zx[17],zx[18]),lty=2,col="grey" )
lines( c(1,2), c(zx[19],zx[20]),lty=2,col="grey" )
lines( c(1,2), c(zx[21],zx[22]),lty=2,col="grey" )
lines( c(1,2), c(zx[23],zx[24]),lty=2,col="grey" )
lines( c(1,2), c(zx[23],zx[25]),lty=2,col="grey" )
lines( c(1,2), c(zx[26],zx[27]),lty=2,col="grey" )
lines( c(1,2), c(zx[28],zx[29]),lty=2,col="grey" )
lines( c(1,2), c(zx[30],zx[31]),lty=2,col="grey" )
lines( c(1,2), c(zx[32],zx[33]),lty=2,col="grey" )
lines( c(1,2), c(zx[34],zx[35]),lty=2,col="grey" )
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

library(pheatmap)
colnames(combined)[1] = "VE"
colnames(combined)[2] = "VE"
colnames(combined)[3] = "VE"
colnames(combined)[4] = "VE+KO"
colnames(combined)[5] = "VE+KO"
colnames(combined)[6] = "VE+KO"
sampleDists <- get_dist(t(combined),method="pearson")
library("RColorBrewer")
sampleDistMatrix <- as.matrix(sampleDists)
colnames(sampleDistMatrix) <- NULL
pdf("DISTANCE_heatmap_NEVI_MEL_NB_NBC_pearsonDistance_withLabels.pdf")
  colors <- (colorRampPalette( (brewer.pal(9, "RdYlBu")) )(200))
colnames(sampleDistMatrix) <-rownames( sampleDistMatrix)
pheatmap(sampleDistMatrix,
         clustering_distance_rows=sampleDists,
         clustering_distance_cols=sampleDists,
         col=colors,angle_col="90")
dev.off()
