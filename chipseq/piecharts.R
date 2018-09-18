###!SHELL
annotatePeaks.pl BC_VS_NHM_50pro_1000w_DOWN_diff_200_fc1.bed hg38 -annStats BC_VS_NHM_50pro_1000w_DOWN_diff_200_fc1.annStats > BC_VS_NHM_50pro_1000w_DOWN_diff_200_fc1.anno &
annotatePeaks.pl BC_VS_NHM_50pro_1000w_UP_diff_200_fc1.bed hg38 -annStats BC_VS_NHM_50pro_1000w_UP_diff_200_fc1.annStats > BC_VS_NHM_50pro_1000w_UP_diff_200_fc1.anno &

annotatePeaks.pl BC_VS_NHM_50pro_1000w_DOWN_diff_500.bed hg38 -annStats BC_VS_NHM_50pro_1000w_DOWN_diff_500.annStats > BC_VS_NHM_50pro_1000w_DOWN_diff_500.anno &
annotatePeaks.pl BC_VS_NHM_50pro_1000w_UP_diff_500.bed hg38 -annStats BC_VS_NHM_50pro_1000w_UP_diff_500.annStats > BC_VS_NHM_50pro_1000w_UP_diff_500.anno &
###!SHELL
##!R
pdf("BC_VS_NHM_50pro_1000w_DOWN_diff_200_fc1_pie.pdf")
res=read.table(pipe("more BC_VS_NHM_50pro_1000w_DOWN_diff_200_fc1.annStats |cut -f1,2,4"), sep="\t",header=F)
i1 = which(res[,1]=="Annotation")[2]+1
i2 = dim(res)[1]
res = res[ i1:i2,]
tdown = as.numeric(as.character(res[,2]))
names(tdown) = res[,1]
names(tdown) = paste(names(tdown)," ",round(tdown/sum(tdown)*100,digits=2),"%",sep="")
tdown = tdown[tdown>5]
pie(sort(tdown), main=,cex=.8)
dev.off()

pdf("BC_VS_NHM_50pro_1000w_UP_diff_200_fc1_pie.pdf")
res=read.table(pipe("more BC_VS_NHM_50pro_1000w_UP_diff_200_fc1.annStats |cut -f1,2,4"), sep="\t",header=F)
i1 = which(res[,1]=="Annotation")[2]+1
i2 = dim(res)[1]
res = res[ i1:i2,]
tdown = as.numeric(as.character(res[,2]))
names(tdown) = res[,1]
names(tdown) = paste(names(tdown)," ",round(tdown/sum(tdown)*100,digits=2),"%",sep="")
tdown = tdown[tdown>5]
pie(sort(tdown), main=,cex=.8)
dev.off()
##!R
##!R
pdf("BC_VS_NHM_50pro_1000w_DOWN_diff_500.pdf")
res=read.table(pipe("more BC_VS_NHM_50pro_1000w_DOWN_diff_500.annStats |cut -f1,2,4"), sep="\t",header=F)
i1 = which(res[,1]=="Annotation")[2]+1
i2 = dim(res)[1]
res = res[ i1:i2,]
tdown = as.numeric(as.character(res[,2]))
names(tdown) = res[,1]
names(tdown) = paste(names(tdown)," ",round(tdown/sum(tdown)*100,digits=2),"%",sep="")
tdown = tdown[tdown>5]
pie(sort(tdown), main=,cex=.8)
dev.off()

pdf("BC_VS_NHM_50pro_1000w_UP_diff_500.pdf")
res=read.table(pipe("more BC_VS_NHM_50pro_1000w_UP_diff_500.annStats |cut -f1,2,4"), sep="\t",header=F)
i1 = which(res[,1]=="Annotation")[2]+1
i2 = dim(res)[1]
res = res[ i1:i2,]
tdown = as.numeric(as.character(res[,2]))
names(tdown) = res[,1]
names(tdown) = paste(names(tdown)," ",round(tdown/sum(tdown)*100,digits=2),"%",sep="")
tdown = tdown[tdown>5]
pie(sort(tdown), main=,cex=.8)
dev.off()
##!R
