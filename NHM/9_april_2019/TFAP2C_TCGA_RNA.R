library(beeswarm)
library(graphics)
library(gplots)
library(ggplot2)


data = read.table("data_RNA_Seq_v2_expression_median.txt",header=T,sep="\t")
data1 = data[which(data$Hugo_Symbol %in% c("TFAP2A","TFAP2B","TFAP2C","TFAP2D","TFAP2E","TFAP4",
                                            "BAP1","SF3B1","EIF1AX","GAPDH","ACTB","HSPA4","HSPA5")),]
rownames(data1) = data1[,1]
data1 = data1[,3:dim(data1)[2]]
data1 = log2(t(data1+1))

boxplot(data1)


stripchart(gene ~ cell, vertical = TRUE, data = H2AFV, jitter = 0.3, ylab = expression('Single Cell RNA-Seq H2AFV'),
    method = "jitter", pch = 20, col = alpha(colour='red',alpha=.5),cex = 2)

test = list(TFAP2A=data1[,1],TFAP2B=data1[,2])
test = list(data1)
names(test) = rownames(data1)

beeswarm(test)
stripchart(test,vertical = TRUE,method = "jitter", pch = 20)
boxplot(test, add = TRUE)


