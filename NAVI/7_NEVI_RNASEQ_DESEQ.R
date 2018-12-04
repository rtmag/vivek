
library(Rsubread)
options(scipen=999)

data<-featureCounts(c(
"R26_Aligned.sortedByCoord.out.bam",
"R27_Aligned.sortedByCoord.out.bam",
"R28_Aligned.sortedByCoord.out.bam",
"R29_Aligned.sortedByCoord.out.bam",
"R30_Aligned.sortedByCoord.out.bam",
"R31_Aligned.sortedByCoord.out.bam",
"R32_Aligned.sortedByCoord.out.bam",
"R33_Aligned.sortedByCoord.out.bam",
"R34_Aligned.sortedByCoord.out.bam",
"R35_Aligned.sortedByCoord.out.bam",
"R36_Aligned.sortedByCoord.out.bam",
"R37_Aligned.sortedByCoord.out.bam",
"R38_Aligned.sortedByCoord.out.bam",
"R39_Aligned.sortedByCoord.out.bam",
"R40_Aligned.sortedByCoord.out.bam",
"S10_Aligned.sortedByCoord.out.bam",
"S11_Aligned.sortedByCoord.out.bam",
"S12_Aligned.sortedByCoord.out.bam",
"S13_Aligned.sortedByCoord.out.bam",
"S14_Aligned.sortedByCoord.out.bam",
"S15_Aligned.sortedByCoord.out.bam",
"S16_Aligned.sortedByCoord.out.bam",
"S17_Aligned.sortedByCoord.out.bam",
"S18_Aligned.sortedByCoord.out.bam",
"S1_Aligned.sortedByCoord.out.bam",
"S2_Aligned.sortedByCoord.out.bam",
"S38_Aligned.sortedByCoord.out.bam",
"S3_Aligned.sortedByCoord.out.bam",
"S4_Aligned.sortedByCoord.out.bam",
"S5_Aligned.sortedByCoord.out.bam",
"S6_Aligned.sortedByCoord.out.bam",
"S7_Aligned.sortedByCoord.out.bam",
"S8_Aligned.sortedByCoord.out.bam",
"S9_Aligned.sortedByCoord.out.bam"),
annot.ext="/root/resources/gencode.v27.annotation.gtf",
isGTFAnnotationFile=TRUE,
minMQS=4,
strandSpecific=0,
isPairedEnd=TRUE,
autosort=TRUE,
nthreads=40,
GTF.attrType="gene_name"
)

dat=data[[1]]
colnames(dat)=c("R26","R27","R28","R29","R30","R31","R32","R33","R34","R35","R36","R37","R38","R39","R40",
                "R1","R2","R18","R9","R15","R16","R6","R8","R21","B1","R22","R3","R12","R11","R4","R5","R7")

saveRDS(dat,"Feature_counts.rds")


