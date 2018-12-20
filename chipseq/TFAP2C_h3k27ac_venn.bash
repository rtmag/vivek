bedtools intersect -a BC_VS_NHM_50pro_1000w_DOWN_NHM-Specific_diff_200_fc1.bed -b TFAP2C_A375_DMSO.bed > NHM_TFAP2C.bed
bedtools intersect -a BC_VS_NHM_50pro_1000w_UP_BC-specific_diff_200_fc1.bed -b TFAP2C_A375_DMSO.bed > BC_TFAP2C.bed
###################################
annotatePeaks.pl NHM_TFAP2C.bed hg38 -annStats NHM_TFAP2C.annStats > NHM_TFAP2C.anno &
annotatePeaks.pl BC_TFAP2C.bed hg38 -annStats BC_TFAP2C.annStats > BC_TFAP2C.anno &
#################################
pdf("NHM_TFAP2C_H3K27ac.pdf")
res=read.table(pipe("more NHM_TFAP2C.annStats |cut -f1,2,4"), sep="\t",header=F)
i1 = which(res[,1]=="Annotation")[2]+1
i2 = dim(res)[1]
res = res[ i1:i2,]
tdown = as.numeric(as.character(res[,2]))
names(tdown) = res[,1]
names(tdown) = paste(names(tdown)," ",round(tdown/sum(tdown)*100,digits=2),"%",sep="")
tdown = tdown[tdown>5]
pie(sort(tdown), main=,cex=.8)
dev.off()

pdf("BC_TFAP2C_H3K27ac.pdf")
res=read.table(pipe("more BC_TFAP2C.annStats |cut -f1,2,4"), sep="\t",header=F)
i1 = which(res[,1]=="Annotation")[2]+1
i2 = dim(res)[1]
res = res[ i1:i2,]
tdown = as.numeric(as.character(res[,2]))
names(tdown) = res[,1]
names(tdown) = paste(names(tdown)," ",round(tdown/sum(tdown)*100,digits=2),"%",sep="")
tdown = tdown[tdown>5]
pie(sort(tdown), main=,cex=.8)
dev.off()
