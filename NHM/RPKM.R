library(edgeR)
library(Rsubread)
options(scipen=999)

data<-featureCounts(c(
"/root/ayako/bam/Ctrl_CD41minus1_Aligned.sortedByCoord.out.bam",
"/root/ayako/bam/Ctrl_CD41minus2_Aligned.sortedByCoord.out.bam",
"/root/ayako/bam/Ctrl_CD41minus3_Aligned.sortedByCoord.out.bam",
"/root/ayako/bam/Ctrl_CD41plus1_Aligned.sortedByCoord.out.bam",
"/root/ayako/bam/Ctrl_CD41plus2_Aligned.sortedByCoord.out.bam",
"/root/ayako/bam/Ctrl_CD41plus3_Aligned.sortedByCoord.out.bam",
"/root/ayako/bam/Thpo_CD41minus1_Aligned.sortedByCoord.out.bam",
"/root/ayako/bam/Thpo_CD41minus2_Aligned.sortedByCoord.out.bam",
"/root/ayako/bam/Thpo_CD41minus3_Aligned.sortedByCoord.out.bam",
"/root/ayako/bam/Thpo_CD41plus1_Aligned.sortedByCoord.out.bam",
"/root/ayako/bam/Thpo_CD41plus2_Aligned.sortedByCoord.out.bam",
"/root/ayako/bam/Thpo_CD41plus3_Aligned.sortedByCoord.out.bam",
"/root/ayako/bam/Ctrl_neg_Aligned.sortedByCoord.out.bam"),
annot.ext="/root/ayako/ref/gencode.vM15.annotation.gtf",
isGTFAnnotationFile=TRUE,
minMQS=10,
strandSpecific=1,
isPairedEnd=TRUE,
autosort=TRUE,
nthreads=40,
GTF.attrType="gene_name"
)

dat=data[[1]]
colnames(dat)<-c("Ctrl_CD41minus1","Ctrl_CD41minus2","Ctrl_CD41minus3","Ctrl_CD41plus1","Ctrl_CD41plus2","Ctrl_CD41plus3",
                 "Thpo_CD41minus1","Thpo_CD41minus2","Thpo_CD41minus3","Thpo_CD41plus1","Thpo_CD41plus2","Thpo_CD41plus3",
                 "Ctrl_neg")

x <- DGEList(counts=data$counts, genes=data$annotation[,c("GeneID","Length")])
x_rpkm <- rpkm(x,x$genes$Length)

colnames(x_rpkm)=c("Ctrl_CD41minus1","Ctrl_CD41minus2","Ctrl_CD41minus3","Ctrl_CD41plus1","Ctrl_CD41plus2","Ctrl_CD41plus3",
                 "Thpo_CD41minus1","Thpo_CD41minus2","Thpo_CD41minus3","Thpo_CD41plus1","Thpo_CD41plus2","Thpo_CD41plus3",
                 "Ctrl_neg")

saveRDS(x_rpkm,"ayako_rpkm.rds")
write.table(x_rpkm, "rpkm_ayako.txt",sep="\t",col.names=T,row.names=T,quote=F)
write.csv(x_rpkm, "rpkm_ayako.csv")
