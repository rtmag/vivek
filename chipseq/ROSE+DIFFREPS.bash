more BC_VS_BRAF_1pro |grep -v "#"|grep -v "Treatment.cnt"|cut -f1,2,3,11 > BC_VS_BRAF_1pro.bed
more BC_VS_NHM_1pro |grep -v "#"|grep -v "Treatment.cnt"|cut -f1,2,3,11 > BC_VS_NHM_1pro.bed

grep "Down" BC_VS_NHM_1pro.bed > BC_VS_NHM_1pro_down.bed
grep "Up" BC_VS_NHM_1pro.bed > BC_VS_NHM_1pro_up.bed


bedtools intersect -b /root/vivek/chip-seq/ROSE/NHM_40/NHM_H3K27ac_40_Gateway_SuperEnhancers.bed \
-a /root/vivek/chip-seq/macs2/NHM_H3K27ac_40_noTSS.bed| \
bedtools intersect -b BC_VS_NHM_1pro_down.bed  -a - > NHM_sp_beta.bed

bedtools intersect -b /root/vivek/chip-seq/ROSE/CDKN2A+BRAF_40/CDKN2A+BRAF_H3K27ac_40_Gateway_SuperEnhancers.bed \
-a /root/vivek/chip-seq/macs2/NHM_H3K27ac_40_noTSS.bed| \
bedtools intersect -b BC_VS_NHM_1pro_up.bed  -a - > BC_sp_beta.bed

########

bedtools intersect -b /root/vivek/chip-seq/ROSE/NHM_40/NHM_H3K27ac_40_Gateway_SuperEnhancers.bed \
-a /root/vivek/chip-seq/macs2/NHM_H3K27ac_40_noTSS.bed > NHM_sp_beta.bed

bedtools intersect -b /root/vivek/chip-seq/ROSE/CDKN2A+BRAF_40/CDKN2A+BRAF_H3K27ac_40_Gateway_SuperEnhancers.bed \
-a /root/vivek/chip-seq/macs2/NHM_H3K27ac_40_noTSS.bed > BC_sp_beta.bed

cat NHM_sp_beta.bed BC_sp_beta.bed | sort -k1,1 -k2,2n| bedtools merge -i - > NHM_BC_sp.bed
################################################################################################################
################################################################################################################
################################################################################################################
################################################################################################################

grep "Down" BC_VS_BRAF_50pro_700w|awk -F"\t" '{if($14<0.05){if($7>50 || $8>50){print $0 }} }'|bedtools intersect \
-a /root/vivek/chip-seq/macs2/CDKN2A+BRAF_H3K27ac_40.bed -b - |cut -f1,2,3 > BC_VS_BRAF_50pro_700w_DOWN.bed
grep "Up" BC_VS_BRAF_50pro_700w|awk -F"\t" '{if($14<0.05){if($7>50 || $8>50){print $0 }} }'|bedtools intersect \
-a /root/vivek/chip-seq/macs2/BRAF_H3K27ac_40.bed -b - |cut -f1,2,3 > BC_VS_BRAF_50pro_700w_UP.bed

grep "Down" BC_VS_NHM_50pro_700w |awk -F"\t" '{if($14<0.05){if($7>50 || $8>50){print $0 }} }'|bedtools intersect \
-a /root/vivek/chip-seq/macs2/CDKN2A+BRAF_H3K27ac_40.bed -b - |cut -f1,2,3 > BC_VS_NHM_50pro_700w_DOWN.bed
grep "Up" BC_VS_NHM_50pro_700w |awk -F"\t" '{if($14<0.05){if($7>50 || $8>50){print $0 }} }'|bedtools intersect \
-a /root/vivek/chip-seq/macs2/NHM_H3K27ac_40.bed -b - |cut -f1,2,3 > BC_VS_NHM_50pro_700w_UP.bed
###

grep "Down" BC_VS_BRAF_50pro_700w|awk -F"\t" '{if($14<0.05){if($7>50 || $8>50){print $0 }} }'|bedtools intersect \
-a /root/vivek/chip-seq/macs2/CDKN2A+BRAF_H3K27ac_peaks.broadPeak -b - |cut -f1,2,3 > BC_VS_BRAF_50pro_700w_DOWN_broad.bed
grep "Up" BC_VS_BRAF_50pro_700w|awk -F"\t" '{if($14<0.05){if($7>50 || $8>50){print $0 }} }'|bedtools intersect \
-a /root/vivek/chip-seq/macs2/BRAF_H3K27ac_peaks.broadPeak -b - |cut -f1,2,3 > BC_VS_BRAF_50pro_700w_UP_broad.bed

