# E3 regions are strong enhancers
grep "E3" BRAF_14_segments.bed > BRAF_E3.bed
grep "E3" NHM_14_segments.bed > NHM_E3.bed
grep "E3" BRAF+CDKN2A_14_segments.bed > BRAF+CDKN2A_E3.bed

# NHM-BRAF common
bedtools intersect -a NHM_E3.bed -b BRAF_E3.bed > NHM_BRAF_E3.bed

# BRAF-BC common
bedtools intersect -a BRAF+CDKN2A_E3.bed -b BRAF_E3.bed > BRAF+BC_E3.bed

# Merge common
cat NHM_BRAF_E3.bed BRAF+BC_E3.bed | sort -k1,1 -k2,2n | bedtools merge -i - > NHM_BRAF_BC_E3_combined.bed

# NHM Only
bedtools intersect -v -a NHM_E3.bed -b NHM_BRAF_BC_E3_combined.bed > NHM_only_E3.bed

# BRAF Only
bedtools intersect -v -a BRAF_E3.bed -b NHM_BRAF_BC_E3_combined.bed > BRAF_only_E3.bed

# BC Only
bedtools intersect -v -a BRAF+CDKN2A_E3.bed -b NHM_BRAF_BC_E3_combined.bed > CD_only_E3.bed
#########################################################################################################################
#########################################################################################################################
cat NHM_only_E3.bed > ENHANCER_STRONG.bed
echo "#NHM only" >> ENHANCER_STRONG.bed
cat NHM_BRAF_E3.bed >> ENHANCER_STRONG.bed
echo "#NHM-BRAF" >> ENHANCER_STRONG.bed
cat BRAF_only_E3.bed >> ENHANCER_STRONG.bed
echo "#BRAF only" >> ENHANCER_STRONG.bed
cat BRAF+BC_E3.bed >> ENHANCER_STRONG.bed
echo "#BRAF-BC" >> ENHANCER_STRONG.bed
cat CD_only_E3.bed >> ENHANCER_STRONG.bed
echo "#CD only" >> ENHANCER_STRONG.bed
#
computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K27ac.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27ac.bw \
-R ENHANCER_STRONG.bed --referencePoint center \
--sortRegions descend -bs 20 -a 3000 -b 3000 -p max -out ENHANCER_STRONG.mat

plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "Enhancer" --colorMap Blues \
-m ENHANCER_STRONG.mat \
 --samplesLabel "NHM" "BRAF" "CDKN2A" "CDKN2A+BRAF" \
-out ENHANCER_STRONG.pdf
#########################################################################################################################
cat NHM_only_E3.bed > ENHANCER_STRONG_only.bed
echo "#NHM only" >> ENHANCER_STRONG_only.bed
cat BRAF_only_E3.bed >> ENHANCER_STRONG_only.bed
echo "#BRAF only" >> ENHANCER_STRONG_only.bed
cat CD_only_E3.bed >> ENHANCER_STRONG_only.bed
echo "#CD only" >> ENHANCER_STRONG_only.bed
#
computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K27ac.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27ac.bw \
-R ENHANCER_STRONG_only.bed --referencePoint center \
--sortRegions descend -bs 20 -a 3000 -b 3000 -p max -out ENHANCER_STRONG_only.mat

plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "Enhancer" --colorMap Blues \
-m ENHANCER_STRONG_only.mat \
 --samplesLabel "NHM" "BRAF" "CDKN2A" "CDKN2A+BRAF" \
-out ENHANCER_STRONG_only.pdf
#########################################################################################################################
cat NHM_signal_filtered.bed > ENHANCER_Signal_only.bed
echo "#NHM" >> ENHANCER_Signal_only.bed
cat BRAF_signal_filtered.bed >> ENHANCER_Signal_only.bed
echo "#BRAF" >> ENHANCER_Signal_only.bed
cat CDKN2A_signal_filtered.bed >> ENHANCER_Signal_only.bed
echo "#CDKN2A" >> ENHANCER_Signal_only.bed
cat CB_signal_filtered.bed >> ENHANCER_Signal_only.bed
echo "#CB" >> ENHANCER_Signal_only.bed
#
computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K27ac.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27ac.bw \
-R ENHANCER_Signal_only.bed --referencePoint center \
--sortRegions descend -bs 20 -a 10000 -b 10000 -p max -out ENHANCER_Signal_only.mat

plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "Enhancer" --colorMap Blues \
-m ENHANCER_Signal_only.mat --whatToShow "heatmap and colorbar" --zMax 1.7 --zMin .25 \
 --samplesLabel "NHM" "BRAF" "CDKN2A" "CDKN2A+BRAF" \
-out ENHANCER_Signal_only.pdf
