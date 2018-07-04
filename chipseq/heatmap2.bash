
################################################################################################################################
computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27ac.bw \
/root/vivek/chip-seq/bw/NHM_H3K27ac.bw \
-R /root/vivek/vivek_new_rna_seq/deseq2/NHM_BRAF_CDKN2A.bed --referencePoint center \
--sortRegions descend -bs 20 -a 3000 -b 3000 -p max -out /root/vivek/chip-seq/heatmap/rH3K27ac_NHM_BRAF_CDKN2A.mat

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27me3.bw \
/root/vivek/chip-seq/bw/NHM_H3K27me3.bw \
-R /root/vivek/vivek_new_rna_seq/deseq2/NHM_BRAF_CDKN2A.bed --referencePoint center \
--sortRegions descend -bs 20 -a 3000 -b 3000 -p max -out /root/vivek/chip-seq/heatmap/rH3K27me3_NHM_BRAF_CDKN2A.mat

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K4me3.bw \
/root/vivek/chip-seq/bw/NHM_H3K4me3.bw \
-R /root/vivek/vivek_new_rna_seq/deseq2/NHM_BRAF_CDKN2A.bed --referencePoint center \
--sortRegions descend -bs 20 -a 3000 -b 3000 -p max -out /root/vivek/chip-seq/heatmap/rH3K4me3_NHM_BRAF_CDKN2A.mat

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K9me3.bw \
/root/vivek/chip-seq/bw/NHM_H3K9me3.bw \
-R /root/vivek/vivek_new_rna_seq/deseq2/NHM_BRAF_CDKN2A.bed --referencePoint center \
--sortRegions descend -bs 20 -a 3000 -b 3000 -p max -out /root/vivek/chip-seq/heatmap/rH3K9me3_NHM_BRAF_CDKN2A.mat
################################################################################################################################
computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/BRAF_H3K27ac.bw \
/root/vivek/chip-seq/bw/NHM_H3K27ac.bw \
-R /root/vivek/vivek_new_rna_seq/deseq2/NHM_BRAF.bed --referencePoint center \
--sortRegions descend -bs 20 -a 3000 -b 3000 -p max -out /root/vivek/chip-seq/heatmap/rH3K27ac_NHM_BRAF.mat

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/BRAF_H3K27me3.bw \
/root/vivek/chip-seq/bw/NHM_H3K27me3.bw \
-R /root/vivek/vivek_new_rna_seq/deseq2/NHM_BRAF.bed --referencePoint center \
--sortRegions descend -bs 20 -a 3000 -b 3000 -p max -out /root/vivek/chip-seq/heatmap/rH3K27me3_NHM_BRAF.mat

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/BRAF_H3K4me3.bw \
/root/vivek/chip-seq/bw/NHM_H3K4me3.bw \
-R /root/vivek/vivek_new_rna_seq/deseq2/NHM_BRAF.bed --referencePoint center \
--sortRegions descend -bs 20 -a 3000 -b 3000 -p max -out /root/vivek/chip-seq/heatmap/rH3K4me3_NHM_BRAF.mat

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/BRAF_H3K9me3.bw \
/root/vivek/chip-seq/bw/NHM_H3K9me3.bw \
-R /root/vivek/vivek_new_rna_seq/deseq2/NHM_BRAF.bed --referencePoint center \
--sortRegions descend -bs 20 -a 3000 -b 3000 -p max -out /root/vivek/chip-seq/heatmap/rH3K9me3_NHM_BRAF.mat
################################################################################################################################
computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/CDKN2A_H3K27ac.bw \
/root/vivek/chip-seq/bw/NHM_H3K27ac.bw \
-R /root/vivek/vivek_new_rna_seq/deseq2/NHM_CDKN2A.bed --referencePoint center \
--sortRegions descend -bs 20 -a 3000 -b 3000 -p max -out /root/vivek/chip-seq/heatmap/rH3K27ac_NHM_CDKN2A.mat

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/CDKN2A_H3K27me3.bw \
/root/vivek/chip-seq/bw/NHM_H3K27me3.bw \
-R /root/vivek/vivek_new_rna_seq/deseq2/NHM_CDKN2A.bed --referencePoint center \
--sortRegions descend -bs 20 -a 3000 -b 3000 -p max -out /root/vivek/chip-seq/heatmap/rH3K27me3_NHM_CDKN2A.mat

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/CDKN2A_H3K4me3.bw \
/root/vivek/chip-seq/bw/NHM_H3K4me3.bw \
-R /root/vivek/vivek_new_rna_seq/deseq2/NHM_CDKN2A.bed --referencePoint center \
--sortRegions descend -bs 20 -a 3000 -b 3000 -p max -out /root/vivek/chip-seq/heatmap/rH3K4me3_NHM_CDKN2A.mat

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/CDKN2A_H3K9me3.bw \
/root/vivek/chip-seq/bw/NHM_H3K9me3.bw \
-R /root/vivek/vivek_new_rna_seq/deseq2/NHM_CDKN2A.bed --referencePoint center \
--sortRegions descend -bs 20 -a 3000 -b 3000 -p max -out /root/vivek/chip-seq/heatmap/rH3K9me3_NHM_CDKN2A.mat
################################################################################################################################

plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "TSS" --colorMap Blues \
-m /root/vivek/chip-seq/heatmap/rH3K27ac_NHM_BRAF_CDKN2A.mat \
 --samplesLabel "H3K27ac CDKN2A+BRAF" "H3K27ac NHM" \
-out /root/ong_dukenus/ATAC-SEQ/heatmap/rH3K27ac_NHM_BRAF_CDKN2A.pdf

plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "TSS" --colorMap Oranges \
-m /root/vivek/chip-seq/heatmap/rH3K27me3_NHM_BRAF_CDKN2A.mat \
 --samplesLabel "H3K27me3 CDKN2A+BRAF" "H3K27me3 NHM" \
-out /root/ong_dukenus/ATAC-SEQ/heatmap/rH3K27me3_NHM_BRAF_CDKN2A.pdf

plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "TSS" --colorMap Greens \
-m /root/vivek/chip-seq/heatmap/rH3K4me3_NHM_BRAF_CDKN2A.mat \
 --samplesLabel "H3K4me3 CDKN2A+BRAF" "H3K4me3 NHM" \
-out /root/ong_dukenus/ATAC-SEQ/heatmap/rH3K4me3_NHM_BRAF_CDKN2A.pdf

plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "TSS" --colorMap Reds \
-m /root/vivek/chip-seq/heatmap/rH3K9me3_NHM_BRAF_CDKN2A.mat \
 --samplesLabel "H3K9me3 CDKN2A+BRAF" "H3K9me3 NHM" \
-out /root/ong_dukenus/ATAC-SEQ/heatmap/rH3K9me3_NHM_BRAF_CDKN2A.pdf
################################################################################################
plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "TSS" --colorMap Blues \
-m /root/vivek/chip-seq/heatmap/rH3K27ac_NHM_BRAF.mat \
 --samplesLabel "H3K27ac BRAF" "H3K27ac NHM" \
-out /root/ong_dukenus/ATAC-SEQ/heatmap/rH3K27ac_NHM_BRAF.pdf

plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "TSS" --colorMap Oranges \
-m /root/vivek/chip-seq/heatmap/rH3K27me3_NHM_BRAF.mat \
 --samplesLabel "H3K27me3 BRAF" "H3K27me3 NHM" \
-out /root/ong_dukenus/ATAC-SEQ/heatmap/rH3K27me3_NHM_BRAF.pdf

plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "TSS" --colorMap Greens \
-m /root/vivek/chip-seq/heatmap/rH3K4me3_NHM_BRAF.mat \
 --samplesLabel "H3K4me3 BRAF" "H3K4me3 NHM" \
-out /root/ong_dukenus/ATAC-SEQ/heatmap/rH3K4me3_NHM_BRAF.pdf

plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "TSS" --colorMap Reds \
-m /root/vivek/chip-seq/heatmap/rH3K9me3_NHM_BRAF.mat \
 --samplesLabel "H3K9me3 BRAF" "H3K9me3 NHM" \
-out /root/ong_dukenus/ATAC-SEQ/heatmap/rH3K9me3_NHM_BRAF.pdf

#############################################################################################################

plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "TSS" --colorMap Blues \
-m /root/vivek/chip-seq/heatmap/rH3K27ac_NHM_CDKN2A.mat \
 --samplesLabel "H3K27ac CDKN2A" "H3K27ac NHM" \
-out /root/ong_dukenus/ATAC-SEQ/heatmap/rH3K27ac_NHM_CDKN2A.pdf

plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "TSS" --colorMap Oranges \
-m /root/vivek/chip-seq/heatmap/rH3K27me3_NHM_CDKN2A.mat \
 --samplesLabel "H3K27me3 CDKN2A" "H3K27me3 NHM" \
-out /root/ong_dukenus/ATAC-SEQ/heatmap/rH3K27me3_NHM_CDKN2A.pdf

plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "TSS" --colorMap Greens \
-m /root/vivek/chip-seq/heatmap/rH3K4me3_NHM_CDKN2A.mat \
 --samplesLabel "H3K4me3 CDKN2A" "H3K4me3 NHM" \
-out /root/ong_dukenus/ATAC-SEQ/heatmap/rH3K4me3_NHM_CDKN2A.pdf

plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "TSS" --colorMap Reds \
-m /root/vivek/chip-seq/heatmap/rH3K9me3_NHM_CDKN2A.mat \
 --samplesLabel "H3K9me3 CDKN2A" "H3K9me3 NHM" \
-out /root/ong_dukenus/ATAC-SEQ/heatmap/rH3K9me3_NHM_CDKN2A.pdf

#
pdfjam rH3K27ac_NHM_BRAF.pdf  rH3K27me3_NHM_BRAF.pdf rH3K4me3_NHM_BRAF.pdf  rH3K9me3_NHM_BRAF.pdf --nup 2x1 --landscape
pdfjam rH3K27ac_NHM_CDKN2A.pdf  rH3K27me3_NHM_CDKN2A.pdf rH3K4me3_NHM_CDKN2A.pdf  rH3K9me3_NHM_CDKN2A.pdf --nup 2x1 --landscape
pdfjam rH3K27ac_NHM_BRAF_CDKN2A.pdf  rH3K27me3_NHM_BRAF_CDKN2A.pdf rH3K4me3_NHM_BRAF_CDKN2A.pdf  rH3K9me3_NHM_BRAF_CDKN2A.pdf --nup 2x1 --landscape
#
