more NHM\ _VS_\ BRAF_CDKN2A\ _differentially_expressed_genes.csv|perl -pe 's/\,/\t/g'|perl -pe 's/\"//g'|cut -f1,3| \
grep -v "log2FoldChange" |awk -F"\t" '{if($2>0){print $1}}' > up_NHM_BRAF_CDKN2A.txt
more NHM\ _VS_\ BRAF_CDKN2A\ _differentially_expressed_genes.csv|perl -pe 's/\,/\t/g'|perl -pe 's/\"//g'|cut -f1,3| \
grep -v "log2FoldChange" |awk -F"\t" '{if($2<0){print $1}}' > dw_NHM_BRAF_CDKN2A.txt

more NHM\ _VS_\ BRAF\ _differentially_expressed_genes.csv |perl -pe 's/\,/\t/g'|perl -pe 's/\"//g'|cut -f1,3| \
grep -v "log2FoldChange"|awk -F"\t" '{if($2>0){print $1}}' > up_NHM_BRAF.txt
more NHM\ _VS_\ BRAF\ _differentially_expressed_genes.csv |perl -pe 's/\,/\t/g'|perl -pe 's/\"//g'|cut -f1,3| \
grep -v "log2FoldChange"|awk -F"\t" '{if($2<0){print $1}}' > dw_NHM_BRAF.txt

more NHM\ _VS_\ CDKN2A\ _differentially_expressed_genes.csv |perl -pe 's/\,/\t/g'|perl -pe 's/\"//g'|cut -f1,3| \
grep -v "log2FoldChange"|awk -F"\t" '{if($2>0){print $1}}' > up_NHM_CDKN2A.txt
more NHM\ _VS_\ CDKN2A\ _differentially_expressed_genes.csv |perl -pe 's/\,/\t/g'|perl -pe 's/\"//g'|cut -f1,3| \
grep -v "log2FoldChange"|awk -F"\t" '{if($2<0){print $1}}' > dw_NHM_CDKN2A.txt
##############################################################################################################################
more /root/resources/hg38_tss.bed|grep -wf up_NHM_BRAF_CDKN2A.txt|grep -v "\-\AS"|grep -v "\-IT" > NHM_BRAF_CDKN2A.bed
echo "#NHM" >> NHM_BRAF_CDKN2A.bed
more /root/resources/hg38_tss.bed|grep -wf dw_NHM_BRAF_CDKN2A.txt|grep -v "\-\AS"|grep -v "\-IT" >> NHM_BRAF_CDKN2A.bed
echo "#CDKN2A" >> NHM_BRAF_CDKN2A.bed
#
more /root/resources/hg38_tss.bed|grep -wf up_NHM_BRAF.txt|grep -v "\-\AS"|grep -v "\-IT" > NHM_BRAF.bed
echo "#NHM" >> NHM_BRAF.bed
more /root/resources/hg38_tss.bed|grep -wf dw_NHM_BRAF.txt|grep -v "\-\AS"|grep -v "\-IT" >> NHM_BRAF.bed
echo "#BRAF" >> NHM_BRAF.bed
#
more /root/resources/hg38_tss.bed|grep -wf up_NHM_CDKN2A.txt|grep -v "\-\AS"|grep -v "\-IT" > NHM_CDKN2A.bed
echo "#NHM" >> NHM_CDKN2A.bed
more /root/resources/hg38_tss.bed|grep -wf dw_NHM_CDKN2A.txt|grep -v "\-\AS"|grep -v "\-IT" >> NHM_CDKN2A.bed
echo "#CDKN2A" >> NHM_CDKN2A.bed

##############################################################################################################################

computeMatrix reference-point \
-S \
/root/vivek/public_chipseq/bw/ATAC-Seq_NHM1.bw \
/root/vivek/public_chipseq/bw/ATAC-Seq_501MEL.bw \
/root/vivek/public_chipseq/bw/ChIP-Seq_H3K27ac_NHM1.bw \
/root/vivek/public_chipseq/bw/ChIP-Seq_H3K27ac_501MEL.bw \
/root/vivek/public_chipseq/bw/ChIP-Seq_H3K27ac_SKmel239.bw \
/root/vivek/public_chipseq/bw/ChIP-Seq_H3K4me1_NHM1.bw \
/root/vivek/public_chipseq/bw/ChIP-Seq_H3K4me1_501MEL.bw \
/root/vivek/public_chipseq/bw/ChIP-Seq_H3K4me1_SKmel239.bw \
-R /root/vivek/vivek_new_rna_seq/deseq2/NHM_BRAF_CDKN2A.bed --referencePoint center \
--sortRegions descend -bs 20 -a 3000 -b 3000 -p max -out /root/vivek/vivek_new_rna_seq/heatmap/NHM_BRAF_CDKN2A.mat

