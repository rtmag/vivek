# scp  # KESO
# -r -P  # KAKARIKO
# 60035 #KANARIO
# #KINOA
#172.18.149.78 #KREMBLIM

library(Rsubread)
options(scipen=999)

sink("RNA_Seq_featureCounts_batch3.log")

data<-featureCounts(c(
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/B1_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R01_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R02_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R03_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R04_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R05_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R06_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R07_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R08_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R09_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R11_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R12_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R13_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R14_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R15_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R16_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R18_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R21_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R22_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R26_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R27_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R28_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R29_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R30_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R31_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R32_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R33_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R34_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R35_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R36_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R37_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R38_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R39_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/RNA_seq/bam/R40_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/bam3/R41_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/bam3/R42_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/bam3/R43_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/bam3/R44_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/bam3/R45_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/bam3/R46_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/bam3/R47_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/bam3/R48_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/bam3/R49_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/bam3/R50_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/bam3/R51_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/bam3/R52_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/bam3/R53_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/bam3/R54_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/bam3/R55_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/bam3/R56_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/bam3/R59_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/bam3/R60_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/bam3/R61_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/bam3/R62_Aligned.sortedByCoord.out.bam",
"/home/rtm/vivek/navi/rnaseq/bam3/R63_Aligned.sortedByCoord.out.bam"),
annot.ext="/home/references/gencode.v27.annotation.gtf",
isGTFAnnotationFile=TRUE,
minMQS=4,
strandSpecific=0,
isPairedEnd=TRUE,
autosort=TRUE,
nthreads=24,
GTF.attrType="gene_name"
)
sink()

saveRDS(data,"RNA_Seq_featureCounts_batch3_output.rds")

countData=data[[1]]
colnames(countData) = gsub("X.home.rtm.vivek.navi.rnaseq.RNA_seq.bam.","",colnames(countData))
colnames(countData) = gsub("X.home.rtm.vivek.navi.rnaseq.bam3.","",colnames(countData))
colnames(countData) = gsub("_Aligned.sortedByCoord.out.bam","",colnames(countData))
saveRDS(countData,"NEVI_counts.rds")
####################################################################################################
####################################################################################################

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
 Patient= c(0,1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10,11,11,12,12,13,13,14,14,15,15,16,16,17,17,18,18,0,0,0,0,0,0,0,0,0)
design$Patient = Patient
design$Patient =  as.factor(design$Patient)
design = design[match(colnames(countData),design$RNA_ID),]
# remove unmatched patients
countData = countData [,design$Patient!="0"]
design = design[design$Patient!="0",]
################################################################################################
dLRT <- DESeqDataSetFromMatrix(countData = countData, colData = design, design = ~ Batch + Patient + Type )
dLRT <- DESeq(dLRT, test="LRT", reduced=~1)
dLRT_vsd <- varianceStabilizingTransformation(dLRT)
dLRT_res = results(dLRT)
vsd = assay(dLRT_vsd)

pdf("Diagnostic_pca_type_samples.pdf")
plotPCA(dLRT_vsd,ntop=50000,intgroup=c("Type"))
dev.off()

pdf("Diagnostic_pca_batch_samples.pdf")
plotPCA(dLRT_vsd,ntop=50000,intgroup=c("Batch"))
dev.off()

#######
# remove batch effect
mat <- limma::removeBatchEffect(vsd, dLRT_vsd$Batch)

track = as.numeric(design$Type=="Melanoma")+1
colores = c("blue","red")
colores = colores[track]

myPCA <- prcomp(t(mat), scale. = F, center = T)
sx=summary(myPCA)

pdf("Diagnostic_pca_Type_samples_BATCHcorrected.pdf")
plot(myPCA$x[,1:2],col=colores,pch = 19,cex=2,
     xlab=paste("PCA1",round(sx$importance[2,1]*100,digits=1),"%"),ylab=paste("PCA2:",round(sx$importance[2,2]*100,digits=1),"%") )
legend("topleft", c("Nevus","Melanoma"),fill=c("blue","red"), bty="n") 
dev.off()

pdf("Diagnostic_pca_Type_samples_BATCHcorrected_withNames.pdf")
plot(myPCA$x[,1:2],col=colores,pch = 19,cex=2,
     xlab=paste("PCA1",round(sx$importance[2,1]*100,digits=1),"%"),ylab=paste("PCA2:",round(sx$importance[2,2]*100,digits=1),"%") )
