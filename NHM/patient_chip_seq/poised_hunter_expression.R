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

#######
zebra <- read.table("ZEBRA_FISH_TO_HOMOSAPIENS_mart_export.txt",sep= "\t",header=TRUE)
zebra<-as.character(zebra[,3])
zebra<-zebra[zebra!=""]

poised <- read.table("~/CSI/vivek/NHM_bivalent_onMeth_pathtients/poised_kmeans_zmet_5k_3clusters.bed",
                     sep="\t",
                     header=FALSE,stringsAsFactors=FALSE)

poised_in_zebra <- poised[,4][poised[,4] %in% zebra]

sig_vsd_zebra = vsd[rownames(vsd) %in% zebra,]
sig_vsd_zebra = sig_vsd_zebra[apply(sig_vsd_zebra,1,sd)!=0,]

sig_vsd_poised_in_zebra = vsd[rownames(vsd) %in% poised_in_zebra,]
sig_vsd_poised_in_zebra = sig_vsd_poised_in_zebra[apply(sig_vsd_poised_in_zebra,1,sd)!=0,]


pdf("NHM_expression_ZEBRAFISH_genes.pdf",width = 3)
heatmap.2(sig_vsd_zebra,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab=paste0("77 ZEBRA FISH GENES"),key.title="Gene expression",cexCol=.65,cexRow=.3,Colv=FALSE,dendrogram='row')
dev.off()
  
pdf("NHM_expression_zebrafish_overlap_poised_genes.pdf",width = 3)
heatmap.2(sig_vsd_poised_in_zebra,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="7 ZEBRA FISH OVERLAP WITH POISED GENES",key.title="Gene expression",cexCol=.65,cexRow=1,Colv=FALSE,dendrogram='row')
dev.off()

#######################################################################################################################
# Look at crest signature in patients
crest <- read.table("~/CSI/vivek/new_rnaseq/crest/MedLowSim_SD3.txt",stringsAsFactors=F)
crest<-crest[,1]
poised <- read.table("poised_kmeans_zmet_5k_3clusters.bed",sep="\t",header=FALSE,stringsAsFactors=FALSE)
poised <- poised[,4]


mat_vsd_crest = mat[rownames(mat) %in% crest,]
mat_vsd_crest = mat_vsd_crest[apply(mat_vsd_crest,1,sd)!=0,]

centered_mat_vsd_crest = centered_mat[rownames(centered_mat) %in% crest,]
centered_mat_vsd_crest = centered_mat_vsd_crest[apply(centered_mat_vsd_crest,1,sd)!=0,]

pdf("patient_expression_crest_genes.pdf",width = 3)
heatmap.2(mat_vsd_crest,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab=paste0("Crest GENES"),key.title="Gene expression",cexCol=.65,cexRow=.1)
dev.off()
  