grep "Down" BC_VS_NHM_50pro_700w |awk -F"\t" '{if($14<0.05){if($7>50 || $8>50){print $0 }} }'|bedtools intersect \
-a /root/vivek/chip-seq/macs2/CDKN2A+BRAF_H3K27ac_peaks.broadPeak -b - |cut -f1,2,3 > BC_VS_NHM_50pro_700w_DOWN_broad.bed
grep "Up" BC_VS_NHM_50pro_700w |awk -F"\t" '{if($14<0.05){if($7>50 || $8>50){print $0 }} }'|bedtools intersect \
-a /root/vivek/chip-seq/macs2/NHM_H3K27ac_peaks.broadPeak -b - |cut -f1,2,3 > BC_VS_NHM_50pro_700w_UP_broad.bed
################################################################################################################
################################################################################################################
################################################################################################################
################################################################################################################

grep "Down" BC_VS_BRAF_50pro_700w|awk -F"\t" '{if($14<0.05){if($7>50 || $8>50){ if(sqrt($12^2)>1){print $0} }} }'|bedtools intersect \
-b /root/vivek/chip-seq/macs2/CDKN2A+BRAF_H3K27ac_peaks.broadPeak -a - |cut -f1,2,3 > BC_VS_BRAF_50pro_700w_DOWN_diff.bed
grep "Up" BC_VS_BRAF_50pro_700w|awk -F"\t" '{if($14<0.05){if($7>50 || $8>50){ if(sqrt($12^2)>1){print $0} }} }'|bedtools intersect \
-b /root/vivek/chip-seq/macs2/BRAF_H3K27ac_peaks.broadPeak -a - |cut -f1,2,3 > BC_VS_BRAF_50pro_700w_UP_diff.bed

grep "Down" BC_VS_NHM_50pro_700w |awk -F"\t" '{if($14<0.05){if($7>50 || $8>50){ if(sqrt($12^2)>1){print $0} }} }'|bedtools intersect \
-b /root/vivek/chip-seq/macs2/CDKN2A+BRAF_H3K27ac_peaks.broadPeak -a - |cut -f1,2,3 > BC_VS_NHM_50pro_700w_DOWN_diff.bed
grep "Up" BC_VS_NHM_50pro_700w |awk -F"\t" '{if($14<0.05){if($7>50 || $8>50){ if(sqrt($12^2)>1){print $0} }} }'|bedtools intersect \
-b /root/vivek/chip-seq/macs2/NHM_H3K27ac_peaks.broadPeak -a - |cut -f1,2,3 > BC_VS_NHM_50pro_700w_UP_diff.bed
################################################################################################################
################################################################################################################
################################################################################################################
################################################################################################################

grep "Down" BC_VS_NHM_50pro_1000w |awk -F"\t" '{if($14<0.05){if($7>500 || $8>500){ if(sqrt($12^2)>1){print $0} }} }'|cut -f1,2,3 > BC_VS_NHM_50pro_1000w_DOWN_diff_500_fc1.bed
grep "Up" BC_VS_NHM_50pro_1000w |awk -F"\t" '{if($14<0.05){if($7>500 || $8>500){ if(sqrt($12^2)>1){print $0} }} }'|cut -f1,2,3 > BC_VS_NHM_50pro_1000w_UP_diff_500_fc1.bed

grep "Down" BC_VS_NHM_50pro_1000w |awk -F"\t" '{if($14<0.05){if($7>500 || $8>500){ if(sqrt($12^2)>1.5){print $0} }} }'|cut -f1,2,3 > BC_VS_NHM_50pro_1000w_DOWN_diff_500.bed
grep "Up" BC_VS_NHM_50pro_1000w |awk -F"\t" '{if($14<0.05){if($7>500 || $8>500){ if(sqrt($12^2)>1.5){print $0} }} }'|cut -f1,2,3 > BC_VS_NHM_50pro_1000w_UP_diff_500.bed

grep "Down" BC_VS_NHM_50pro_1000w |awk -F"\t" '{if($14<0.05){if($7>300 || $8>300){ if(sqrt($12^2)>1.5){print $0} }} }'|cut -f1,2,3 > BC_VS_NHM_50pro_1000w_DOWN_diff_300.bed
grep "Up" BC_VS_NHM_50pro_1000w |awk -F"\t" '{if($14<0.05){if($7>300 || $8>300){ if(sqrt($12^2)>1.5){print $0} }} }'|cut -f1,2,3 > BC_VS_NHM_50pro_1000w_UP_diff_300.bed

