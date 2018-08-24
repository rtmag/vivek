bamToBed -i bam/BRAF_H3K27ac_rmdup.bam > bed/BRAF_H3K27ac.bed &
bamToBed -i bam/CDKN2A+BRAF_H3K27ac_rmdup.bam > bed/CDKN2A+BRAF_H3K27ac.bed &
bamToBed -i bam/CDKN2A_H3K27ac_rmdup.bam > bed/CDKN2A_H3K27ac.bed &
bamToBed -i bam/NHM_H3K27ac_rmdup.bam > bed/NHM_H3K27ac.bed &


diffReps.pl --treatment ./bed/CDKN2A+BRAF_H3K27ac.bed \
--control ./bed/NHM_H3K27ac.bed \
--meth gt --chrlen ~/resources/hg38.chrom.sizes --mode n --report /root/vivek/chip-seq/diffreps/CDKN2A+BRAF_vs_NHM_n --nproc 60 --noanno --nohs

diffReps.pl --treatment ./bed/BRAF_H3K27ac.bed \
--control ./bed/NHM_H3K27ac.bed \
--meth gt --chrlen ~/resources/hg38.chrom.sizes --mode n --report /root/vivek/chip-seq/diffreps/BRAF_vs_NHM_n --nproc 60 --noanno --nohs

diffReps.pl --treatment ./bed/CDKN2A+BRAF_H3K27ac.bed \
--control ./bed/NHM_H3K27ac.bed \
--meth gt --chrlen ~/resources/hg38.chrom.sizes --mode p --report /root/vivek/chip-seq/diffreps/CDKN2A+BRAF_vs_NHM_p --nproc 60 --noanno --nohs

diffReps.pl --treatment ./bed/BRAF_H3K27ac.bed \
--control ./bed/NHM_H3K27ac.bed \
--meth gt --chrlen ~/resources/hg38.chrom.sizes --mode p --report /root/vivek/chip-seq/diffreps/BRAF_vs_NHM_p --nproc 60 --noanno --nohs

##########################################################################
grep "Down" BRAF_vs_NHM_p|bedtools intersect -a /root/vivek/chip-seq/ROSE/heatmap/superEnhancer_merged.bed -b - > BRAF_vs_NHM_p_SE.bed
echo "#NHM-specific" >> BRAF_vs_NHM_p_SE.bed
grep "Up" BRAF_vs_NHM_p|bedtools intersect -a /root/vivek/chip-seq/ROSE/heatmap/superEnhancer_merged.bed -b - >> BRAF_vs_NHM_p_SE.bed
echo "#BRAF-specific" >> BRAF_vs_NHM_p_SE.bed

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K27ac.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27ac.bw \
-R BRAF_vs_NHM_p_SE.bed \
--sortRegions descend -bs 500 -a 10000 -b 10000 -p max -out BRAF_vs_NHM_p_SE.mat --referencePoint center

plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "SE" --colorMap Blues \
-m BRAF_vs_NHM_p_SE.mat \
 --samplesLabel "NHM" "BRAF" "CDKN2A+BRAF" \
-out BRAF_vs_NHM_p_SE.pdf 
###########################################################################
# BRAF_vs_NHM_n
grep "Down" BRAF_vs_NHM_n|bedtools intersect -a /root/vivek/chip-seq/ROSE/heatmap/superEnhancer_merged.bed -b - > BRAF_vs_NHM_n_SE.bed
echo "#NHM-specific" >> BRAF_vs_NHM_n_SE.bed
grep "Up" BRAF_vs_NHM_n|bedtools intersect -a /root/vivek/chip-seq/ROSE/heatmap/superEnhancer_merged.bed -b - >> BRAF_vs_NHM_n_SE.bed
echo "#BRAF-specific" >> BRAF_vs_NHM_n_SE.bed

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K27ac.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27ac.bw \
-R BRAF_vs_NHM_n_SE.bed \
--sortRegions descend -bs 500 -a 10000 -b 10000 -p max -out BRAF_vs_NHM_n_SE.mat --referencePoint center

plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "SE" --colorMap Blues \
-m BRAF_vs_NHM_n_SE.mat \
 --samplesLabel "NHM" "BRAF" "CDKN2A+BRAF" \
-out BRAF_vs_NHM_n_SE.pdf 
##########################################################################
# CDKN2A+BRAF_vs_NHM_n
grep "Down" CDKN2A+BRAF_vs_NHM_n|bedtools intersect -a /root/vivek/chip-seq/ROSE/heatmap/superEnhancer_merged.bed -b - > CDKN2A+BRAF_vs_NHM_n_SE.bed
echo "#NHM-specific" >> CDKN2A+BRAF_vs_NHM_n_SE.bed
grep "Up" CDKN2A+BRAF_vs_NHM_n|bedtools intersect -a /root/vivek/chip-seq/ROSE/heatmap/superEnhancer_merged.bed -b - >> CDKN2A+BRAF_vs_NHM_n_SE.bed
echo "#CDKN2A+BRAF-specific" >> CDKN2A+BRAF_vs_NHM_n_SE.bed

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K27ac.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27ac.bw \
-R CDKN2A+BRAF_vs_NHM_n_SE.bed \
--sortRegions descend -bs 500 -a 10000 -b 10000 -p max -out CDKN2A+BRAF_vs_NHM_n_SE.mat --referencePoint center

plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "SE" --colorMap Blues \
-m CDKN2A+BRAF_vs_NHM_n_SE.mat \
 --samplesLabel "NHM" "BRAF" "CDKN2A+BRAF" \
-out CDKN2A+BRAF_vs_NHM_n_SE.pdf
##########################################################################
# CDKN2A+BRAF_vs_NHM_p
grep "Down" CDKN2A+BRAF_vs_NHM_p|bedtools intersect -a /root/vivek/chip-seq/ROSE/heatmap/superEnhancer_merged.bed -b - > CDKN2A+BRAF_vs_NHM_p_SE.bed
echo "#NHM-specific" >> CDKN2A+BRAF_vs_NHM_p_SE.bed
grep "Up" CDKN2A+BRAF_vs_NHM_p|bedtools intersect -a /root/vivek/chip-seq/ROSE/heatmap/superEnhancer_merged.bed -b - >> CDKN2A+BRAF_vs_NHM_p_SE.bed
echo "#CDKN2A+BRAF-specific" >> CDKN2A+BRAF_vs_NHM_p_SE.bed

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K27ac.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27ac.bw \
-R CDKN2A+BRAF_vs_NHM_p_SE.bed \
--sortRegions descend -bs 500 -a 10000 -b 10000 -p max -out CDKN2A+BRAF_vs_NHM_p_SE.mat --referencePoint center

plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "SE" --colorMap Blues \
-m CDKN2A+BRAF_vs_NHM_p_SE.mat \
 --samplesLabel "NHM" "BRAF" "CDKN2A+BRAF" \
-out CDKN2A+BRAF_vs_NHM_p_SE.pdf

