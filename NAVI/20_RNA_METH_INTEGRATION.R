
options(scipen=999)
library(DESeq2)
library(gplots)
library(factoextra)
library(RColorBrewer)

countData=readRDS("NEVI_counts.rds")
anno=read.csv("sample_list_RNA_NEVI_ANNO.csv",header=FALSE,stringsAsFactor=FALSE)
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
dds_patient <- DESeq(dLRT)

dLRT_vsd <- varianceStabilizingTransformation(dds_patient)
vsd = assay(dLRT_vsd)

dLRT <- DESeq(dLRT, test="LRT",full= ~ Patient + Type , reduced=~ Patient)
dDif_res <- results(dLRT,contrast=c("Type","Melanoma","Nevus"))


nevi_genes<-read.table("/Users/wone/CSI/vivek/nevi/mel_vs_nevi/BRAF_analysis/hi_nevi_associated_genes.txt",sep="\t",stringsAsFactors=F)
nevi_genes <- nevi_genes[,1]
mel_genes<-read.table("/Users/wone/CSI/vivek/nevi/mel_vs_nevi/BRAF_analysis/hi_melanoma_associated_genes.txt",sep="\t",stringsAsFactors=F)
mel_genes <- mel_genes[,1]


sig_vsd1 = vsd[rownames(vsd) %in% mel_genes, ]
sig_vsd2 = vsd[rownames(vsd) %in% nevi_genes, ]
sig_vsd = rbind(sig_vsd1,sig_vsd2)
colnames(sig_vsd) = paste(design[,1],design[,2])
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(9))

track=as.character(design$Type)
track[track=="Melanoma"]=1
track[track=="Nevus"]=2
track=as.numeric(track)
colores=c("#ffb3ba","#baffc9","#bae1ff")
clab=as.character(colores[track])

 patient_number = max(as.numeric(as.character(design$Patient)))

centered_vsd = sig_vsd
for( i in 1:patient_number){
   ix = which(design$Patient==i)
   centered_vsd[,ix[1]] = sig_vsd[,ix[1]] - rowMeans(sig_vsd[,ix])
   centered_vsd[,ix[2]] = sig_vsd[,ix[2]] - rowMeans(sig_vsd[,ix])
 }

centered_vsd = centered_vsd[apply(centered_vsd,1,sd)!=0,]


rlab = rownames(centered_vsd)
rlab[rlab %in% mel_genes] = "red"
rlab[rlab %in% nevi_genes] = "blue"

png("
",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
heatmap.2(centered_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="", ylab=paste(dim(sig_vsd)[1],"Genes"),key.title="Gene expression",cexCol=.8,ColSideColors=clab,RowSideColors=rlab)
legend("topright",legend=c("Melanoma","Nevus","Hi-Meth Mel","Hi-Meth Nevi"),fill=c("#ffb3ba","#baffc9","red","blue"), border=T, bty="n" )
dev.off()

data <- vsd[52856,]

Nevi<-data[design$Type=="Nevus"]
Melanoma<-data[design$Type=="Melanoma"]

pdf("~/CSI/vivek/nevi/26_sep_2019/PRAME_RNASEQ_boxplot.pdf",height=8,width=8)
data <- cbind(Melanoma,Nevi)
stripchart(as.data.frame((data)),vertical = TRUE,#jitter = 0.3, 
          ylab = 'PRAME expression level (Log2 normalized read counts)',
           method = "jitter", pch = 20, col = alpha(colour='red',alpha=.4),cex = 2,las=2)

boxplot(data, add = TRUE,boxlwd = 2,las=2,outline=FALSE)
dev.off()
#######################################################################################################################################
#######################################################################################################################################
#######################################################################################################################################
library(ComplexHeatmap)
options(scipen=999)
library(graphics)
library(gplots)
library(factoextra)
library(RColorBrewer)
library(survival)
library(survminer)
library(gridExtra)
library(grid)
colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(9))

mat<- readRDS("RNASEQbatchCorrected.rds")
mat<-vsd
mat<-mat[apply(mat,1,sd)!=0,]

highmeth_blue <- read.table("/Users/wone/CSI/vivek/11_nov_2019/variationAnalysis_annotation/LOWmethGreen_genesAssociated.txt")
highmeth_blue <- as.character(highmeth_blue[,1])
lowmeth_blue <- read.table("/Users/wone/CSI/vivek/11_nov_2019/variationAnalysis_annotation/HIGHmethGreen_genesAssociated.txt")
lowmeth_blue <- as.character(lowmeth_blue[,1])

