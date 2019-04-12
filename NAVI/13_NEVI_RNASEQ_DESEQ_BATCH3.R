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

dat=data[[1]]

design<-data.frame(cell=c(
"Normal","Nevus","Melanoma", #1-3
"Normal","Nevus","Melanoma", #4-6
"Normal","Nevus","Melanoma", #7-9
         "Nevus","Melanoma", #10-12
         "Nevus","Melanoma", #13-14
         "Nevus","Melanoma", #15-16
                 "Melanoma", #18
         "Nevus","Melanoma", #21-22
"Normal","MIS","Melanoma",   #26-28
"Normal","Nevus","Melanoma", #29-31
         "Nevus","Melanoma", #32-33
         "Nevus","Melanoma", #34-35
         "Nevus","Melanoma", #36-37
"Normal","Nevus","Melanoma" #38-40
                          ),
patient=c(
1,1,1,
2,2,2,
3,3,3,
4,4,
5,5,
6,6,
7,
8,8,
9,9,9,
10,10,10,
11,11,
12,12,
13,13,
14,14,14)
)
