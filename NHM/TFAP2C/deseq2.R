library(Rsubread)
options(scipen=999)

data<-featureCounts(c(
"VMRLP-101_S292_Aligned.sortedByCoord.out.bam",
"VMRLP-102_S293_Aligned.sortedByCoord.out.bam",
"VMRLP-103_S294_Aligned.sortedByCoord.out.bam",
"VMRLP-104_S295_Aligned.sortedByCoord.out.bam",
"VMRLP-105_S296_Aligned.sortedByCoord.out.bam",
"VMRLP-106_S297_Aligned.sortedByCoord.out.bam"),
annot.ext="/root/resources/gencode.v27.annotation.gtf",
isGTFAnnotationFile=TRUE,
minMQS=4,
strandSpecific=0,
isPairedEnd=TRUE,
#PE_orientation="rf",
autosort=TRUE,
nthreads=40,
GTF.attrType="gene_name"
)

dat=data[[1]]
colnames(dat)=c("CTRL_1","CTRL_2","CTRL_3",
                "TFAP2CKO_1","TFAP2CKO_2","TFAP2CKO_3")
                
saveRDS(dat,"TFAP2C_counts.rds")

############################################################################################################

countData=readRDS("NHM_counts.rds")
options(scipen=999)
library(DESeq2)
library(gplots)
library(factoextra)
library(RColorBrewer)

design<-data.frame(group=c("BRAF","BRAF","BRAF",
                "B_C","B_C","B_C",
                "CDKN2A","CDKN2A","CDKN2A",
                "NHM","NHM","NHM") )

dLRT <- DESeqDataSetFromMatrix(countData = countData, colData = design, design = ~ group )
dLRT <- DESeq(dLRT, test="LRT", reduced=~1)
dLRT_vsd <- varianceStabilizingTransformation(dLRT)
dLRT_res = results(dLRT)
vsd = assay(dLRT_vsd)

pdf("Diagnostic_pca_all_samples.pdf")
plotPCA(dLRT_vsd,ntop=50000,intgroup=c("group"))
dev.off()

saveRDS(vsd,"NHM_vsd.rds")

####################################################################
