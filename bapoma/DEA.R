
library(Rsubread)
options(scipen=999)


data<-featureCounts(c(
"22121b_Aligned.sortedByCoord.out.bam",
"22121n1_Aligned.sortedByCoord.out.bam",
"5009b2_Aligned.sortedByCoord.out.bam",
"5009n2_Aligned.sortedByCoord.out.bam",
"75350b_Aligned.sortedByCoord.out.bam",
"75350n_Aligned.sortedByCoord.out.bam",
"81374b1_Aligned.sortedByCoord.out.bam",
"81374n1_Aligned.sortedByCoord.out.bam",
"82483b1_Aligned.sortedByCoord.out.bam",
"82483n2_Aligned.sortedByCoord.out.bam",
"93178b1_Aligned.sortedByCoord.out.bam",
"93178n1_Aligned.sortedByCoord.out.bam"),
annot.ext="/logical_dev/resources/gencode.v28.chr_patch_hapl_scaff.annotation.gtf",
isGTFAnnotationFile=TRUE,
minMQS=4,
strandSpecific=0,
isPairedEnd=TRUE,
autosort=TRUE,
nthreads=40,
GTF.attrType="gene_name"
)




library(Rsubread)

data<-featureCounts(c(
"22121b_Aligned.sortedByCoord.out.bam"),
annot.ext="/logical_dev/resources/gencode.v28.chr_patch_hapl_scaff.annotation.gtf",
isGTFAnnotationFile=TRUE,
minMQS=4,
strandSpecific=1,
isPairedEnd=TRUE,
autosort=TRUE,
nthreads=15,
GTF.attrType="gene_name"
)

data<-featureCounts(c(
"22121b_Aligned.sortedByCoord.out.bam"),
annot.ext="/logical_dev/resources/gencode.v28.chr_patch_hapl_scaff.annotation.gtf",
isGTFAnnotationFile=TRUE,
minMQS=4,
strandSpecific=2,
isPairedEnd=TRUE,
autosort=TRUE,
nthreads=15,
GTF.attrType="gene_name"
)

data<-featureCounts(c(
"22121b_Aligned.sortedByCoord.out.bam"),
annot.ext="/logical_dev/resources/gencode.v28.chr_patch_hapl_scaff.annotation.gtf",
isGTFAnnotationFile=TRUE,
minMQS=4,
strandSpecific=0,
isPairedEnd=TRUE,
autosort=TRUE,
nthreads=15,
GTF.attrType="gene_name"
)