sig_lowmeth_blue <- lowmeth_blue[!lowmeth_blue %in% highmeth_blue]
sig_lowmeth_blue <- sig_lowmeth_blue[sig_lowmeth_blue %in% rownames(mat)]
sig_highmeth_blue<- highmeth_blue[!highmeth_blue %in% lowmeth_blue]
sig_highmeth_blue <- sig_highmeth_blue[sig_highmeth_blue %in% rownames(mat)]

rlab <- c(rep("Low Meth Nevi (blue)",length(sig_lowmeth_blue)),rep("High Meth Nevi (blue)",length(sig_highmeth_blue)))

sig_mat <- rbind(mat[ rownames(mat) %in% sig_lowmeth_blue ,] , mat[ rownames(mat) %in% sig_highmeth_blue ,] )

column_ha = HeatmapAnnotation(Type = as.character(design$Type),
                              col = list(Type = c("Nevus" = "blue", "Melanoma" = "red"))
                                      )
                              
row_ha = rowAnnotation(Meth = rlab, show_annotation_name = F,
              col = list(Meth = c("Low Meth Nevi (blue)" = "darkgreen","High Meth Nevi (blue)" = "darkorange" )))

pdf("methVariation_associated_RNASEQ.pdf",width=9)
Heatmap(sig_mat,
show_row_names = FALSE,show_column_names = T,name = "Expression",row_dend_reorder = T, column_dend_reorder = T,
column_title="", column_title_side = "bottom", row_title="Methylation Signature", row_title_side = "right",
top_annotation = column_ha, right_annotation = row_ha, col=colors,
        clustering_distance_columns = "pearson",
        clustering_distance_rows = "pearson",row_split =rlab)
dev.off()

sig_vsd <- sig_mat
centered_vsd = sig_vsd
 patient_number = max(as.numeric(as.character(design$Patient)))
for( i in 1:patient_number){
   ix = which(design$Patient==i)
   centered_vsd[,ix[1]] = sig_vsd[,ix[1]] - rowMeans(sig_vsd[,ix])
   centered_vsd[,ix[2]] = sig_vsd[,ix[2]] - rowMeans(sig_vsd[,ix])
 }

centered_vsd = centered_vsd - rowMeans(centered_vsd)
centered_vsd[centered_vsd >= 1.5] = 1.5
centered_vsd[centered_vsd <= (-1.5)] = -1.5

pdf("methVariation_associated_RNASEQ_PatientCenteredExpression.pdf",width=9)
Heatmap(centered_vsd,
show_row_names = FALSE,show_column_names = TRUE,name = "Expression",row_dend_reorder = T, column_dend_reorder = T,
column_title="", column_title_side = "bottom", row_title="Methylation Signature", row_title_side = "right",
top_annotation = column_ha, right_annotation = row_ha, col=colors,
        clustering_distance_columns = "pearson",
        clustering_distance_rows = "pearson",row_split =rlab)
dev.off()

#######################################################################################################################################
vsd.sd <- apply(vsd,1,sd)

vsd_sig <- vsd[vsd.sd>0,]

column_ha = HeatmapAnnotation(Type = as.character(design$Type),
                              col = list(Type = c("Nevus" = "blue", "Melanoma" = "red"))
                                      )

vsd_sig_scaled <- apply(vsd_sig, 1, scale)

pdf("topvariation_40905genes_scaled_RNASEQ.pdf",width=9)
Heatmap(t(vsd_sig_scaled),
show_row_names = FALSE,show_column_names = T,name = "Expression",row_dend_reorder = T, column_dend_reorder = T,
column_title="", column_title_side = "bottom", row_title="",
top_annotation = column_ha, col=colors,
        clustering_distance_columns = "pearson",
        clustering_distance_rows = "pearson")
dev.off()
###

##

sig_vsd <- vsd[which(abs(dDif_res$log2FoldChange)>=.9 & dDif_res$padj<0.05),]
vsd_sig_scaled <- t(apply(sig_vsd, 1, scale))
colnames(vsd_sig_scaled) <- colnames(vsd)

pdf("MelVsNevi_622genes_scaled_RNASEQ.pdf",width=9)
Heatmap(vsd_sig_scaled,
show_row_names = FALSE,show_column_names = T,name = "Expression",row_dend_reorder = T, column_dend_reorder = T,
column_title="", column_title_side = "bottom", row_title="",
top_annotation = column_ha, col=colors,
        clustering_distance_columns = "pearson",
        clustering_distance_rows = "pearson")
