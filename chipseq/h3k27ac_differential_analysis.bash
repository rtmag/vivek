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

