############################################################################################################################
bamToBed -i bam/BRAF_H3K9me3_rmdup.bam > bed/BRAF_H3K9me3.bed &
bamToBed -i bam/CDKN2A+BRAF_H3K9me3_rmdup.bam > bed/CDKN2A+BRAF_H3K9me3.bed &
bamToBed -i bam/CDKN2A_H3K9me3_rmdup.bam > bed/CDKN2A_H3K9me3.bed &
bamToBed -i bam/NHM_H3K9me3_rmdup.bam > bed/NHM_H3K9me3.bed &
############################################################################################################################
#BC - N
diffReps.pl --treatment /root/vivek/chip-seq/bed/CDKN2A+BRAF_H3K9me3.bed \
--control /root/vivek/chip-seq/bed/NHM_H3K9me3.bed --window 1000 --nproc 1 \
--meth gt --chrlen ~/resources/hg38.chrom.sizes --mode s --report /root/vivek/chip-seq/H3K9me3_diff/BC_VS_N_H3K9me3_50pro_1000w --noanno --nohs &

#B - N
diffReps.pl --treatment /root/vivek/chip-seq/bed/BRAF_H3K9me3.bed \
--control /root/vivek/chip-seq/bed/NHM_H3K9me3.bed --window 1000 --nproc 1 \
--meth gt --chrlen ~/resources/hg38.chrom.sizes --mode s --report /root/vivek/chip-seq/H3K9me3_diff/B_VS_N_H3K9me3_50pro_1000w --noanno --nohs &

#C - N
diffReps.pl --treatment /root/vivek/chip-seq/bed/CDKN2A_H3K9me3.bed \
--control /root/vivek/chip-seq/bed/NHM_H3K9me3.bed --window 1000 --nproc 1 \
--meth gt --chrlen ~/resources/hg38.chrom.sizes --mode s --report /root/vivek/chip-seq/H3K9me3_diff/C_VS_N_H3K9me3_50pro_1000w --noanno --nohs &

#BC - B
diffReps.pl --treatment /root/vivek/chip-seq/bed/CDKN2A+BRAF_H3K9me3.bed \
--control /root/vivek/chip-seq/bed/BRAF_H3K9me3.bed --window 1000 --nproc 1 \
--meth gt --chrlen ~/resources/hg38.chrom.sizes --mode s --report /root/vivek/chip-seq/H3K9me3_diff/BC_VS_B_H3K9me3_50pro_1000w --noanno --nohs &

#BC - C
diffReps.pl --treatment /root/vivek/chip-seq/bed/CDKN2A+BRAF_H3K9me3.bed \
--control /root/vivek/chip-seq/bed/CDKN2A_H3K9me3.bed --window 1000 --nproc 1 \
--meth gt --chrlen ~/resources/hg38.chrom.sizes --mode s --report /root/vivek/chip-seq/H3K9me3_diff/BC_VS_C_H3K9me3_50pro_1000w --noanno --nohs &

#B - C
diffReps.pl --treatment /root/vivek/chip-seq/bed/BRAF_H3K9me3.bed \
--control /root/vivek/chip-seq/bed/CDKN2A_H3K9me3.bed --window 1000 --nproc 1 \
--meth gt --chrlen ~/resources/hg38.chrom.sizes --mode s --report /root/vivek/chip-seq/H3K9me3_diff/B_VS_C_H3K9me3_50pro_1000w --noanno --nohs &

############################################################################################################################
#BC - N
grep "Down" BC_VS_N_H3K9me3_50pro_1000w |awk -F"\t" '{if($14<0.05){if($7>200 || $8>200){ if(sqrt($12^2)>1){print $0} }} }'|cut -f1,2,3 > BC_VS_N_H3K9me3_50pro_1000w_down.bed
grep "Up" BC_VS_N_H3K9me3_50pro_1000w |awk -F"\t" '{if($14<0.05){if($7>200 || $8>200){ if(sqrt($12^2)>1){print $0} }} }'|cut -f1,2,3 > BC_VS_N_H3K9me3_50pro_1000w_up.bed

####
#BC - N
diffReps.pl --treatment /root/vivek/chip-seq/bed/CDKN2A+BRAF_H3K9me3.bed \
--control /root/vivek/chip-seq/bed/NHM_H3K9me3.bed --nproc 1 \
--meth gt --chrlen ~/resources/hg38.chrom.sizes  --report /root/vivek/chip-seq/H3K9me3_diff/BC_VS_N_H3K9me3_default --noanno --nohs &

#BC - N
diffReps.pl --treatment /root/vivek/chip-seq/bed/CDKN2A+BRAF_H3K9me3.bed \
--control /root/vivek/chip-seq/bed/NHM_H3K9me3.bed --window 1000 --nproc 1 --mode b \
--meth gt --chrlen ~/resources/hg38.chrom.sizes --mode s --report /root/vivek/chip-seq/H3K9me3_diff/BC_VS_N_H3K9me3_b --noanno --nohs &

grep "Down" BC_VS_N_H3K9me3_b |awk -F"\t" '{if($14<0.05){if($7>200 || $8>200){ if(sqrt($12^2)>1){print $0} }} }'|cut -f1,2,3 > BC_VS_N_H3K9me3_b_down.bed
grep "Up" BC_VS_N_H3K9me3_b |awk -F"\t" '{if($14<0.05){if($7>200 || $8>200){ if(sqrt($12^2)>1){print $0} }} }'|cut -f1,2,3 > BC_VS_N_H3K9me3_b_up.bed

grep "Down" BC_VS_N_H3K9me3_default |awk -F"\t" '{if($14<0.05){if($7>200 || $8>200){ if(sqrt($12^2)>1){print $0} }} }'|cut -f1,2,3 > BC_VS_N_H3K9me3_default_down.bed
grep "Up" BC_VS_N_H3K9me3_default |awk -F"\t" '{if($14<0.05){if($7>200 || $8>200){ if(sqrt($12^2)>1){print $0} }} }'|cut -f1,2,3 > BC_VS_N_H3K9me3_default_up.bed
#################################################################################################################################################
#BC - N
diffReps.pl --treatment /root/vivek/chip-seq/bed/CDKN2A+BRAF_H3K9me3.bed \
--control /root/vivek/chip-seq/bed/NHM_H3K9me3.bed --window 10000 --nproc 1 --nsd broad \
--meth gt --chrlen ~/resources/hg38.chrom.sizes --report /root/vivek/chip-seq/H3K9me3_diff/BC_VS_N_H3K9me3_b --noanno --nohs &


grep "Down" BC_VS_N_H3K9me3_b |awk -F"\t" '{if($14<0.05){if($7>200 || $8>200){ if(sqrt($12^2)>1){print $0} }} }'|cut -f1,2,3 > BC_VS_N_H3K9me3_b_down.bed
grep "Up" BC_VS_N_H3K9me3_b |awk -F"\t" '{if($14<0.05){if($7>200 || $8>200){ if(sqrt($12^2)>1){print $0} }} }'|cut -f1,2,3 > BC_VS_N_H3K9me3_b_up.bed