dev.off()
###
centered_vsd = sig_vsd
patient_number = max(as.numeric(as.character(design$Patient)))
for( i in 1:patient_number){
   ix = which(design$Patient==i)
   centered_vsd[,ix[1]] = sig_vsd[,ix[1]] - rowMeans(sig_vsd[,ix])
   centered_vsd[,ix[2]] = sig_vsd[,ix[2]] - rowMeans(sig_vsd[,ix])
 }

centered_vsd <- t(apply(centered_vsd, 1, scale))
colnames(centered_vsd) <- colnames(vsd)

pdf("MelVsNevi_622genes_scaled_RNASEQ_centered.pdf",width=9)
Heatmap(centered_vsd,
show_row_names = FALSE,show_column_names = T,name = "Expression",row_dend_reorder = T, column_dend_reorder = T,
column_title="", column_title_side = "bottom", row_title="",
top_annotation = column_ha, col=colors,
        clustering_distance_columns = "pearson",
        clustering_distance_rows = "pearson")
dev.off()

################################################################################################
################################################################################################
library(clusterProfiler)
library(DOSE)
library(enrichplot)
library("org.Hs.eg.db")
library(ReactomePA)
library(reactome.db) 

set.seed(10)
kmeans.mat<- kmeans(centered_vsd, 2)
table(kmeans.mat$cluster)

hmp<-Heatmap(centered_vsd,
show_row_names = FALSE,show_column_names = T,name = "Expression",row_dend_reorder = T, column_dend_reorder = T,
column_title="", column_title_side = "bottom", row_title="",split=kmeans.mat$cluster,
top_annotation = column_ha, col=colors,
        clustering_distance_columns = "pearson",
        clustering_distance_rows = "pearson")

hmp = draw(hmp)

pdf("MelVsNevi_622genes_scaled_RNASEQ_centered.pdf",width=9)
hmp
dev.off()

ix1 = rownames(centered_vsd)[rownames(centered_vsd) %in% names(kmeans.mat$cluster)[kmeans.mat$cluster==1] ]
ix2 = rownames(centered_vsd)[rownames(centered_vsd) %in% names(kmeans.mat$cluster)[kmeans.mat$cluster==2] ]

write.table(ix1,"High_exp_nevi_genes.txt",sep="\t",,quote=FALSE,col.names=FALSE,row.names=FALSE)
write.table(ix2,"High_exp_melanoma_genes.txt",sep="\t",,quote=FALSE,col.names=FALSE,row.names=FALSE)

gene1.df <- bitr(as.character(ix1), fromType = "SYMBOL",
        toType = c("ENSEMBL", "ENTREZID"),
        OrgDb = org.Hs.eg.db)
       
gene2.df <- bitr(as.character(ix2), fromType = "SYMBOL",
        toType = c("ENSEMBL", "ENTREZID"),
        OrgDb = org.Hs.eg.db)
      
geneEntrez <- list(HighMelanoma = gene1.df$ENTREZID,
    HighNevus = gene2.df$ENTREZID)

##########################################################
x=compareCluster(geneEntrez, fun='enrichGO',
                 OrgDb         = org.Hs.eg.db,
                 ont           = "BP",
                 qvalueCutoff = 0.2,pvalueCutoff = 1)

x@compareClusterResult$Cluster
pdf("dotplot_GOBP_RNASEQ_MELvsNEVI.pdf",height=10,width=10)
dotplot(x, showCategory=15, includeAll=FALSE)
dev.off()

x=compareCluster(geneEntrez, fun="enrichPathway", organism = "human",qvalueCutoff = 0.2,pvalueCutoff = 1)
x@compareClusterResult$Cluster
pdf("dotplot_enrichPathway__RNASEQ_MELvsNEVI.pdf",height=10,width=10)
dotplot(x, showCategory=15, includeAll=FALSE)
dev.off()
       
x=compareCluster(geneEntrez, fun="enrichKEGG", organism = "human", qvalueCutoff = 0.2,pvalueCutoff = 1)
x@compareClusterResult$Cluster
pdf("dotplot_enrichKEGG__RNASEQ_MELvsNEVI.pdf",height=10,width=12)
dotplot(x, showCategory=15, includeAll=FALSE)
dev.off()
##########################################################
