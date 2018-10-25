library(edgeR)
library(Rsubread)
options(scipen=999)

data<-featureCounts(c(
"NHM_1_Aligned.sortedByCoord.out.bam",
"NHM_2_Aligned.sortedByCoord.out.bam",
"NHM_3_Aligned.sortedByCoord.out.bam",
"BRAF_1_Aligned.sortedByCoord.out.bam",
"BRAF_2_Aligned.sortedByCoord.out.bam",
"BRAF_3_Aligned.sortedByCoord.out.bam",
"CDKN2A_1_Aligned.sortedByCoord.out.bam",
"CDKN2A_2_Aligned.sortedByCoord.out.bam",
"CDKN2A_3_Aligned.sortedByCoord.out.bam",
"BRAF_+_CDKN2A_1_Aligned.sortedByCoord.out.bam",
"BRAF_+_CDKN2A_2_Aligned.sortedByCoord.out.bam",
"BRAF_+_CDKN2A_3_Aligned.sortedByCoord.out.bam"
),
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
colnames(dat)=c("NHM_1","NHM_2","NHM_3","BRAF_1","BRAF_2","BRAF_3",
                "CDKN2A_1","CDKN2A_2","CDKN2A_3","B_C_1","B_C_2","B_C_3")


x <- DGEList(counts=data$counts, genes=data$annotation[,c("GeneID","Length")])
x_rpkm <- rpkm(x,x$genes$Length)

colnames(x_rpkm)=c("NHM_1","NHM_2","NHM_3","BRAF_1","BRAF_2","BRAF_3",
                "CDKN2A_1","CDKN2A_2","CDKN2A_3","B_C_1","B_C_2","B_C_3")

saveRDS(x_rpkm,"NHM_rpkm.rds")
write.table(x_rpkm, "NHM_rpkm.txt",sep="\t",col.names=T,row.names=T,quote=F)
write.csv(x_rpkm, "NHM_rpkm.csv")
##
# AVG
avg_rpkm = x_rpkm[,1:4]
avg_rpkm[,1] = rowMeans(x_rpkm[,1:3])
avg_rpkm[,2] = rowMeans(x_rpkm[,4:6])
avg_rpkm[,3] = rowMeans(x_rpkm[,7:9])
avg_rpkm[,4] = rowMeans(x_rpkm[,10:12])
colnames(avg_rpkm)=c("N1","N2","N3","N4")

avg_rpkm=data.frame(gene_id=rownames(avg_rpkm),avg_rpkm)

saveRDS(avg_rpkm,"NHM_avg_rpkm.rds")
write.table(avg_rpkm, "NHM_avg_rpkm.txt",sep="\t",col.names=T,row.names=F,quote=F)
write.csv(avg_rpkm, "NHM_avg_rpkm.csv")

