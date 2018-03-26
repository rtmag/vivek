x = read.csv("differentially_meth_cpg_bap1_VS_eif1ax-SF3B1_FDR1e-3.csv")

write.table(x[x[,11]>0,2:4],"bap1_cpg.bed",sep="\t",quote=F,row.names=F,col.names=F)
write.table(x[x[,11]<0,2:4],"sf3b1_eifax_cpg.bed",sep="\t",quote=F,row.names=F,col.names=F)

system("annotatePeaks.pl bap1_cpg.bed hg38 -annStats bap1_cpg.annStats > bap1_cpg.anno")
system("annotatePeaks.pl sf3b1_eifax_cpg.bed hg38 -annStats sf3b1_eifax_cpg.annStats > sf3b1_eifax_cpg.anno")

pdf("CpGs_hyper-methylated_in_tumors_with_BAP1_mutations_compared_to_EIF1AX_and_SF3B1.pdf")
par(mar=c(11.1,4.1,4.1,2))
res=read.table(pipe("more bap1_cpg.annStats |cut -f1,2,4"), sep="\t",header=F)
i1 = which(res[,1]=="Annotation")[2]+1
i2 = dim(res)[1]
res = res[ i1:i2,]
tdown = as.numeric(as.character(res[,2]))
names(tdown) = res[,1]
names(tdown) = paste(names(tdown)," ",round(tdown/sum(tdown)*100,digits=2),"%",sep="")
tdown = tdown[tdown>150]
pie(sort(tdown), main="Distribution of CpGs hyper-methylated in tumors with\nBAP1 mutations compared to EIF1AX and SF3B1 (9,662 CpGs)")
dev.off()

pdf("CpGs_hyper-methylated_in_tumors_with_either_EIF1AX_or_SF3B1_mutations_compared_to_BAP1.pdf")
res=read.table(pipe("more sf3b1_eifax_cpg.annStats |cut -f1,2,4"), sep="\t",header=F)
i1 = which(res[,1]=="Annotation")[2]+1
i2 = dim(res)[1]
res = res[ i1:i2,]
tdown = as.numeric(as.character(res[,2]))
names(tdown) = res[,1]
names(tdown) = paste(names(tdown)," ",round(tdown/sum(tdown)*100,digits=2),"%",sep="")
tdown = tdown[tdown>150]
pie(sort(tdown), main="Distribution of CpGs hyper-methylated in tumors with either\nEIF1AX or SF3B1 mutations compared to BAP1 (18,220 CpGs)")
dev.off()
