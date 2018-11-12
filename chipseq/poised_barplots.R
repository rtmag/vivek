awk -F"\t" '{print $1"\t"$2"\t"$3"\t"$4}' hg38_tss.bed| sort -k1,1 -k2,2n | \
bedtools intersect -wa -wb \
-a - \
-b NHM_H3K4me3_peaks.broadPeak BRAF_H3K4me3_peaks.broadPeak CDKN2A_H3K4me3_peaks.broadPeak CDKN2A+BRAF_H3K4me3_peaks.broadPeak \
NHM_H3K27me3_peaks.broadPeak BRAF_H3K27me3_peaks.broadPeak CDKN2A_H3K27me3_peaks.broadPeak CDKN2A+BRAF_H3K27me3_peaks.broadPeak \
-sorted > intersect.bed
#####################################################################################################################################
intersect = read.table("intersect.bed",sep="\t",stringsAsFactors=F)
intersect = intersect[,c(4,9)]
intersect[,2] = gsub("\\_peak.+","",intersect[,2],perl=T)
