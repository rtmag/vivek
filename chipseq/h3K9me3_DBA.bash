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
