bamToBed -i bam/BRAF_H3K27ac_rmdup.bam > bed/BRAF_H3K27ac.bed &
bamToBed -i bam/CDKN2A+BRAF_H3K27ac_rmdup.bam > bed/CDKN2A+BRAF_H3K27ac.bed &
bamToBed -i bam/CDKN2A_H3K27ac_rmdup.bam > bed/CDKN2A_H3K27ac.bed &
bamToBed -i bam/NHM_H3K27ac_rmdup.bam > bed/NHM_H3K27ac.bed &
bamToBed -i bam/NHM_input_rmdup.bam > bed/NHM_input.bed &
bamToBed -i bam/CDKN2A+BRAF_input_rmdup.bam > bed/CDKN2A+BRAF_input.bed &

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

diffReps.pl --treatment ./bed/CDKN2A+BRAF_H3K27ac.bed \
--control ./bed/BRAF_H3K27ac.bed \
--meth gt --chrlen ~/resources/hg38.chrom.sizes --mode p --report /root/vivek/chip-seq/diffreps/CDKN2A+BRAF_vs_BRAF_p --nproc 60 --noanno --nohs

diffReps.pl --treatment /root/vivek/chip-seq/bed/CDKN2A+BRAF_H3K27ac.bed \
--control /root/vivek/chip-seq/bed/NHM_H3K27ac.bed --window 100 \
--btr /root/vivek/chip-seq/bed/CDKN2A+BRAF_input.bed \
--bco /root/vivek/chip-seq/bed/NHM_input.bed \
--meth gt --chrlen ~/resources/hg38.chrom.sizes --mode s --report /root/vivek/chip-seq/diffreps/BC_VS_NHM --nproc 60 --noanno --nohs

diffReps.pl --treatment /root/vivek/chip-seq/bed/CDKN2A+BRAF_H3K27ac.bed \
--control /root/vivek/chip-seq/bed/NHM_H3K27ac.bed --window 100 \
--btr /root/vivek/chip-seq/bed/CDKN2A+BRAF_input.bed \
--bco /root/vivek/chip-seq/bed/NHM_input.bed \
--meth gt --chrlen ~/resources/hg38.chrom.sizes --mode s --report /root/vivek/chip-seq/diffreps/BC_VS_NHM_1pro --noanno --nohs

diffReps.pl --treatment /root/vivek/chip-seq/bed/CDKN2A+BRAF_H3K27ac.bed \
--control /root/vivek/chip-seq/bed/BRAF_H3K27ac.bed --window 100 \
--btr /root/vivek/chip-seq/bed/CDKN2A+BRAF_input.bed \
--bco /root/vivek/chip-seq/bed/CDKN2A+BRAF_input.bed \
--meth gt --chrlen ~/resources/hg38.chrom.sizes --mode s --report /root/vivek/chip-seq/diffreps/BC_VS_BRAF_1pro --noanno --nohs
##########################################################################
more *_p|grep -P "Up|Down"|cut -f1-3|bedtools intersect -b /root/vivek/chip-seq/ROSE/heatmap/superEnhancer_merged.bed -a -|cut -f1-3 > diffreps_SE.bed

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K27ac.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27ac.bw \
-R diffreps_SE.bed \
--sortRegions descend -bs 500 -a 10000 -b 10000 -p max -out diffreps_SE.mat --referencePoint center

plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "SE" --colorMap Blues \
-m diffreps_SE.mat --kmeans 4 \
 --samplesLabel "NHM" "BRAF" "CDKN2A+BRAF" \
-out diffreps_SE.pdf 

