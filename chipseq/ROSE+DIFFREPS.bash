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
