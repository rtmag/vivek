
multiIntersectBed -i \
NHM_H3K27me3_peaks.broadPeak \
BRAF_H3K27me3_peaks.broadPeak \
CDKN2A_H3K27me3_peaks.broadPeak \
CDKN2A+BRAF_H3K27me3_peaks.broadPeak \
-names NHM NB NC NBC -header > multi_H3K27me3.bed
#########################################################################
library(VennDiagram)
multi_bed<-read.table("multi_H3K27me3.bed",header=T,stringsAsFactors=F)
#formating
list.multi<-list(NHM=which(multi_bed$NHM==1),NB=which(multi_bed$NB==1),NC=which(multi_bed$NC==1),NBC=which(multi_bed$NBC==1))
vp <- venn.diagram(list.multi,fill=c("red", "green","blue","orange"), alpha = .3, 
cex = 1,lty =2,cat.cex=1, filename = NULL,margin=.1,col=NA)
#plotting
pdf("multi_H3K27me3.pdf")
grid.draw(vp)
dev.off()
