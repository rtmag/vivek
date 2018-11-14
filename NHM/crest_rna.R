library(Rsubread)
options(scipen=999)

data<-featureCounts(c(
"/root/vivek/vivek_new_rna_seq/bam/NHM_1_Aligned.sortedByCoord.out.bam",
"/root/vivek/vivek_new_rna_seq/bam/NHM_2_Aligned.sortedByCoord.out.bam",
"/root/vivek/vivek_new_rna_seq/bam/NHM_3_Aligned.sortedByCoord.out.bam",
"/root/vivek/vivek_new_rna_seq/bam/BRAF_1_Aligned.sortedByCoord.out.bam",
"/root/vivek/vivek_new_rna_seq/bam/BRAF_2_Aligned.sortedByCoord.out.bam",
"/root/vivek/vivek_new_rna_seq/bam/BRAF_3_Aligned.sortedByCoord.out.bam",
"/root/vivek/vivek_new_rna_seq/bam/CDKN2A_1_Aligned.sortedByCoord.out.bam",
"/root/vivek/vivek_new_rna_seq/bam/CDKN2A_2_Aligned.sortedByCoord.out.bam",
"/root/vivek/vivek_new_rna_seq/bam/CDKN2A_3_Aligned.sortedByCoord.out.bam",
"/root/vivek/vivek_new_rna_seq/bam/BRAF_+_CDKN2A_1_Aligned.sortedByCoord.out.bam",
"/root/vivek/vivek_new_rna_seq/bam/BRAF_+_CDKN2A_2_Aligned.sortedByCoord.out.bam",
"/root/vivek/vivek_new_rna_seq/bam/BRAF_+_CDKN2A_3_Aligned.sortedByCoord.out.bam",
"crest_Aligned.sortedByCoord.out.bam"),
annot.ext="/root/resources/gencode.v27.annotation.gtf",
isGTFAnnotationFile=TRUE,
minMQS=4,
strandSpecific=0,
isPairedEnd=FALSE,
autosort=TRUE,
nthreads=55,
GTF.attrType="gene_name"
)

saveRDS(data,"NHM_crest_featureCounts.rds")


dat=data[[1]]
colnames(dat)=c("NHM_1","NHM_2","NHM_3","BRAF_1","BRAF_2","BRAF_3",
                 "CDKN2A_1","CDKN2A_2","CDKN2A_3","B_C_1","B_C_2","B_C_3",
               "CREST")

saveRDS(dat,"NHM_crest_counts.rds")

############################################################################################################

countData=readRDS("NHM_counts.rds")
options(scipen=999)
library(DESeq2)
library(gplots)
library(factoextra)
library(RColorBrewer)
