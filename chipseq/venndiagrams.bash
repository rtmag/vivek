#####################################################################################################################################
more hg38_tss.bed | awk -F'\t' '$1"\t"$2-500"\t"$3+500"\t"$4"\t"$5"\t"$6'| \
bedtools intersect -a - -b NHM_10_segments.bed -wa -wb|grep -w "E4"|cut -f4|sort|uniq > NHM_E4_genes.txt

more hg38_tss.bed | awk -F'\t' '$1"\t"$2-500"\t"$3+500"\t"$4"\t"$5"\t"$6'| \
bedtools intersect -a - -b BRAF_10_segments.bed -wa -wb|grep -w "E4"|cut -f4|sort|uniq > BRAF_E4_genes.txt

more hg38_tss.bed | awk -F'\t' '$1"\t"$2-500"\t"$3+500"\t"$4"\t"$5"\t"$6'| \
bedtools intersect -a - -b CDKN2A_10_segments.bed -wa -wb|grep -w "E4"|cut -f4|sort|uniq > CDKN2A_E4_genes.txt

more hg38_tss.bed | awk -F'\t' '$1"\t"$2-500"\t"$3+500"\t"$4"\t"$5"\t"$6'| \
bedtools intersect -a - -b BRAF+CDKN2A_10_segments.bed -wa -wb|grep -w "E4"|cut -f4|sort|uniq > BRAF+CDKN2A_E4_genes.txt

#####################################################################################################################################

multiIntersectBed -i NHM_H3K27ac_40.bed BRAF_H3K27ac_40.bed CDKN2A_H3K27ac_40.bed CDKN2A+BRAF_H3K27ac_40.bed \
-names NHM NB NC NBC -header > multi_H3K27ac.bed

multiIntersectBed -i NHM_H3K27ac_40_noTSS.bed BRAF_H3K27ac_40_noTSS.bed CDKN2A_H3K27ac_40_noTSS.bed CDKN2A+BRAF_H3K27ac_40_noTSS.bed \
-names NHM NB NC NBC -header > multi_H3K27ac_noTSS.bed
#####################################################################################################################################
library(VennDiagram)
multi_bed<-read.table("multi_H3K27ac.bed",header=T,stringsAsFactors=F)
#formating
list.multi<-list(NHM=which(multi_bed$NHM==1),NB=which(multi_bed$NB==1),NC=which(multi_bed$NC==1),NBC=which(multi_bed$NBC==1))
vp <- venn.diagram(list.multi,fill=c("red", "green","blue","orange"), alpha = .3, 
cex = 1,lty =2,cat.cex=1, filename = NULL,margin=.1,col=NA)
#plotting
pdf("multi_H3K27ac.pdf")
grid.draw(vp)
dev.off()

multi_bed<-read.table("multi_H3K27ac_noTSS.bed",header=T,stringsAsFactors=F)
#formating
list.multi<-list(NHM=which(multi_bed$NHM==1),NB=which(multi_bed$NB==1),NC=which(multi_bed$NC==1),NBC=which(multi_bed$NBC==1))
vp <- venn.diagram(list.multi,fill=c("red", "green","blue","orange"), alpha = .3, 
cex = 1,lty =2,cat.cex=1, filename = NULL,margin=.1,col=NA)
#plotting
pdf("multi_H3K27ac_noTSS.pdf")
grid.draw(vp)
dev.off()
#####################################################################################################################################
NHM = read.table("NHM_E4_genes.txt",sep="\t",header=F,stringsAsFactors=F)
NB = read.table("BRAF_E4_genes.txt",sep="\t",header=F,stringsAsFactors=F)
NC = read.table("CDKN2A_E4_genes.txt",sep="\t",header=F,stringsAsFactors=F)
NBC = read.table("BRAF+CDKN2A_E4_genes.txt",sep="\t",header=F,stringsAsFactors=F)

library(VennDiagram)
#formating
list.multi<-list(NHM=NHM[,1],NB=NB[,1],NC=NC[,1],NBC=NBC[,1])
vp <- venn.diagram(list.multi,fill=c("red", "green","blue","orange"), alpha = .3, 
cex = 1,lty =2,cat.cex=1, filename = NULL,margin=.1,col=NA)

#plotting
pdf("poisedTSS_venn.pdf")
grid.draw(vp)
dev.off()
