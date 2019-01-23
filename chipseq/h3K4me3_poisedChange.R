
library(Rsubread)

sink("/root/taka/RNA-seq/deseq2/RNA-Seq_featureCounts.log")
x=read.table('k4_intk27.bed',sep="\t",stringsAsFactors=F)
ann = data.frame(GeneID=paste(x[,1],x[,2],x[,3],x[,4],sep="_!_"),Chr=x[,1],Start=x[,2],End=x[,3],Strand='+')

bam.files <- c('/root/vivek/chip-seq/bam/NHM_H3K4me3_rmdup.bam',
              '/root/vivek/chip-seq/bam/CDKN2A+BRAF_H3K4me3_rmdup.bam')
k4 <- featureCounts(bam.files,annot.ext=ann,isPairedEnd=FALSE,nthreads=40)
################################################################################################################
x=read.table('k27_intk4.bed',sep="\t",stringsAsFactors=F)
ann = data.frame(GeneID=paste(x[,1],x[,2],x[,3],x[,4],sep="_!_"),Chr=x[,1],Start=x[,2],End=x[,3],Strand='+')

bam.files <- c('/root/vivek/chip-seq/bam/NHM_H3K27me3_rmdup.bam',
              '/root/vivek/chip-seq/bam/CDKN2A+BRAF_H3K27me3_rmdup.bam')
k27 <- featureCounts(bam.files,annot.ext=ann,isPairedEnd=FALSE,nthreads=40)
sink()






countData=fc_SE$counts

colnames(countData)=gsub('X.root.ayako.ayako_dejavu.bam.',"",colnames(countData))

colnames(countData)=gsub('_Aligned_rmdup.sortedByCoord.out.bam',"",colnames(countData))

saveRDS(countData,'atac_countdata.rds')
