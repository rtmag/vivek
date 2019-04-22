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
