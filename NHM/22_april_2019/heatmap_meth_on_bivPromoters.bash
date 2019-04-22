grep -v "NA" SKCM_mean_beta.bedgraph > SKCM_mean_beta_withoutNA.bedgraph
awk -F"\t" '{print $1"\t"$3-1"\t"$3"\t"$4}' SKCM_mean_beta_withoutNA.bedgraph > SKCM_mean_beta_withoutNA_unmerged.bedgraph

bedops --partition SKCM_mean_beta_withoutNA_unmerged.bedgraph | \
bedmap --echo --echo-map-id-uniq --delim '\t' - SKCM_mean_beta_withoutNA_unmerged.bedgraph | \
awk '{ n = split($4, a, ";"); max = a[1]; for(i = 2; i <= n; i++) { if (a[i] > max) { max = a[i];} } print $1"\t"$2"\t"$3"\t"max; }' - \
> SKCM_mean_beta_withoutNA_unmerged_bedops.bedgraph

sed -i '244038d' SKCM_mean_beta_withoutNA_unmerged_bedops.bedgraph > SKCM_mean_beta_withoutNA_unmerged_bedops_noLine_244038.bedgraph

~/myPrograms/kentUtils/bin/bedGraphToBigWig SKCM_mean_beta_withoutNA_unmerged_bedops.bedgraph \
~/resources/hg38.chrom.sizes SKCM_mean_beta.bw