computeMatrix reference-point \
-S \
/root/vivek/public_chipseq/bw/ATAC-Seq_NHM1.bw \
/root/vivek/public_chipseq/bw/ATAC-Seq_501MEL.bw \
/root/vivek/public_chipseq/bw/ChIP-Seq_H3K27ac_NHM1.bw \
/root/vivek/public_chipseq/bw/ChIP-Seq_H3K27ac_501MEL.bw \
/root/vivek/public_chipseq/bw/ChIP-Seq_H3K27ac_SKmel239.bw \
/root/vivek/public_chipseq/bw/ChIP-Seq_H3K4me1_NHM1.bw \
/root/vivek/public_chipseq/bw/ChIP-Seq_H3K4me1_501MEL.bw \
/root/vivek/public_chipseq/bw/ChIP-Seq_H3K4me1_SKmel239.bw \
-R /root/vivek/vivek_new_rna_seq/deseq2/NHM_BRAF.bed --referencePoint center \
--sortRegions descend -bs 20 -a 3000 -b 3000 -p max -out /root/vivek/vivek_new_rna_seq/heatmap/NHM_BRAF.mat

computeMatrix reference-point \
-S \
/root/vivek/public_chipseq/bw/ATAC-Seq_NHM1.bw \
/root/vivek/public_chipseq/bw/ATAC-Seq_501MEL.bw \
/root/vivek/public_chipseq/bw/ChIP-Seq_H3K27ac_NHM1.bw \
/root/vivek/public_chipseq/bw/ChIP-Seq_H3K27ac_501MEL.bw \
/root/vivek/public_chipseq/bw/ChIP-Seq_H3K27ac_SKmel239.bw \
/root/vivek/public_chipseq/bw/ChIP-Seq_H3K4me1_NHM1.bw \
/root/vivek/public_chipseq/bw/ChIP-Seq_H3K4me1_501MEL.bw \
/root/vivek/public_chipseq/bw/ChIP-Seq_H3K4me1_SKmel239.bw \
-R /root/vivek/vivek_new_rna_seq/deseq2/NHM_CDKN2A.bed --referencePoint center \
--sortRegions descend -bs 20 -a 3000 -b 3000 -p max -out /root/vivek/vivek_new_rna_seq/heatmap/NHM_CDKN2A.mat
##############################################################################################################################

plotHeatmap --xAxisLabel "" --refPointLabel "TSS" --colorMap Greens Greens Reds Reds Reds Blues Blues Blues \
-m /root/vivek/vivek_new_rna_seq/heatmap/NHM_BRAF_CDKN2A.mat \
--samplesLabel "ATAC-NHM1 ATAC-501MEL" "H3K27ac-NHM1" "H3K27ac-501MEL" "H3K27ac-SKmel239" "H3K4me1-NHM1" "H3K4me1-501MEL" "H3K4me1-SKmel239" \
-out /root/vivek/vivek_new_rna_seq/heatmap/NHM_BRAF_CDKN2A.pdf

plotHeatmap --xAxisLabel "" --refPointLabel "TSS" --colorMap Greens Greens Reds Reds Reds Blues Blues Blues \
-m /root/vivek/vivek_new_rna_seq/heatmap/NHM_BRAF.mat \
--samplesLabel "ATAC-NHM1 ATAC-501MEL" "H3K27ac-NHM1" "H3K27ac-501MEL" "H3K27ac-SKmel239" "H3K4me1-NHM1" "H3K4me1-501MEL" "H3K4me1-SKmel239" \
-out /root/vivek/vivek_new_rna_seq/heatmap/NHM_BRAF.pdf

plotHeatmap --xAxisLabel "" --refPointLabel "TSS" --colorMap Greens Greens Reds Reds Reds Blues Blues Blues \
-m /root/vivek/vivek_new_rna_seq/heatmap/NHM_CDKN2A.mat \
--samplesLabel "ATAC-NHM1 ATAC-501MEL" "H3K27ac-NHM1" "H3K27ac-501MEL" "H3K27ac-SKmel239" "H3K4me1-NHM1" "H3K4me1-501MEL" "H3K4me1-SKmel239" \
-out /root/vivek/vivek_new_rna_seq/heatmap/NHM_CDKN2A.pdf

##############################################################################################################################

computeMatrix reference-point \
-S \
/root/vivek/public_chipseq/bw/ChIP-Seq_H3K27ac_NHM1.bw \
/root/vivek/public_chipseq/bw/ChIP-Seq_H3K27ac_501MEL.bw \
/root/vivek/public_chipseq/bw/ChIP-Seq_H3K27ac_SKmel239.bw \
/root/vivek/public_chipseq/bw/ChIP-Seq_H3K4me1_NHM1.bw \
/root/vivek/public_chipseq/bw/ChIP-Seq_H3K4me1_501MEL.bw \
/root/vivek/public_chipseq/bw/ChIP-Seq_H3K4me1_SKmel239.bw \
-R /root/vivek/vivek_new_rna_seq/deseq2/NHM_BRAF_CDKN2A.bed --referencePoint center \
--sortRegions descend -bs 20 -a 3000 -b 3000 -p max -out /root/vivek/vivek_new_rna_seq/heatmap/NHM_BRAF_CDKN2A_hk3.mat


plotHeatmap --xAxisLabel "" --refPointLabel "TSS" --colorMap Reds Reds Reds Blues Blues Blues \
-m /root/vivek/vivek_new_rna_seq/heatmap/NHM_BRAF_CDKN2A_hk3.mat \
--samplesLabel "H3K27ac-NHM1" "H3K27ac-501MEL" "H3K27ac-SKmel239" "H3K4me1-NHM1" "H3K4me1-501MEL" "H3K4me1-SKmel239" \
-out /root/vivek/vivek_new_rna_seq/heatmap/NHM_BRAF_CDKN2A_h3k.pdf

