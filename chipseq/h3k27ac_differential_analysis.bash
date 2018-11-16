############################################################################################################################
#N - BC
diffReps.pl --treatment /root/vivek/chip-seq/bed/CDKN2A+BRAF_H3K27ac.bed \
--control /root/vivek/chip-seq/bed/NHM_H3K27ac.bed --window 1000 --nproc 1 \
--meth gt --chrlen ~/resources/hg38.chrom.sizes --mode s --report /root/vivek/chip-seq/h3k27ac_diff/BC_VS_N_50pro_1000w --noanno --nohs &

#N - B
diffReps.pl --treatment /root/vivek/chip-seq/bed/BRAF_H3K27ac.bed \
--control /root/vivek/chip-seq/bed/NHM_H3K27ac.bed --window 1000 --nproc 1 \
--meth gt --chrlen ~/resources/hg38.chrom.sizes --mode s --report /root/vivek/chip-seq/h3k27ac_diff/B_VS_N_50pro_1000w --noanno --nohs &

#N - C
diffReps.pl --treatment /root/vivek/chip-seq/bed/CDKN2A_H3K27ac.bed \
--control /root/vivek/chip-seq/bed/NHM_H3K27ac.bed --window 1000 --nproc 1 \
--meth gt --chrlen ~/resources/hg38.chrom.sizes --mode s --report /root/vivek/chip-seq/h3k27ac_diff/C_VS_N_50pro_1000w --noanno --nohs &

#BC - B
diffReps.pl --treatment /root/vivek/chip-seq/bed/CDKN2A+BRAF_H3K27ac.bed \
--control /root/vivek/chip-seq/bed/BRAF_H3K27ac.bed --window 1000 --nproc 1 \
--meth gt --chrlen ~/resources/hg38.chrom.sizes --mode s --report /root/vivek/chip-seq/h3k27ac_diff/BC_VS_B_50pro_1000w --noanno --nohs &

#BC - C
diffReps.pl --treatment /root/vivek/chip-seq/bed/CDKN2A+BRAF_H3K27ac.bed \
--control /root/vivek/chip-seq/bed/CDKN2A_H3K27ac.bed --window 1000 --nproc 1 \
--meth gt --chrlen ~/resources/hg38.chrom.sizes --mode s --report /root/vivek/chip-seq/h3k27ac_diff/BC_VS_C_50pro_1000w --noanno --nohs &

#B - C
diffReps.pl --treatment /root/vivek/chip-seq/bed/BRAF_H3K27ac.bed \
--control /root/vivek/chip-seq/bed/CDKN2A_H3K27ac.bed --window 1000 --nproc 1 \
--meth gt --chrlen ~/resources/hg38.chrom.sizes --mode s --report /root/vivek/chip-seq/h3k27ac_diff/B_VS_C_50pro_1000w --noanno --nohs &

############################################################################################################################
# BC v N
grep "Down" BC_VS_N_50pro_1000w |awk -F"\t" '{if($14<0.05){if($7>200 || $8>200){ if(sqrt($12^2)>1){print $0} }} }'|cut -f1,2,3 > BC_VS_NHM_50pro_1000w_DOWN_diff_200_fc1.bed
grep "Up" BC_VS_N_50pro_1000w |awk -F"\t" '{if($14<0.05){if($7>200 || $8>200){ if(sqrt($12^2)>1){print $0} }} }'|cut -f1,2,3 > BC_VS_NHM_50pro_1000w_UP_diff_200_fc1.bed

cat BC_VS_NHM_50pro_1000w_DOWN_diff_200_fc1.bed > CDKN2A+BRAF_vs_NHM_H3K27ac.bed
echo "#NHM-specific" >> CDKN2A+BRAF_vs_NHM_H3K27ac.bed
cat BC_VS_NHM_50pro_1000w_UP_diff_200_fc1.bed >> CDKN2A+BRAF_vs_NHM_H3K27ac.bed
echo "#CDKN2A+BRAF-specific" >> CDKN2A+BRAF_vs_NHM_H3K27ac.bed
#H3K27ac
computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K27ac.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27ac.bw \
-R CDKN2A+BRAF_vs_NHM_H3K27ac.bed \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out CDKN2A+BRAF_vs_NHM_H3K27ac.mat --referencePoint center

plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "H3K27ac" --colorMap Blues \
-m CDKN2A+BRAF_vs_NHM_H3K27ac.mat \
 --samplesLabel "NHM" "BRAF" "CDKN2A" "CDKN2A+BRAF" \
-out CDKN2A+BRAF_vs_NHM_H3K27ac.pdf 
#H3K4me3
computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K4me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K4me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K4me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K4me3.bw \
-R CDKN2A+BRAF_vs_NHM_H3K27ac.bed \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out CDKN2A+BRAF_vs_NHM_H3K4me3.mat --referencePoint center

plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "H3K27ac" --colorMap Greens \
-m CDKN2A+BRAF_vs_NHM_H3K4me3.mat \
 --samplesLabel "NHM" "BRAF" "CDKN2A" "CDKN2A+BRAF" \
-out CDKN2A+BRAF_vs_NHM_H3K4me3.pdf 
#H3K9me3
computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K9me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K9me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K9me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K9me3.bw \
-R CDKN2A+BRAF_vs_NHM_H3K27ac.bed \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out CDKN2A+BRAF_vs_NHM_H3K9me3.mat --referencePoint center

plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "H3K27ac" --colorMap Reds \
-m CDKN2A+BRAF_vs_NHM_H3K9me3.mat \
 --samplesLabel "NHM" "BRAF" "CDKN2A" "CDKN2A+BRAF" \
-out CDKN2A+BRAF_vs_NHM_H3K9me3.pdf 
#H3K27me3
computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K27me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27me3.bw \
-R CDKN2A+BRAF_vs_NHM_H3K27ac.bed \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out CDKN2A+BRAF_vs_NHM_H3K27me3.mat --referencePoint center

plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "H3K27ac" --colorMap Reds \
-m CDKN2A+BRAF_vs_NHM_H3K27me3.mat \
 --samplesLabel "NHM" "BRAF" "CDKN2A" "CDKN2A+BRAF" \
-out CDKN2A+BRAF_vs_NHM_H3K27me3.pdf 
############################################################################################################################
# B v N

