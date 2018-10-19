
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
annot.ext="/logical_dev/resources/gencode.v27.annotation.gtf",
isGTFAnnotationFile=TRUE,
minMQS=4,
strandSpecific=2,
isPairedEnd=TRUE,
autosort=TRUE,
nthreads=15,
GTF.attrType="gene_name"
)

dat=data[[1]]
colnames(dat)=c("b2","n2",
                "b5","n5",
                "b7","n7",
                "b81","n81",
                "b82","n82",
                "b9","n9")

saveRDS(dat,"bapoma_counts_v27.rds")
