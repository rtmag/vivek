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

###TF only 
#read file
multi_bed<-read.table("multiIntersect_output_TF5.bed",header=T,stringsAsFactors=F)

#formating
list.multi<-list(CEBPb=which(multi_bed$CEBPb==1),JUND=which(multi_bed$JUND==1))

#set venn;  i'll explain the parameters:
#Fill Vector with colors,
#alpha is how transparent do you want the colors
#cex the size of the numbers,
#lty the type of line 2 is dashed, 1 is full. other numbers are funny :P
#cat.cex is the TF name size
#margins is to play with the margins, if not specified the plot might get truncated
vp <- venn.diagram(list.multi,fill=c("red", "green"), alpha = .4, 
cex = .8,lty =2,cat.cex=.7, filename = NULL,margin=.1)
#plotting
grid.draw(vp)