##########################################################################
grep "Down" BRAF_vs_NHM_p|bedtools intersect -b /root/vivek/chip-seq/ROSE/heatmap/superEnhancer_merged.bed -a -|cut -f1-3 > BRAF_vs_NHM_p_SE.bed
echo "#NHM-specific" >> BRAF_vs_NHM_p_SE.bed
grep "Up" BRAF_vs_NHM_p|bedtools intersect -b /root/vivek/chip-seq/ROSE/heatmap/superEnhancer_merged.bed -a -|cut -f1-3 >> BRAF_vs_NHM_p_SE.bed
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
##########################################################################
# CDKN2A+BRAF_vs_NHM_p
grep "Down" CDKN2A+BRAF_vs_NHM_p|bedtools intersect -b /root/vivek/chip-seq/ROSE/heatmap/superEnhancer_merged.bed -a -|cut -f1-3 > CDKN2A+BRAF_vs_NHM_p_SE.bed
echo "#NHM-specific" >> CDKN2A+BRAF_vs_NHM_p_SE.bed
grep "Up" CDKN2A+BRAF_vs_NHM_p|bedtools intersect -b /root/vivek/chip-seq/ROSE/heatmap/superEnhancer_merged.bed -a -|cut -f1-3 >> CDKN2A+BRAF_vs_NHM_p_SE.bed
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

##############
# CDKN2A+BRAF VS BRAF
# CDKN2A+BRAF_vs_NHM_p
grep "Down" CDKN2A+BRAF_vs_BRAF_p|bedtools intersect -b /root/vivek/chip-seq/ROSE/heatmap/superEnhancer_merged.bed -a -|cut -f1-3 > CDKN2A+BRAF_vs_BRAF_p_SE.bed
echo "#NHM-specific" >> CDKN2A+BRAF_vs_BRAF_p_SE.bed
grep "Up" CDKN2A+BRAF_vs_BRAF_p|bedtools intersect -b /root/vivek/chip-seq/ROSE/heatmap/superEnhancer_merged.bed -a -|cut -f1-3 >> CDKN2A+BRAF_vs_BRAF_p_SE.bed
echo "#CDKN2A+BRAF-specific" >> CDKN2A+BRAF_vs_BRAF_p_SE.bed

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K27ac.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27ac.bw \
-R CDKN2A+BRAF_vs_BRAF_p_SE.bed \
--sortRegions descend -bs 500 -a 10000 -b 10000 -p max -out CDKN2A+BRAF_vs_BRAF_p_SE.mat --referencePoint center

plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "SE" --colorMap Blues \
-m CDKN2A+BRAF_vs_BRAF_p_SE.mat \
 --samplesLabel "NHM" "BRAF" "CDKN2A+BRAF" \
-out CDKN2A+BRAF_vs_BRAF_p_SE.pdf



###########################################################################
# BRAF_vs_NHM_n
grep "Down" BRAF_vs_NHM_n|bedtools intersect -b /root/vivek/chip-seq/ROSE/heatmap/superEnhancer_merged.bed -a -|cut -f1-3 > BRAF_vs_NHM_n_SE.bed
echo "#NHM-specific" >> BRAF_vs_NHM_n_SE.bed
grep "Up" BRAF_vs_NHM_n|bedtools intersect -b /root/vivek/chip-seq/ROSE/heatmap/superEnhancer_merged.bed -a -|cut -f1-3 >> BRAF_vs_NHM_n_SE.bed
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
grep "Down" CDKN2A+BRAF_vs_NHM_n|bedtools intersect -b /root/vivek/chip-seq/ROSE/heatmap/superEnhancer_merged.bed -a -|cut -f1-3 > CDKN2A+BRAF_vs_NHM_n_SE.bed
echo "#NHM-specific" >> CDKN2A+BRAF_vs_NHM_n_SE.bed
grep "Up" CDKN2A+BRAF_vs_NHM_n|bedtools intersect -b /root/vivek/chip-seq/ROSE/heatmap/superEnhancer_merged.bed -a -|cut -f1-3 >> CDKN2A+BRAF_vs_NHM_n_SE.bed
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

