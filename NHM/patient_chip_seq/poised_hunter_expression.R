options(scipen=999)
library(gplots)
library(factoextra)
library(RColorBrewer)
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(20))

vsd <- readRDS("~/CSI/vivek/new_rnaseq/deseq2/NHM_vsd.rds")
colnames(vsd) = c("VE","VE","VE","VE+KO","VE+KO","VE+KO","KO","KO","KO","NHM","NHM","NHM")
vsd = vsd[,c(10:12,1:3,7:9,4:6)]

hunter <- read.csv("PRC2cluster-CancerCell.csv")
hunter <- as.character(hunter[,1])

poised <- read.table("poised_kmeans_zmet_5k_3clusters.bed",sep="\t",header=FALSE,stringsAsFactors=FALSE)

poised_in_hunter <- poised[,4][poised[,4] %in% hunter]

sig_vsd_hunter = vsd[rownames(vsd) %in% hunter,]
sig_vsd_hunter = sig_vsd_hunter[apply(sig_vsd_hunter,1,sd)!=0,]

sig_vsd_poised = vsd[rownames(vsd) %in% poised[,4],]
sig_vsd_poised = sig_vsd_poised[apply(sig_vsd_poised,1,sd)!=0,]

sig_vsd_poised_in_hunter = vsd[rownames(vsd) %in% poised_in_hunter,]
sig_vsd_poised_in_hunter = sig_vsd_poised_in_hunter[apply(sig_vsd_poised_in_hunter,1,sd)!=0,]

pdf("NHM_expression_PRC2_genes.pdf",width = 2.5)
heatmap.2(sig_vsd_hunter,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="PRC2 Hunter Genes",key.title="Gene expression",cexCol=.65,cexRow=.2,Colv=FALSE,dendrogram='row')
dev.off()
  
