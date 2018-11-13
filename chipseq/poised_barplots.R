awk -F"\t" '{print $1"\t"$2"\t"$3"\t"$4}' hg38_tss.bed| sort -k1,1 -k2,2n | \
bedtools intersect -wa -wb \
-a - \
-b NHM_H3K4me3_peaks.broadPeak BRAF_H3K4me3_peaks.broadPeak CDKN2A_H3K4me3_peaks.broadPeak CDKN2A+BRAF_H3K4me3_peaks.broadPeak \
NHM_H3K27me3_peaks.broadPeak BRAF_H3K27me3_peaks.broadPeak CDKN2A_H3K27me3_peaks.broadPeak CDKN2A+BRAF_H3K27me3_peaks.broadPeak \
-sorted > intersect.bed
#####################################################################################################################################
inter = read.table("intersect.bed",sep="\t",stringsAsFactors=F)
inter = inter[,c(4,9)]
inter[,2] = gsub("\\_peak.+","",inter[,2],perl=T)

geneID = unique(inter[,1])
NHM = geneID
names(NHM) = geneID
BRAF = geneID
names(BRAF) = geneID
CDKN2A = geneID
names(CDKN2A) = geneID
B_C = geneID
names(B_C) = geneID

for(i in 1:length(geneID)){
  if( "NHM_H3K4me3"  %in% inter[inter[,1] %in% geneID[i],2] ){ NHM[i] = "H3K4me3"}
  if( "NHM_H3K27me3"  %in% inter[inter[,1] %in% geneID[i],2] ){ NHM[i] = "H3K27me3"}
  if( ("NHM_H3K4me3"  %in% inter[inter[,1] %in% geneID[i],2]) & ("NHM_H3K27me3"  %in% inter[inter[,1] %in% geneID[i],2]) ){ NHM[i] = "poised"}     

  if( "BRAF_H3K4me3"  %in% inter[inter[,1] %in% geneID[i],2] ){ BRAF[i] = "H3K4me3"}
  if( "BRAF_H3K27me3"  %in% inter[inter[,1] %in% geneID[i],2] ){ BRAF[i] = "H3K27me3"}
  if( ("BRAF_H3K4me3"  %in% inter[inter[,1] %in% geneID[i],2]) & ("BRAF_H3K27me3"  %in% inter[inter[,1] %in% geneID[i],2]) ){ BRAF[i] = "poised"}

  if( "CDKN2A_H3K4me3"  %in% inter[inter[,1] %in% geneID[i],2] ){ CDKN2A[i] = "H3K4me3"}
  if( "CDKN2A_H3K27me3"  %in% inter[inter[,1] %in% geneID[i],2] ){ CDKN2A[i] = "H3K27me3"}
  if( ("CDKN2A_H3K4me3"  %in% inter[inter[,1] %in% geneID[i],2]) & ("CDKN2A_H3K27me3"  %in% inter[inter[,1] %in% geneID[i],2]) ){ CDKN2A[i] = "poised"}  
 
  if( "CDKN2A+BRAF_H3K4me3"  %in% inter[inter[,1] %in% geneID[i],2] ){ B_C[i] = "H3K4me3"}
  if( "CDKN2A+BRAF_H3K27me3"  %in% inter[inter[,1] %in% geneID[i],2] ){ B_C[i] = "H3K27me3"}
  if( ("CDKN2A+BRAF_H3K4me3"  %in% inter[inter[,1] %in% geneID[i],2]) & ("CDKN2A+BRAF_H3K27me3"  %in% inter[inter[,1] %in% geneID[i],2]) ){ B_C[i] = "poised"}  
 }








