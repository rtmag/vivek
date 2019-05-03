library(beeswarm)
library(graphics)
library(gplots)
library(ggplot2)

#####################################################################################################################
data = read.table("data_RNA_Seq_v2_expression_median.txt",header=T,sep="\t")
data1 = data[which(data$Hugo_Symbol %in% c("TFAP2A","TFAP2B","TFAP2C","TFAP2D","TFAP2E","TFAP4",
                                            "GAPDH","ACTB","HSPA4","HSPA5")),]
rownames(data1) = data1[,1]
data1 = data1[,3:dim(data1)[2]]
data1 = log2((data1+1))
jit1 <- setNames(split(data1, seq(nrow(data1))), rownames(data1))
box1 <- t(data1)

pdf("jitter_SKCM_RNA_TFAP2_family.pdf")
stripchart(jit1,vertical = TRUE,jitter = 0.3, ylab = expression('Log'[2]*' Normalized Tag Count TCGA:SKCM'),
           method = "jitter", pch = 20, col = alpha(colour='red',alpha=.1),cex = 2,las=2)
boxplot(box1, add = TRUE,boxlwd = 2,las=2,outline=FALSE)
dev.off()
#####################################################################################################################
data = read.table("data_RNA_Seq_v2_expression_median.txt",header=T,sep="\t")
data1 = data[which(data$Hugo_Symbol %in% c("TFAP2C",
                                            "GAPDH","ACTB","HSPA4","HSPA5")),]
rownames(data1) = data1[,1]
data1 = data1[,3:dim(data1)[2]]
data1 = log2((data1+1))
jit1 <- setNames(split(data1, seq(nrow(data1))), rownames(data1))
box1 <- t(data1)

pdf("jitter_SKCM_RNA_TFAP2C.pdf")
stripchart(jit1,vertical = TRUE,jitter = 0.3, ylab = expression('Log'[2]*' Normalized Tag Count TCGA:SKCM'),
           method = "jitter", pch = 20, col = alpha(colour='red',alpha=.1),cex = 2,las=2)
boxplot(box1, add = TRUE,boxlwd = 2,las=2,outline=FALSE)
dev.off()
#####################################################################################################################


# MELANOMA
data = read.table("GSE72056_melanoma_single_cell_revised_v2.txt",sep="\t",header=T)
genenames = as.character( data[ 4:dim(data)[1], 1 ] )
cells = as.character(data[1,2:dim(data)[2]])
data = data[4:dim(data)[1], 2:dim(data)[2]]
####

TFAP2C = data[genenames=="TFAP2C",]
TFAP2C = data.frame(cell = cells, gene=(as.numeric(TFAP2C)) )

GAPDH = data[genenames=="GAPDH",]
GAPDH = data.frame(cell = cells, gene=(as.numeric(GAPDH)) )

ACTB = data[genenames=="ACTB",]
ACTB = data.frame(cell = cells, gene=(as.numeric(ACTB)) )

HSPA4 = data[genenames=="HSPA4",]
HSPA4 = data.frame(cell = cells, gene=(as.numeric(HSPA4)) )

HSPA5 = data[genenames=="HSPA5",]
HSPA5 = data.frame(cell = cells, gene=(as.numeric(HSPA5)) )

pdf("singleCell_Melanoma_TFAP2C.pdf")
par(mfrow=c(5,1))
stripchart(gene ~ cell, vertical = TRUE, data = TFAP2C, jitter = 0.3, ylab = expression('Single Cell TFAP2C TPM'),
    method = "jitter", pch = 20, col = alpha(colour='red',alpha=.1),cex = 2,las=2)
boxplot(gene ~ cell,data = TFAP2C, add = TRUE,boxlwd = 2,las=2,outline=FALSE)
dev.off()

pdf("singleCell_Melanoma_GAPDH.pdf")
stripchart(gene ~ cell, vertical = TRUE, data = GAPDH, jitter = 0.3, ylab = expression('Single Cell GAPDH TPM'),
    method = "jitter", pch = 20, col = alpha(colour='red',alpha=.1),cex = 2,las=2)
boxplot(gene ~ cell,data = GAPDH, add = TRUE,boxlwd = 2,las=2,outline=FALSE)
dev.off()

pdf("singleCell_Melanoma_ACTB.pdf")
stripchart(gene ~ cell, vertical = TRUE, data = ACTB, jitter = 0.3, ylab = expression('Single Cell ACTB TPM'),
    method = "jitter", pch = 20, col = alpha(colour='red',alpha=.1),cex = 2,las=2)
boxplot(gene ~ cell,data = ACTB, add = TRUE,boxlwd = 2,las=2,outline=FALSE)
dev.off()

pdf("singleCell_Melanoma_HSPA4.pdf")
stripchart(gene ~ cell, vertical = TRUE, data = HSPA4, jitter = 0.3, ylab = expression('Single Cell HSPA4 TPM'),
    method = "jitter", pch = 20, col = alpha(colour='red',alpha=.1),cex = 2,las=2)
boxplot(gene ~ cell,data = HSPA4, add = TRUE,boxlwd = 2,las=2,outline=FALSE)
dev.off()

pdf("singleCell_Melanoma_HSPA5.pdf")
stripchart(gene ~ cell, vertical = TRUE, data = HSPA5, jitter = 0.3, ylab = expression('Single Cell HSPA5 TPM'),
    method = "jitter", pch = 20, col = alpha(colour='red',alpha=.1),cex = 2,las=2)
boxplot(gene ~ cell,data = HSPA5, add = TRUE,boxlwd = 2,las=2,outline=FALSE)
dev.off()
