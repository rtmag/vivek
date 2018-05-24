
library(Rsubread)
options(scipen=999)


data<-featureCounts(c(
"BRAF_1_Aligned.sortedByCoord.out.bam",
"BRAF_2_Aligned.sortedByCoord.out.bam",
"BRAF_3_Aligned.sortedByCoord.out.bam",
"BRAF_+_CDKN2A_1_Aligned.sortedByCoord.out.bam",
"BRAF_+_CDKN2A_2_Aligned.sortedByCoord.out.bam",
"BRAF_+_CDKN2A_3_Aligned.sortedByCoord.out.bam",
"CDKN2A_1_Aligned.sortedByCoord.out.bam",
"CDKN2A_2_Aligned.sortedByCoord.out.bam",
"CDKN2A_3_Aligned.sortedByCoord.out.bam",
"NHM_1_Aligned.sortedByCoord.out.bam",
"NHM_2_Aligned.sortedByCoord.out.bam",
"NHM_3_Aligned.sortedByCoord.out.bam"),
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

22121b_Aligned.sortedByCoord.out.bam
22121n1_Aligned.sortedByCoord.out.bam
5009b2_Aligned.sortedByCoord.out.bam
5009n2_Aligned.sortedByCoord.out.bam
75350b_Aligned.sortedByCoord.out.bam
75350n_Aligned.sortedByCoord.out.bam
81374b1_Aligned.sortedByCoord.out.bam
81374n1_Aligned.sortedByCoord.out.bam
82483b1_Aligned.sortedByCoord.out.bam
82483n2_Aligned.sortedByCoord.out.bam
93178b1_Aligned.sortedByCoord.out.bam
93178n1_Aligned.sortedByCoord.out.bam



