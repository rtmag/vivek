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