####
grep "Down" CDKN2A+BRAF_vs_NHM_p|bedtools intersect -b /root/vivek/chip-seq/ROSE/heatmap/superEnhancer_merged.bed -a -|cut -f1-3 > CDKN2A+BRAF_vs_NHM_p_SE.bed
echo "#NHM-specific" >> CDKN2A+BRAF_vs_NHM_p_SE.bed
grep "Up" CDKN2A+BRAF_vs_NHM_p|bedtools intersect -b /root/vivek/chip-seq/ROSE/heatmap/superEnhancer_merged.bed -a -|cut -f1-3 >> CDKN2A+BRAF_vs_NHM_p_SE.bed
echo "#CDKN2A+BRAF-specific" >> CDKN2A+BRAF_vs_NHM_p_SE.bed

grep "Down" CDKN2A+BRAF_vs_NHM_p|cut -f1-3|annotatePeaks.pl - hg38 -annStats CDKN2A+BRAF_vs_NHM.annStats > CDKN2A+BRAF_vs_NHM.anno
grep "Up" CDKN2A+BRAF_vs_NHM_p|cut -f1-3|annotatePeaks.pl - hg38 -annStats CDKN2A+BRAF_vs_NHM_up.annStats > CDKN2A+BRAF_vs_NHM_up.anno

####################################
cat *_p|grep -v "#"|grep -v "Treatment.avg"|cut -f1,2,3|sort -k1,1 -k2,2n|bedtools merge -i - | \
bedtools intersect -b /root/vivek/chip-seq/ROSE/heatmap/superEnhancer_merged.bed -a - > diffreps_superEnhancer_merge.bed


computeMatrix scale-regions \
-S /root/vivek/chip-seq/bw/NHM_H3K27ac.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27ac.bw \
-R /root/vivek/chip-seq/diffreps/diffreps_superEnhancer_merge.bed --averageTypeBins sum \
--sortRegions keep -bs 1 -m 1 -p max -out m15_4kb_aroundTSS.mat --outFileNameMatrix diffreps_superEnhancer_merge_signal.txt
#####################

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K27ac.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27ac.bw \
-R ct_diffreps_superEnhancer_merge_signal.bed \
--sortRegions descend -bs 500 -a 10000 -b 10000 -p max -out ct_diffreps_superEnhancer_merge_signal.mat --referencePoint center

plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "SE" --colorMap Blues \
-m ct_diffreps_superEnhancer_merge_signal.mat \
 --samplesLabel "NHM" "BRAF" "CDKN2A" "CDKN2A+BRAF" \
-out ct_diffreps_superEnhancer_merge_signal.pdf
#####################

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K27ac.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27ac.bw \
-R ct5_diffreps_superEnhancer_merge_signal.bed \
--sortRegions descend -bs 500 -a 10000 -b 10000 -p max -out ct5_diffreps_superEnhancer_merge_signal.mat --referencePoint center

plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "SE" --colorMap Blues \
-m ct5_diffreps_superEnhancer_merge_signal.mat \
 --samplesLabel "NHM" "BRAF" "CDKN2A" "CDKN2A+BRAF" \
-out ct5_diffreps_superEnhancer_merge_signal.pdf
##
#
annotatePeaks.pl c1_ct5_diffreps_superEnhancer_merge_signal.bed hg38 -annStats c1_ct5_diff_se.annStats > c1_ct5_diff_se.anno &
annotatePeaks.pl c2_ct5_diffreps_superEnhancer_merge_signal.bed hg38 -annStats c2_ct5_diff_se.annStats > c2_ct5_diff_se.anno &
annotatePeaks.pl c3_ct5_diffreps_superEnhancer_merge_signal.bed hg38 -annStats c3_ct5_diff_se.annStats > c3_ct5_diff_se.anno &
annotatePeaks.pl c4_ct5_diffreps_superEnhancer_merge_signal.bed hg38 -annStats c4_ct5_diff_se.annStats > c4_ct5_diff_se.anno &
annotatePeaks.pl c5_ct5_diffreps_superEnhancer_merge_signal.bed hg38 -annStats c5_ct5_diff_se.annStats > c5_ct5_diff_se.anno &
