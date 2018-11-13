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
NHM = rep(NA, length(geneID))
names(NHM) = geneID
BRAF = rep(NA, length(geneID))
names(BRAF) = geneID
CDKN2A = rep(NA, length(geneID))
names(CDKN2A) = geneID
B_C = rep(NA, length(geneID))
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

x= cbind(NHM,BRAF,CDKN2A,B_C)
saveRDS(x,"poised_barplot.rds")


tab = apply(x,2,table) 
tab = rbind(tab,c(
  46068-sum(tab[,1]),46068-sum(tab[,2]),46068-sum(tab[,3]),46068-sum(tab[,4])
     ) )

colnames(tab) = c("NHM","BRAF","CDKN2A","BRAF+CDKN2A")
rownames(tab) = c("H3K27me3","H3K4me3","Poised","Neg")

tab = tab[c(2,1,3,4),]

tab_p = tab
tab_p[,1] = 100*tab[,1]/46068
tab_p[,2] = 100*tab[,2]/46068
tab_p[,3] = 100*tab[,3]/46068
tab_p[,4] = 100*tab[,4]/46068

pdf("poised_barplot.pdf")
barplot(tab_p, col=c("#ED0A3F","#1560BD","#3AA655","grey"),ylab = "Promoter (%)")
dev.off()

pdf("poised_barplot_legend.pdf")
plot.new()
legend("top",legend=rownames(tab_p),fill=c("#ED0A3F","#1560BD","#3AA655","grey"))
dev.off()