pdf("NHM_expression_poise_genes.pdf",width = 2.5)
heatmap.2(sig_vsd_poised,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Poised Genes",key.title="Gene expression",cexCol=.65,cexRow=.2,Colv=FALSE,dendrogram='row')
dev.off()

pdf("NHM_expression_poise_genes_in_hunterPRC2.pdf",width = 2.5)
heatmap.2(sig_vsd_poised_in_hunter,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Poised in Hunter's PRC2 genes",key.title="Gene expression",cexCol=.65,cexRow=.2,Colv=FALSE,dendrogram='row')
dev.off()

################
options(scipen=999)
library(DESeq2)
library(gplots)
library(factoextra)
library(RColorBrewer)

countData<-readRDS("~/CSI/vivek/nevi/RNA_22_april_2019/NEVI_counts.rds")
anno=read.csv("~/CSI/vivek/nevi/RNA_22_april_2019/sample_list_RNA_NEVI_ANNO.csv",header=FALSE,stringsAsFactor=FALSE)
anno = rbind(anno, c("B1","B1","B1"))
anno[,2] = gsub("NA-","",anno[,2])

design<-data.frame(RNA_ID=colnames(countData),
                   VM_ID=rep(0,dim(countData)[2]),
                   Type=rep(0,dim(countData)[2]),
                   Batch=rep(0,dim(countData)[2]))

design$VM_ID = anno[match(design[,1],anno[,2]),1]
design$Type = anno[match(design[,1],anno[,2]),3]
design$Type[is.na(design$Type)] = "Normal"
design$Type[26:34] = "Unclassified"
design$Batch[1:25] = 1 ; design$Batch[20:34] = 2 ; design$Batch[35:55] = 3
################################################################################################
# Adding missing info

design[design$RNA_ID=="R32",3] = "Nevus"
design[design$RNA_ID=="R33",3] = "Melanoma"

design[design$RNA_ID=="R34",3] = "Nevus"
design[design$RNA_ID=="R35",3] = "Melanoma"


design[design$RNA_ID=="R36",3] = "Nevus"
design[design$RNA_ID=="R37",3] = "Melanoma"
design[design$RNA_ID=="R38",3] = "Normal"

design[design$RNA_ID=="R39",3] = "Nevus"
design[design$RNA_ID=="R40",3] = "Melanoma"

# Removing B1 sample
countData = countData [,2:dim(countData)[2]] 
design = design[2:dim(design)[1],]

# Removing Normal
countData = countData [,design$Type!="Normal"]
design = design[design$Type!="Normal",]

# Factoring
design$Type = as.factor(design$Type)
design$Batch = as.factor(design$Batch)

# Sort by VM id
library(gtools)
design = design[mixedorder(design$VM_ID),]
#paired grouping
 Patient= c(0,1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10,11,11,12,12,13,13,14,14,15,15,16,16,17,17,18,18,0,19,19,20,20,21,21,22,22)
design$Patient = Patient
design$Patient =  as.factor(design$Patient)
design = design[match(colnames(countData),design$RNA_ID),]
# remove unmatched patients
countData = countData [,design$Patient!="0"]
design = design[design$Patient!="0",]
################################################################################################
dLRT <- DESeqDataSetFromMatrix(countData = countData, colData = design, design = ~ Patient + Type )
dLRT <- DESeq(dLRT, test="LRT", reduced=~1)
dLRT_vsd <- varianceStabilizingTransformation(dLRT)
dLRT_res = results(dLRT)
vsd = assay(dLRT_vsd)

mat <- limma::removeBatchEffect(vsd, dLRT_vsd$Batch)


mat_vsd_hunter = mat[rownames(mat) %in% hunter,]
mat_vsd_hunter = mat_vsd_hunter[apply(mat_vsd_hunter,1,sd)!=0,]

mat_vsd_poised = mat[rownames(mat) %in% poised[,4],]
mat_vsd_poised = mat_vsd_poised[apply(mat_vsd_poised,1,sd)!=0,]

mat_vsd_poised_in_hunter = mat[rownames(mat) %in% poised_in_hunter,]
mat_vsd_poised_in_hunter = mat_vsd_poised_in_hunter[apply(mat_vsd_poised_in_hunter,1,sd)!=0,]

track = as.numeric(design$Type=="Melanoma")+1
colores = c("blue","red")
colores = colores[track]


pdf("NEVI_expression_PRC2_genes.pdf")
heatmap.2(mat_vsd_hunter,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="PRC2 Hunter Genes",key.title="Gene expression",cexCol=.65,cexRow=.2,ColSideColors=colores)
  legend("topright",legend=c("Melanoma","Nevus"),fill=c("#ffb3ba","#baffc9"), border=T, bty="n" )

dev.off()
  
pdf("NEVI_expression_poise_genes.pdf")
heatmap.2(mat_vsd_poised,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Poised Genes",key.title="Gene expression",cexCol=.65,cexRow=.2,ColSideColors=colores)
dev.off()

pdf("NEVI_expression_poise_genes_in_hunterPRC2.pdf")
heatmap.2(mat_vsd_poised_in_hunter,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Poised in Hunter's PRC2 genes",key.title="Gene expression",cexCol=.65,cexRow=.2,ColSideColors=colores)
dev.off()

#################
 patient_number = max(as.numeric(as.character(design$Patient)))
centered_mat = mat
for( i in 1:patient_number){
   ix = which(design$Patient==i)
   centered_mat[,ix[1]] = mat[,ix[1]] - rowMeans(mat[,ix])
   centered_mat[,ix[2]] = mat[,ix[2]] - rowMeans(mat[,ix])
 }
 
mat_vsd_hunter_centered = centered_mat[rownames(centered_mat) %in% hunter,]
mat_vsd_hunter_centered = mat_vsd_hunter_centered[apply(mat_vsd_hunter_centered,1,sd)!=0,]

mat_vsd_poised_centered = centered_mat[rownames(centered_mat) %in% poised[,4],]
mat_vsd_poised_centered = mat_vsd_poised_centered[apply(mat_vsd_poised_centered,1,sd)!=0,]

mat_vsd_poised_in_hunter_centered = centered_mat[rownames(centered_mat) %in% poised_in_hunter,]
mat_vsd_poised_in_hunter_centered = mat_vsd_poised_in_hunter_centered[apply(mat_vsd_poised_in_hunter_centered,1,sd)!=0,]

pdf("NEVI_centered_expression_PRC2_genes.pdf")
heatmap.2(mat_vsd_hunter_centered,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="PRC2 Hunter Genes",key.title="Gene expression",cexCol=.65,cexRow=.2,ColSideColors=colores)
dev.off()
  
pdf("NEVI_centered_expression_poise_genes.pdf")
heatmap.2(mat_vsd_poised_centered,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Poised Genes",key.title="Gene expression",cexCol=.65,cexRow=.2,ColSideColors=colores)
dev.off()

pdf("NEVI_centered_expression_poise_genes_in_hunterPRC2.pdf")
heatmap.2(mat_vsd_poised_in_hunter_centered,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),
srtCol=90,
  xlab="", ylab="Poised in Hunter's PRC2 genes",key.title="Gene expression",cexCol=.65,cexRow=.2,ColSideColors=colores)
dev.off()