pdf("patient_expression_crest_genes_centered.pdf",width = 3)
heatmap.2(centered_mat_vsd_crest,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Crest GENES",key.title="Gene expression",cexCol=.65,cexRow=.1)
dev.off()


#######################################################################################################################
# Look at fuzzy signature in patients
c1<-read.table("~/CSI/vivek/new_rnaseq/deseq2/mfuzz_heatmap/ct_1_rnaseq.txt")
c1<-c1[,1]
c2<-read.table("~/CSI/vivek/new_rnaseq/deseq2/mfuzz_heatmap/ct_2_rnaseq.txt")
c2<-c2[,1]
c3<-read.table("~/CSI/vivek/new_rnaseq/deseq2/mfuzz_heatmap/ct_3_rnaseq.txt")
c3<-c3[,1]
c4<-read.table("~/CSI/vivek/new_rnaseq/deseq2/mfuzz_heatmap/ct_4_rnaseq.txt")
c4<-c4[,1]
c5<-read.table("~/CSI/vivek/new_rnaseq/deseq2/mfuzz_heatmap/ct_5_rnaseq.txt")
c5<-c5[,1]
c6<-read.table("~/CSI/vivek/new_rnaseq/deseq2/mfuzz_heatmap/ct_6_rnaseq.txt")
c6<-c6[,1]
c7<-read.table("~/CSI/vivek/new_rnaseq/deseq2/mfuzz_heatmap/ct_7_rnaseq.txt")
c7<-c7[,1]
c8<-read.table("~/CSI/vivek/new_rnaseq/deseq2/mfuzz_heatmap/ct_8_rnaseq.txt")
c8<-c8[,1]
c9<-read.table("~/CSI/vivek/new_rnaseq/deseq2/mfuzz_heatmap/ct_9_rnaseq.txt")
c9<-c9[,1]

#c1
mat_c1 = mat[rownames(mat) %in% c1,]
mat_c1 = mat_c1[apply(mat_c1,1,sd)!=0,]
centered_mat_c1 = centered_mat[rownames(centered_mat) %in% c1,]
centered_mat_c1 = centered_mat_c1[apply(centered_mat_c1,1,sd)!=0,]

#c2
mat_c2 = mat[rownames(mat) %in% c2,]
mat_c2 = mat_c2[apply(mat_c2,1,sd)!=0,]
centered_mat_c2 = centered_mat[rownames(centered_mat) %in% c2,]
centered_mat_c2 = centered_mat_c2[apply(centered_mat_c2,1,sd)!=0,]

#c3
mat_c3 = mat[rownames(mat) %in% c3,]
mat_c3 = mat_c3[apply(mat_c3,1,sd)!=0,]
centered_mat_c3 = centered_mat[rownames(centered_mat) %in% c3,]
centered_mat_c3 = centered_mat_c3[apply(centered_mat_c3,1,sd)!=0,]

#c4
mat_c4 = mat[rownames(mat) %in% c4,]
mat_c4 = mat_c4[apply(mat_c4,1,sd)!=0,]
centered_mat_c4 = centered_mat[rownames(centered_mat) %in% c4,]
centered_mat_c4 = centered_mat_c4[apply(centered_mat_c4,1,sd)!=0,]

#c5
mat_c5 = mat[rownames(mat) %in% c5,]
mat_c5 = mat_c5[apply(mat_c5,1,sd)!=0,]
centered_mat_c5 = centered_mat[rownames(centered_mat) %in% c5,]
centered_mat_c5 = centered_mat_c5[apply(centered_mat_c5,1,sd)!=0,]

#c6
mat_c6 = mat[rownames(mat) %in% c6,]
mat_c6 = mat_c6[apply(mat_c6,1,sd)!=0,]
centered_mat_c6 = centered_mat[rownames(centered_mat) %in% c6,]
centered_mat_c6 = centered_mat_c6[apply(centered_mat_c6,1,sd)!=0,]

#c7
mat_c7 = mat[rownames(mat) %in% c7,]
mat_c7 = mat_c6[apply(mat_c7,1,sd)!=0,]
centered_mat_c7 = centered_mat[rownames(centered_mat) %in% c7,]
centered_mat_c7 = centered_mat_c7[apply(centered_mat_c7,1,sd)!=0,]

#c8
mat_c8 = mat[rownames(mat) %in% c8,]
mat_c8 = mat_c8[apply(mat_c8,1,sd)!=0,]
centered_mat_c8 = centered_mat[rownames(centered_mat) %in% c8,]
centered_mat_c8 = centered_mat_c8[apply(centered_mat_c8,1,sd)!=0,]

#c9
mat_c9 = mat[rownames(mat) %in% c9,]
mat_c9 = mat_c9[apply(mat_c9,1,sd)!=0,]
centered_mat_c9 = centered_mat[rownames(centered_mat) %in% c9,]
centered_mat_c9 = centered_mat_c9[apply(centered_mat_c9,1,sd)!=0,]


#c1
pdf("patient_expression_c1_fuzzy.pdf",width = 3)
heatmap.2(mat_c1,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab=paste0("Cluster 1 genes"),key.title="Gene expression",cexCol=.65,cexRow=.1,ColSideColors=colores)
dev.off()
  
pdf("patient_expression_c1_fuzzy_centered.pdf",width = 3)
heatmap.2(centered_mat_c1,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Cluster 1 genes",key.title="Gene expression",cexCol=.65,cexRow=.1,ColSideColors=colores)
dev.off()

#c2
pdf("patient_expression_c2_fuzzy.pdf",width = 3)
heatmap.2(mat_c2,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab=paste0("Cluster 2 genes"),key.title="Gene expression",cexCol=.65,cexRow=.1,ColSideColors=colores)
dev.off()
  
pdf("patient_expression_c2_fuzzy_centered.pdf",width = 3)
heatmap.2(centered_mat_c2,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Cluster 2 genes",key.title="Gene expression",cexCol=.65,cexRow=.1, ColSideColors=colores)
dev.off()

#c3
pdf("patient_expression_c3_fuzzy.pdf",width = 3)
heatmap.2(mat_c3,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab=paste0("Cluster 3 genes"),key.title="Gene expression",cexCol=.65,cexRow=.1, ColSideColors=colores)
dev.off()
  
pdf("patient_expression_c3_fuzzy_centered.pdf",width = 3)
heatmap.2(centered_mat_c3,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Cluster 3 genes",key.title="Gene expression",cexCol=.65,cexRow=.1, ColSideColors=colores)
dev.off()

#c4
pdf("patient_expression_c4_fuzzy.pdf",width = 3)
heatmap.2(mat_c4,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab=paste0("Cluster 4 genes"),key.title="Gene expression",cexCol=.65,cexRow=.1, ColSideColors=colores)
dev.off()
  
pdf("patient_expression_c4_fuzzy_centered.pdf",width = 3)
heatmap.2(centered_mat_c4,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Cluster 4 genes",key.title="Gene expression",cexCol=.65,cexRow=.1, ColSideColors=colores)
dev.off()

#c5
pdf("patient_expression_c5_fuzzy.pdf",width = 3)
heatmap.2(mat_c5,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab=paste0("Cluster 5 genes"),key.title="Gene expression",cexCol=.65,cexRow=.1, ColSideColors=colores)
dev.off()
  
pdf("patient_expression_c5_fuzzy_centered.pdf",width = 3)
heatmap.2(centered_mat_c5,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Cluster 5 genes",key.title="Gene expression",cexCol=.65,cexRow=.1, ColSideColors=colores)
dev.off()

#c6
pdf("patient_expression_c6_fuzzy.pdf",width = 3)
heatmap.2(mat_c6,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab=paste0("Cluster 6 genes"),key.title="Gene expression",cexCol=.65,cexRow=.1, ColSideColors=colores)
dev.off()
  
pdf("patient_expression_c6_fuzzy_centered.pdf",width = 3)
heatmap.2(centered_mat_c6,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Cluster 6 genes",key.title="Gene expression",cexCol=.65,cexRow=.1, ColSideColors=colores)
dev.off()

#c7
pdf("patient_expression_c7_fuzzy.pdf",width = 3)
heatmap.2(mat_c7,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab=paste0("Cluster 7 genes"),key.title="Gene expression",cexCol=.65,cexRow=.1,ColSideColors=colores)
dev.off()
  
pdf("patient_expression_c7_fuzzy_centered.pdf",width = 3)
heatmap.2(centered_mat_c7,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Cluster 7 genes",key.title="Gene expression",cexCol=.65,cexRow=.1, ColSideColors=colores)
dev.off()

#c8
pdf("patient_expression_c8_fuzzy.pdf",width = 3)
heatmap.2(mat_c8,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab=paste0("Cluster 8 genes"),key.title="Gene expression",cexCol=.65,cexRow=.1,ColSideColors=colores)
dev.off()
  
pdf("patient_expression_c8_fuzzy_centered.pdf",width = 3)
heatmap.2(centered_mat_c8,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Cluster 8 genes",key.title="Gene expression",cexCol=.65,cexRow=.1,ColSideColors=colores)
dev.off()

#c9
pdf("patient_expression_c9_fuzzy.pdf",width = 3)
heatmap.2(mat_c9,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab=paste0("Cluster 9 genes"),key.title="Gene expression",cexCol=.65,cexRow=.1,ColSideColors=colores)
dev.off()
  
pdf("patient_expression_c9_fuzzy_centered.pdf",width = 3)
heatmap.2(centered_mat_c9,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Cluster 9 genes",key.title="Gene expression",cexCol=.65,cexRow=.1,ColSideColors=colores)
dev.off()







png("boxplot_patient_RNA-Seq_mfuzz.png",width= 3.25,
  height= 4,units="in",
  res=1200,pointsize=4)

par(mfrow=c(3,3))

databox<-data.frame(Nevi = as.numeric(mat_c1[,colores=="blue"]),Melanoma = as.numeric(mat_c1[,colores=="red"]))
stripchart(databox,vertical = TRUE,jitter = 0.3, ylab = expression('Log'[2]*' Normalized Tag Count RNA-Seq'),
           method = "jitter", pch = 20, col = alpha(colour='red',alpha=.005),cex = 2,las=2,main = "Cluster 1")#,ylim=c(-1,1))
boxplot(databox, add = TRUE,boxlwd = 2,las=2,outline=FALSE)

databox<-data.frame(Nevi = as.numeric( mat_c2[,colores=="blue"]),Melanoma = as.numeric(mat_c2[,colores=="red"]))
stripchart(databox,vertical = TRUE,jitter = 0.3, ylab = expression('Log'[2]*' Normalized Tag Count RNA-Seq'),
           method = "jitter", pch = 20, col = alpha(colour='red',alpha=.005),cex = 2,las=2,main = "Cluster 2")#,ylim=c(-1,1))
boxplot(databox, add = TRUE,boxlwd = 2,las=2,outline=FALSE)

databox<-data.frame(Nevi = as.numeric(mat_c3[,colores=="blue"]),Melanoma = as.numeric(mat_c3[,colores=="red"]))
stripchart(databox,vertical = TRUE,jitter = 0.3, ylab = expression('Log'[2]*' Normalized Tag Count RNA-Seq'),
           method = "jitter", pch = 20, col = alpha(colour='red',alpha=.005),cex = 2,las=2,main = "Cluster 3")#,ylim=c(-1,1))
boxplot(databox, add = TRUE,boxlwd = 2,las=2,outline=FALSE)

databox<-data.frame(Nevi = as.numeric(mat_c4[,colores=="blue"]),Melanoma = as.numeric(mat_c4[,colores=="red"]))
stripchart(databox,vertical = TRUE,jitter = 0.3, ylab = expression('Log'[2]*' Normalized Tag Count RNA-Seq'),
           method = "jitter", pch = 20, col = alpha(colour='red',alpha=.005),cex = 2,las=2,main = "Cluster 4")#,ylim=c(-1,1))
boxplot(databox, add = TRUE,boxlwd = 2,las=2,outline=FALSE)

databox<-data.frame(Nevi = as.numeric(mat_c5[,colores=="blue"]),Melanoma = as.numeric(mat_c5[,colores=="red"]))
stripchart(databox,vertical = TRUE,jitter = 0.3, ylab = expression('Log'[2]*' Normalized Tag Count RNA-Seq'),
           method = "jitter", pch = 20, col = alpha(colour='red',alpha=.005),cex = 2,las=2,main = "Cluster 5")#,ylim=c(-1,1))
boxplot(databox, add = TRUE,boxlwd = 2,las=2,outline=FALSE)

databox<-data.frame(Nevi = as.numeric(mat_c6[,colores=="blue"]),Melanoma = as.numeric(mat_c6[,colores=="red"]))
stripchart(databox,vertical = TRUE,jitter = 0.3, ylab = expression('Log'[2]*' Normalized Tag Count RNA-Seq'),
           method = "jitter", pch = 20, col = alpha(colour='red',alpha=.005),cex = 2,las=2,main = "Cluster 6")#,ylim=c(-1,1))
boxplot(databox, add = TRUE,boxlwd = 2,las=2,outline=FALSE)

databox<-data.frame(Nevi = as.numeric(mat_c7[,colores=="blue"]),Melanoma = as.numeric(mat_c7[,colores=="red"]))
stripchart(databox,vertical = TRUE,jitter = 0.3, ylab = expression('Log'[2]*' Normalized Tag Count RNA-Seq'),
           method = "jitter", pch = 20, col = alpha(colour='red',alpha=.005),cex = 2,las=2,main = "Cluster 7")#,ylim=c(-1,1))
boxplot(databox, add = TRUE,boxlwd = 2,las=2,outline=FALSE)

databox<-data.frame(Nevi = as.numeric(mat_c8[,colores=="blue"]),Melanoma = as.numeric(mat_c8[,colores=="red"]))
stripchart(databox,vertical = TRUE,jitter = 0.3, ylab = expression('Log'[2]*' Normalized Tag Count RNA-Seq'),
           method = "jitter", pch = 20, col = alpha(colour='red',alpha=.005),cex = 2,las=2,main = "Cluster 8")#,ylim=c(-1,1))
boxplot(databox, add = TRUE,boxlwd = 2,las=2,outline=FALSE)

databox<-data.frame(Nevi = as.numeric(mat_c9[,colores=="blue"]),Melanoma = as.numeric(mat_c9[,colores=="red"]))
stripchart(databox,vertical = TRUE,jitter = 0.3, ylab = expression('Log'[2]*' Normalized Tag Count RNA-Seq'),
           method = "jitter", pch = 20, col = alpha(colour='red',alpha=.005),cex = 2,las=2,main = "Cluster 9")#,ylim=c(-1,1))
boxplot(databox, add = TRUE,boxlwd = 2,las=2,outline=FALSE)
dev.off()





png("boxplot_patient_RNA-Seq_mfuzz_centered.png",width= 3.25,
  height= 4,units="in",
  res=1200,pointsize=4)

par(mfrow=c(3,3))

databox<-data.frame(Nevi = as.numeric(centered_mat_c1[,colores=="blue"]),Melanoma = as.numeric(centered_mat_c1[,colores=="red"]))
stripchart(databox,vertical = TRUE,jitter = 0.3, ylab = expression('Log'[2]*' Normalized Tag Count RNA-Seq'),
           method = "jitter", pch = 20, col = alpha(colour='red',alpha=.005),cex = 2,las=2,main = "Cluster 1",ylim=c(-1,1))
boxplot(databox, add = TRUE,boxlwd = 2,las=2,outline=FALSE)

databox<-data.frame(Nevi = as.numeric(centered_mat_c2[,colores=="blue"]),Melanoma = as.numeric(centered_mat_c2[,colores=="red"]))
stripchart(databox,vertical = TRUE,jitter = 0.3, ylab = expression('Log'[2]*' Normalized Tag Count RNA-Seq'),
           method = "jitter", pch = 20, col = alpha(colour='red',alpha=.005),cex = 2,las=2,main = "Cluster 2",ylim=c(-1,1))
boxplot(databox, add = TRUE,boxlwd = 2,las=2,outline=FALSE)

databox<-data.frame(Nevi = as.numeric(centered_mat_c3[,colores=="blue"]),Melanoma = as.numeric(centered_mat_c3[,colores=="red"]))
stripchart(databox,vertical = TRUE,jitter = 0.3, ylab = expression('Log'[2]*' Normalized Tag Count RNA-Seq'),
           method = "jitter", pch = 20, col = alpha(colour='red',alpha=.005),cex = 2,las=2,main = "Cluster 3",ylim=c(-1,1))
boxplot(databox, add = TRUE,boxlwd = 2,las=2,outline=FALSE)

databox<-data.frame(Nevi = as.numeric(centered_mat_c4[,colores=="blue"]),Melanoma = as.numeric(centered_mat_c4[,colores=="red"]))
stripchart(databox,vertical = TRUE,jitter = 0.3, ylab = expression('Log'[2]*' Normalized Tag Count RNA-Seq'),
           method = "jitter", pch = 20, col = alpha(colour='red',alpha=.005),cex = 2,las=2,main = "Cluster 4",ylim=c(-1,1))
boxplot(databox, add = TRUE,boxlwd = 2,las=2,outline=FALSE)

databox<-data.frame(Nevi = as.numeric(centered_mat_c5[,colores=="blue"]),Melanoma = as.numeric(centered_mat_c5[,colores=="red"]))
stripchart(databox,vertical = TRUE,jitter = 0.3, ylab = expression('Log'[2]*' Normalized Tag Count RNA-Seq'),
           method = "jitter", pch = 20, col = alpha(colour='red',alpha=.005),cex = 2,las=2,main = "Cluster 5",ylim=c(-1,1))
boxplot(databox, add = TRUE,boxlwd = 2,las=2,outline=FALSE)

databox<-data.frame(Nevi = as.numeric(centered_mat_c6[,colores=="blue"]),Melanoma = as.numeric(centered_mat_c6[,colores=="red"]))
stripchart(databox,vertical = TRUE,jitter = 0.3, ylab = expression('Log'[2]*' Normalized Tag Count RNA-Seq'),
           method = "jitter", pch = 20, col = alpha(colour='red',alpha=.005),cex = 2,las=2,main = "Cluster 6",ylim=c(-1,1))
boxplot(databox, add = TRUE,boxlwd = 2,las=2,outline=FALSE)

databox<-data.frame(Nevi = as.numeric(centered_mat_c7[,colores=="blue"]),Melanoma = as.numeric(centered_mat_c7[,colores=="red"]))
stripchart(databox,vertical = TRUE,jitter = 0.3, ylab = expression('Log'[2]*' Normalized Tag Count RNA-Seq'),
           method = "jitter", pch = 20, col = alpha(colour='red',alpha=.005),cex = 2,las=2,main = "Cluster 7",ylim=c(-1,1))
boxplot(databox, add = TRUE,boxlwd = 2,las=2,outline=FALSE)

databox<-data.frame(Nevi = as.numeric(centered_mat_c8[,colores=="blue"]),Melanoma = as.numeric(centered_mat_c8[,colores=="red"]))
stripchart(databox,vertical = TRUE,jitter = 0.3, ylab = expression('Log'[2]*' Normalized Tag Count RNA-Seq'),
           method = "jitter", pch = 20, col = alpha(colour='red',alpha=.005),cex = 2,las=2,main = "Cluster 8",ylim=c(-1,1))
boxplot(databox, add = TRUE,boxlwd = 2,las=2,outline=FALSE)

databox<-data.frame(Nevi = as.numeric(centered_mat_c9[,colores=="blue"]),Melanoma = as.numeric(centered_mat_c9[,colores=="red"]))
stripchart(databox,vertical = TRUE,jitter = 0.3, ylab = expression('Log'[2]*' Normalized Tag Count RNA-Seq'),
           method = "jitter", pch = 20, col = alpha(colour='red',alpha=.005),cex = 2,las=2,main = "Cluster 9",ylim=c(-1,1))
boxplot(databox, add = TRUE,boxlwd = 2,las=2,outline=FALSE)
dev.off()
