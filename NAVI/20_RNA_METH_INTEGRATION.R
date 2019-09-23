
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


centered_vsd = sig_vsd
for( i in 1:patient_number){
   ix = which(design$Patient==i)
   centered_vsd[,ix[1]] = sig_vsd[,ix[1]] - rowMeans(sig_vsd[,ix])
   centered_vsd[,ix[2]] = sig_vsd[,ix[2]] - rowMeans(sig_vsd[,ix])
 }