grep "Down" BC_VS_NHM_50pro_1000w |awk -F"\t" '{if($14<0.05){if($7>300 || $8>300){ if(sqrt($12^2)>1){print $0} }} }'|cut -f1,2,3 > BC_VS_NHM_50pro_1000w_DOWN_diff_300_fc1.bed
grep "Up" BC_VS_NHM_50pro_1000w |awk -F"\t" '{if($14<0.05){if($7>300 || $8>300){ if(sqrt($12^2)>1){print $0} }} }'|cut -f1,2,3 > BC_VS_NHM_50pro_1000w_UP_diff_300_fc1.bed

grep "Down" BC_VS_NHM_50pro_1000w |awk -F"\t" '{if($14<0.05){if($7>200 || $8>200){ if(sqrt($12^2)>1){print $0} }} }'|cut -f1,2,3 > BC_VS_NHM_50pro_1000w_DOWN_diff_200_fc1.bed
grep "Up" BC_VS_NHM_50pro_1000w |awk -F"\t" '{if($14<0.05){if($7>200 || $8>200){ if(sqrt($12^2)>1){print $0} }} }'|cut -f1,2,3 > BC_VS_NHM_50pro_1000w_UP_diff_200_fc1.bed

##########################################################################
cat BC_VS_NHM_50pro_1000w_DOWN_diff_500.bed > BRAF_vs_NHM_DIFF_h3k27ac.bed
echo "#NHM-specific" >> BRAF_vs_NHM_DIFF_h3k27ac.bed
cat BC_VS_NHM_50pro_1000w_UP_diff_300.bed >> BRAF_vs_NHM_DIFF_h3k27ac.bed
echo "#CDKN2A+BRAF-specific" >> BRAF_vs_NHM_DIFF_h3k27ac.bed

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27ac.bw \
-R BRAF_vs_NHM_DIFF_h3k27ac.bed \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out BRAF_vs_NHM_DIFF_h3k27ac.mat --referencePoint center

plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "H3K27ac" --colorMap Blues \
-m BRAF_vs_NHM_DIFF_h3k27ac.mat \
 --samplesLabel "NHM" "CDKN2A+BRAF" \
-out BRAF_vs_NHM_DIFF_h3k27ac.pdf 
######
cat BC_VS_NHM_50pro_1000w_DOWN_diff_500_fc1.bed > BRAF_vs_NHM_DIFF_h3k27ac_fc1.bed
echo "#NHM-specific" >> BRAF_vs_NHM_DIFF_h3k27ac_fc1.bed
cat BC_VS_NHM_50pro_1000w_UP_diff_300.bed >> BRAF_vs_NHM_DIFF_h3k27ac_fc1.bed
echo "#CDKN2A+BRAF-specific" >> BRAF_vs_NHM_DIFF_h3k27ac_fc1.bed

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27ac.bw \
-R BRAF_vs_NHM_DIFF_h3k27ac_fc1.bed \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out BRAF_vs_NHM_DIFF_h3k27ac_fc1.mat --referencePoint center

plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "H3K27ac" --colorMap Blues \
-m BRAF_vs_NHM_DIFF_h3k27ac_fc1.mat \
 --samplesLabel "NHM" "CDKN2A+BRAF" \
-out BRAF_vs_NHM_DIFF_h3k27ac_fc1.pdf 

######
cat BC_VS_NHM_50pro_1000w_DOWN_diff_200_fc1.bed > BRAF_vs_NHM_DIFF_h3k27ac_200_fc1.bed
echo "#NHM-specific" >> BRAF_vs_NHM_DIFF_h3k27ac_200_fc1.bed
cat BC_VS_NHM_50pro_1000w_UP_diff_200_fc1.bed >> BRAF_vs_NHM_DIFF_h3k27ac_200_fc1.bed
echo "#CDKN2A+BRAF-specific" >> BRAF_vs_NHM_DIFF_h3k27ac_200_fc1.bed

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27ac.bw \
-R BRAF_vs_NHM_DIFF_h3k27ac_200_fc1.bed \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out BRAF_vs_NHM_DIFF_h3k27ac_200_fc1.mat --referencePoint center

plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "H3K27ac" --colorMap Blues \
-m BRAF_vs_NHM_DIFF_h3k27ac_200_fc1.mat \
 --samplesLabel "NHM" "CDKN2A+BRAF" \
-out BRAF_vs_NHM_DIFF_h3k27ac_200_fc1.pdf 
