grep -v "NA" SKCM_mean_beta.bedgraph > SKCM_mean_beta_withoutNA.bedgraph
awk -F"\t" '{print $1"\t"$3-1"\t"$3"\t"$4}' SKCM_mean_beta_withoutNA.bedgraph > SKCM_mean_beta_withoutNA_unmerged.bedgraph

bedops --partition SKCM_mean_beta_withoutNA_unmerged.bedgraph | \
bedmap --echo --echo-map-id-uniq --delim '\t' - SKCM_mean_beta_withoutNA_unmerged.bedgraph | \
awk '{ n = split($4, a, ";"); max = a[1]; for(i = 2; i <= n; i++) { if (a[i] > max) { max = a[i];} } print $1"\t"$2"\t"$3"\t"max; }' - \
> SKCM_mean_beta_withoutNA_unmerged_bedops.bedgraph

awk 'NR!~/^(244038)$/' SKCM_mean_beta_withoutNA_unmerged_bedops.bedgraph > SKCM_mean_beta_withoutNA_unmerged_bedops_noLine_244038.bedgraph

grep -v "chrM" SKCM_mean_beta_withoutNA_unmerged_bedops_noLine_244038.bedgraph \
> SKCM_mean_beta_withoutNA_unmerged_bedops_noLine_244038_noChrM.bedgraph

grep -P -v "chr10\t45862\t45863" SKCM_mean_beta_withoutNA_unmerged_bedops_noLine_244038_noChrM.bedgraph > \
SKCM_mean_beta_withoutNA_unmerged_bedops_noLine_244038_noChrM_no3Lines.bedgraph

awk 'NF==4' SKCM_mean_beta_withoutNA_unmerged_bedops_noLine_244038_noChrM.bedgraph > \
SKCM_mean_beta_withoutNA_unmerged_bedops_noLine_244038_noChrM_no3Lines.bedgraph


~/myPrograms/kentUtils/bin/bedGraphToBigWig SKCM_mean_beta_withoutNA_unmerged_bedops_noLine_244038_noChrM_no3Lines.bedgraph \
~/resources/hg38.chrom.sizes SKCM_mean_beta.bw

computeMatrix reference-point \
-S \
SKCM_mean_beta.bw \
-R /root/vivek/chip-seq/chromHMM/poised/poised_kmeans_zmet_5k_3clusters.bed --referencePoint center \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out SKCM_mean_beta_on_poised_kmeans_zmet_5k_3clusters.mat

plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "PoisedTSS" \
--colorMap Reds \
-m SKCM_mean_beta_on_poised_kmeans_zmet_5k_3clusters.mat \
--samplesLabel "SKCM AVG DNA methylation" \
-out SKCM_mean_beta_on_poised_kmeans_zmet_5k_3clusters.pdf
