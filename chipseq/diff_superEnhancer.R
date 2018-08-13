bed = read.table("superEnhancer_merged.bed",sep="\t",stringsAsFactors=F)

x=read.csv("superenhancer_BW_counts.csv",header=F)
colnames(x) = c("NHM","BRAF","CB")
x = x+1

braf_nhm = x[,2]/x[,1]
cb_braf = x[,3]/x[,2]
cb_nhm = x[,3]/x[,1]

nhm = braf_nhm<0.5 & cb_nhm<0.5
braf = braf_nhm>2 & cb_braf<0.5
cb = cb_braf> 2 & cb_nhm>2

##################################################################
library(Rsubread)

x=read.table('/root/vivek/chip-seq/ROSE/heatmap/superEnhancer_merged.bed',sep="\t",stringsAsFactors=F)

ann = data.frame(GeneID=paste(x[,1],x[,2],x[,3],sep="_!_"),Chr=x[,1],Start=x[,2],End=x[,3],Strand='+')

bam.files <- c('/root/vivek/chip-seq/bam/NHM_H3K27ac_rmdup.bam',
              '/root/vivek/chip-seq/bam/BRAF_H3K27ac_rmdup.bam',
              '/root/vivek/chip-seq/bam/CDKN2A+BRAF_H3K27ac_rmdup.bam')

fc_SE <- featureCounts(bam.files,annot.ext=ann,isPairedEnd=TRUE,nthreads=60)

x=fc_SE$counts
colnames(x) = c("NHM","BRAF","CB")
saveRDS(x,"superEnhancer_counts.rds")
x = readRDS("superEnhancer_counts.rds")
x = x+1

braf_nhm = log2(x[,2]/x[,1])
cb_braf = log2(x[,3]/x[,2])
cb_nhm =log2( x[,3]/x[,1])

table( braf_nhm<(-0.6) & cb_nhm<(-0.6))
table( braf_nhm>.6 & cb_braf<(-0.6))
table(cb_braf>.6 & cb_nhm>.4)

braf_sp =  bed[cb_braf<(-0.5),]
cb_sp = bed[cb_braf>(0.5),]

write.table(braf_sp,"braf_specific_se.bed",sep="\t",quote=F,col.names=F,row.names=F)
write.table(cb_sp,"cb_specific_se.bed",sep="\t",quote=F,col.names=F,row.names=F)
