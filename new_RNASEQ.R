
library(Rsubread)
options(scipen=999)

data<-featureCounts(c(
"/root/vivek/RNAseq_Vivek_UCSF/bam/lu_1_Aligned.sortedByCoord.out.bam",
"/root/vivek/RNAseq_Vivek_UCSF/bam/lu_2_Aligned.sortedByCoord.out.bam",
"/root/vivek/RNAseq_Vivek_UCSF/bam/lu_3_Aligned.sortedByCoord.out.bam",
"/root/vivek/RNAseq_Vivek_UCSF/bam/wm_1_Aligned.sortedByCoord.out.bam",
"/root/vivek/RNAseq_Vivek_UCSF/bam/wm_2_Aligned.sortedByCoord.out.bam",
"/root/vivek/RNAseq_Vivek_UCSF/bam/wm_3_Aligned.sortedByCoord.out.bam"
),
annot.ext="/root/resources/gencode.v27.annotation.gtf",
isGTFAnnotationFile=TRUE,
minMQS=4,
strandSpecific=0,
isPairedEnd=FALSE,
#PE_orientation="rf",
autosort=TRUE,
nthreads=40,
GTF.attrType="gene_name"
)


dat=data[[1]]
colnames(dat)=c("lu_1","lu_2","lu_3","wm_1","wm_2","wm_3")

saveRDS(dat,"lu_wm_counts.rds")
