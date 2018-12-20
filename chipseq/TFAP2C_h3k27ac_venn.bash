bedtools intersect -a BC_VS_NHM_50pro_1000w_DOWN_NHM-Specific_diff_200_fc1.bed -b TFAP2C_A375_DMSO.bed > NHM_TFAP2C.bed
bedtools intersect -a BC_VS_NHM_50pro_1000w_UP_BC-specific_diff_200_fc1.bed -b TFAP2C_A375_DMSO.bed > BC_TFAP2C.bed
###################################
annotatePeaks.pl NHM_TFAP2C.bed hg38 -annStats NHM_TFAP2C.annStats > NHM_TFAP2C.anno &
annotatePeaks.pl BC_TFAP2C.bed hg38 -annStats BC_TFAP2C.annStats > BC_TFAP2C.anno &
