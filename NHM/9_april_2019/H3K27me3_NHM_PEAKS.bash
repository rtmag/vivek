
# H3K27me3 peaks in VE+KO not bivalent
bedtools intersect -a CDKN2A+BRAF_H3K27me3_peaks.broadPeak -b CDKN2A+BRAF_H3K4me3_peaks.broadPeak -v | \
bedtools intersect -a - -b CDKN2A+BRAF_H3K27ac_peaks.broadPeak -v | \
bedtools intersect -a - -b NHM_H3K27ac_peaks.broadPeak -v | \
bedtools intersect -a - -b /root/resources/hg38_tss.bed -wa -wb| \
cut -f10,11,12,13,14,15|sort|uniq  \
> /root/vivek/NHM/joe_costello/VEKO_H3K27me3_notBivalent_notInNHM.bed

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K4me3.bw \
/root/vivek/chip-seq/bw/NHM_H3K27me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K4me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27me3.bw \
-R /root/vivek/NHM/joe_costello/VEKO_H3K27me3_notBivalent_notInNHM.bed --referencePoint center --missingDataAsZero \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out /root/vivek/NHM/joe_costello/VEKO_H3K27me3_notBivalent_notInNHM.mat

plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "TSS" --colorMap Greens Reds Greens Reds \
-m /root/vivek/NHM/joe_costello/VEKO_H3K27me3_notBivalent_notInNHM.mat --zMin 0 0 0 0 0 0 0 0 --zMax 1.7 1.2 1.7 1.2 1.7 1.2 1.7 1.2 \
--samplesLabel "H3K4me3 NHM" "H3K27me3 NHM" "H3K4me3 VEKO" "H3K27me3 VEKO" \
-out /root/vivek/NHM/joe_costello/VEKO_H3K27me3_notBivalent_notInNHM.pdf 
####################################################################
# H3K27me3 peaks in NHM not bivalent
bedtools intersect -a NHM_H3K27me3_peaks.broadPeak -b NHM_H3K4me3_peaks.broadPeak -v | \
bedtools intersect -a - -b NHM_H3K27ac_peaks.broadPeak -v | \
bedtools intersect -a - -b CDKN2A+BRAF_H3K27ac_peaks.broadPeak -v | \
bedtools intersect -a - -b /root/resources/hg38_tss.bed -wa -wb| \
cut -f10,11,12,13,14,15|sort|uniq  \
> /root/vivek/NHM/joe_costello/NHM_H3K27me3_notBivalent_notInVEKO.bed

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K4me3.bw \
/root/vivek/chip-seq/bw/NHM_H3K27me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K4me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27me3.bw \
-R /root/vivek/NHM/joe_costello/NHM_H3K27me3_notBivalent_notInVEKO.bed --referencePoint center --missingDataAsZero \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out /root/vivek/NHM/joe_costello/NHM_H3K27me3_notBivalent_notInVEKO.mat

plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "TSS" --colorMap Greens Reds Greens Reds \
-m /root/vivek/NHM/joe_costello/NHM_H3K27me3_notBivalent_notInVEKO.mat --zMin 0 0 0 0 0 0 0 0 --zMax 1.7 1.2 1.7 1.2 1.7 1.2 1.7 1.2 \
--samplesLabel "H3K4me3 NHM" "H3K27me3 NHM" "H3K4me3 VEKO" "H3K27me3 VEKO" \
-out /root/vivek/NHM/joe_costello/NHM_H3K27me3_notBivalent_notInVEKO.pdf 
####################################################################