legend("topleft", c("Nevus","Melanoma"),fill=c("blue","red"), bty="n") 
text(myPCA$x[,1:2]+.5,label=as.character(design$RNA_ID),cex=1)
dev.off()

###################################################################################################
#add patient interaction

options(scipen=999)
library(DESeq2)
library(gplots)
library(factoextra)
library(RColorBrewer)

dLRT <- DESeqDataSetFromMatrix(countData = countData, colData = design, design = ~ Batch + Type )
dds_batch <- DESeq(dLRT)
dds_res_batch <- results(dds_batch,contrast=c("Type","Melanoma","Nevus"))


dLRT <- DESeqDataSetFromMatrix(countData = countData, colData = design, design = ~ Patient + Type )
dds_patient <- DESeq(dLRT)
dds_res_patient <- results(dds_patient,contrast=c("Type","Melanoma","Nevus"))

dLRT_vsd <- varianceStabilizingTransformation(dds_patient)
vsd = assay(dLRT_vsd)

dds_res = dds_res_batch
dds_res = dds_res_patient
# Volcano
  title= "Melanoma_VS_Nevus_volcano.pdf"
  pdf(title)
  plot(dds_res$log2FoldChange,-log10(dds_res$padj),xlab=expression('Log'[2]*paste(' Fold Change ')),
              ylab=expression('-Log'[10]*' Q-values'),col=alpha("grey",.5),pch=20 )
  abline(v=-1,lty = 2,col="grey")
  abline(v=1,lty = 2,col="grey")
  abline(h=-log10(0.05),lty = 2,col="grey")
  points(dds_res$log2FoldChange[abs(dds_res$log2FoldChange)>1 & dds_res$padj<0.05],
       -log10(dds_res$padj)[abs(dds_res$log2FoldChange)>1 & dds_res$padj<0.05],
      col="red",pch=20)
  legend("topright", paste("Melanoma",":",length(which(dds_res$log2FoldChange>1 & dds_res$padj<0.05))), bty="n") 
  legend("topleft", paste("Nevus",":",length(which(dds_res$log2FoldChange<(-1) & dds_res$padj<0.05))), bty="n") 
  dev.off()
  # Heatmap

track=as.character(design$Type)
track[track=="Melanoma"]=1
track[track=="Nevus"]=2
track=as.numeric(track)
colores=c("#ffb3ba","#baffc9","#bae1ff")
clab=as.character(colores[track])
  title="Melanoma_VS_Nevus_heatmap_notCentered.png"
png(title,width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
  sig_vsd = vsd[which(abs(dds_res$log2FoldChange)>1 & dds_res$padj<0.05), ]
colnames(sig_vsd) = paste(design[,1],design[,2])
  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(9))
heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="", ylab=paste(dim(sig_vsd)[1],"Genes"),key.title="Gene expression",cexCol=.8,ColSideColors=clab)
legend("topright",legend=c("Melanoma","Nevus"),fill=c("#ffb3ba","#baffc9"), border=T, bty="n" )
dev.off()

 title="Melanoma_VS_Nevus_heatmap_Centered.png"
 patient_number = max(as.numeric(as.character(design$Patient)))
png(title,width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
  sig_vsd = vsd[which(abs(dds_res$log2FoldChange)>1 & dds_res$padj<0.05), ]
colnames(sig_vsd) = paste(design[,1],design[,2])

centered_vsd = sig_vsd
for( i in 1:patient_number){
   ix = which(design$Patient==i)
   centered_vsd[,ix[1]] = sig_vsd[,ix[1]] - rowMeans(sig_vsd[,ix])
   centered_vsd[,ix[2]] = sig_vsd[,ix[2]] - rowMeans(sig_vsd[,ix])
 }

  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(9))
heatmap.2(centered_vsd,col=colors,scale="none", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="", ylab=paste(dim(sig_vsd)[1],"Genes"),key.title="Gene expression",cexCol=.8,ColSideColors=clab)
legend("topright",legend=c("Melanoma","Nevus"),fill=c("#ffb3ba","#baffc9"), border=T, bty="n" )
dev.off()

write.csv(dds_res_patient,"DEG_Melanoma_VS_Nevus_MatchedPatientAnalysis.csv")
