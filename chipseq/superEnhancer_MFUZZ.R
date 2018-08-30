require(Biobase)
library(Mfuzz)
library(gplots)
library(ggplot2)
options(bitmapType="cairo")
options(scipen=999)

data = read.table(pipe("more diffreps_superEnhancer_merge_signal.txt |grep -v '#'|perl -pe 's/genes:8022\t//g' "),sep="\t",header=T)

wt<-new("ExpressionSet", exprs=as.matrix(data))
wt.s<-standardise(wt)
cl_wt<-mfuzz(wt.s,c=9,m=mestimate(wt.s))
pdf('mfuzz.pdf')
mfuzz.plot(wt.s,cl=cl_wt,mfrow=c(3,3),new.window=F,time.labels=c("NHM","BRAF","CDKN2A","B+C"))
table(cl_wt$cluster)
dev.off()

bed = read.table("diffreps_superEnhancer_merge.bed",sep="\t",header=F)


write.table(bed[cl_wt$cluster==1,],"ct_diffreps_superEnhancer_merge_signal.bed",quote=F,col.names=F,row.names=F,sep="\t")
label="#Cluster 1"
write.table(label,"ct_diffreps_superEnhancer_merge_signal.bed",quote=F,col.names=F,row.names=F,append=T)
write.table(bed[cl_wt$cluster==2,],"ct_diffreps_superEnhancer_merge_signal.bed",quote=F,col.names=F,row.names=F,append=T,sep="\t")
label="#Cluster 2"
write.table(label,"ct_diffreps_superEnhancer_merge_signal.bed",quote=F,col.names=F,row.names=F,append=T)
write.table(bed[cl_wt$cluster==3,],"ct_diffreps_superEnhancer_merge_signal.bed",quote=F,col.names=F,row.names=F,append=T,sep="\t")
label="#Cluster 3"
write.table(label,"ct_diffreps_superEnhancer_merge_signal.bed",quote=F,col.names=F,row.names=F,append=T)
write.table(bed[cl_wt$cluster==4,],"ct_diffreps_superEnhancer_merge_signal.bed",quote=F,col.names=F,row.names=F,append=T,sep="\t")
label="#Cluster 4"
write.table(label,"ct_diffreps_superEnhancer_merge_signal.bed",quote=F,col.names=F,row.names=F,append=T)
write.table(bed[cl_wt$cluster==5,],"ct_diffreps_superEnhancer_merge_signal.bed",quote=F,col.names=F,row.names=F,append=T,sep="\t")
label="#Cluster 5"
write.table(label,"ct_diffreps_superEnhancer_merge_signal.bed",quote=F,col.names=F,row.names=F,append=T)
write.table(bed[cl_wt$cluster==6,],"ct_diffreps_superEnhancer_merge_signal.bed",quote=F,col.names=F,row.names=F,append=T,sep="\t")
label="#Cluster 6"
write.table(label,"ct_diffreps_superEnhancer_merge_signal.bed",quote=F,col.names=F,row.names=F,append=T)
write.table(bed[cl_wt$cluster==7,],"ct_diffreps_superEnhancer_merge_signal.bed",quote=F,col.names=F,row.names=F,append=T,sep="\t")
label="#Cluster 7"
write.table(label,"ct_diffreps_superEnhancer_merge_signal.bed",quote=F,col.names=F,row.names=F,append=T)
write.table(bed[cl_wt$cluster==8,],"ct_diffreps_superEnhancer_merge_signal.bed",quote=F,col.names=F,row.names=F,append=T,sep="\t")
label="#Cluster 8"
write.table(label,"ct_diffreps_superEnhancer_merge_signal.bed",quote=F,col.names=F,row.names=F,append=T)
write.table(bed[cl_wt$cluster==9,],"ct_diffreps_superEnhancer_merge_signal.bed",quote=F,col.names=F,row.names=F,append=T,sep="\t")
label="#Cluster 9"
write.table(label,"ct_diffreps_superEnhancer_merge_signal.bed",quote=F,col.names=F,row.names=F,append=T)
