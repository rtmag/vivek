more BC_VS_BRAF_1pro |grep -v "#"|grep -v "Treatment.cnt"|cut -f1,2,3,11 > BC_VS_BRAF_1pro.bed
more BC_VS_NHM_1pro |grep -v "#"|grep -v "Treatment.cnt"|cut -f1,2,3,11 > BC_VS_NHM_1pro.bed

bedtools intersect -a ../NHM_40/NHM_H3K27ac_40_Gateway_SuperEnhancers.bed -b ../../macs2/NHM_H3K27ac_40_noTSS.bed| \
bedtools intersect -a BC_VS_NHM_1pro.bed  -b -|grep Down > NHM_sp_beta.bed

bedtools intersect -a ../CDKN2A+BRAF_40/CDKN2A+BRAF_H3K27ac_40_Gateway_SuperEnhancers.bed -b ../../macs2/NHM_H3K27ac_40_noTSS.bed| \
bedtools intersect -a BC_VS_NHM_1pro.bed  -b -|grep Down > NHM_sp_beta.bed
