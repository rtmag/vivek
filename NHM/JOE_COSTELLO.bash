# h1 hg38 chromhmm data downloaded from https://egg2.wustl.edu/roadmap/web_portal/chr_state_learning.html#core_15state
more E003_18_core_K27ac_hg38lift_dense.bed|grep "14_TssBiv" > H1_heSC_poised_TSS.bed


computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K4me3.bw \
/root/vivek/chip-seq/bw/NHM_H3K27me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K4me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K4me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K4me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27me3.bw \
-R H1_heSC_poised_TSS.bed --referencePoint center \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out H1_heSC_poised_TSS.mat

plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "H1-PoisedTSS" --colorMap Greens Reds Greens Reds Greens Reds Greens Reds \
-m H1_heSC_poised_TSS.mat --zMin 0 0 0 0 0 0 0 0 --zMax 1.7 1.2 1.7 1.2 1.7 1.2 1.7 1.2 \
--samplesLabel "H3K4me3 NHM" "H3K27me3 NHM" "H3K4me3 NB" "H3K27me3 NB" "H3K4me3 NC" "H3K27me3 NC" "H3K4me3 NBC" "H3K27me3 NBC" \
-out H1_poised_TSS.pdf 
