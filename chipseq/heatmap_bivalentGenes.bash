more /root/resources/hg38_tss.bed|grep -w -f biValent_gene_names.txt |grep -v "\-AS"|grep -v "\-OT" > bivalentTSS.bed

################################################################################################################################
computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K27ac.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27ac.bw \
-R bivalentTSS.bed --referencePoint center \
--sortRegions descend -bs 20 -a 3000 -b 3000 -p max -out H3K27ac_bivalent.mat

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K27me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27me3.bw \
-R bivalentTSS.bed --referencePoint center \
--sortRegions descend -bs 20 -a 3000 -b 3000 -p max -out H3K27me3_bivalent.mat

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K4me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K4me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K4me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K4me3.bw \
-R bivalentTSS.bed --referencePoint center \
--sortRegions descend -bs 20 -a 3000 -b 3000 -p max -out H3K4me3_bivalent.mat

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K9me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K9me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K9me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K9me3.bw \
-R bivalentTSS.bed --referencePoint center \
--sortRegions descend -bs 20 -a 3000 -b 3000 -p max -out H3K9me3_bivalent.mat
################################################################################################################################

plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "TSS" --colorMap Blues \
-m H3K27ac_bivalent \
 --samplesLabel "NHM" "BRAF" "BRAF+CDKN2A" "CDKN2A" \
-out H3K27ac_bivalent.pdf

plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "TSS" --colorMap Oranges \
-m H3K27me3_bivalent.mat \
 --samplesLabel "NHM" "BRAF" "BRAF+CDKN2A" "CDKN2A" \
-out H3K27me3_bivalent.pdf

plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "TSS" --colorMap Greens \
-m H3K4me3_bivalent.mat \
 --samplesLabel "NHM" "BRAF" "BRAF+CDKN2A" "CDKN2A" \
-out H3K4me3_bivalent.pdf

plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "TSS" --colorMap Reds \
-m H3K9me3_bivalent.mat \
 --samplesLabel "NHM" "BRAF" "BRAF+CDKN2A" "CDKN2A" \
-out H3K9me3_bivalent.pdf
################################################################################################





