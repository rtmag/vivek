bamToBed -i bam/BRAF_H3K27ac_rmdup.bam > bed/BRAF_H3K27ac.bed &
bamToBed -i bam/CDKN2A+BRAF_H3K27ac_rmdup.bam > bed/CDKN2A+BRAF_H3K27ac.bed &
bamToBed -i bam/CDKN2A_H3K27ac_rmdup.bam > bed/CDKN2A_H3K27ac.bed &
bamToBed -i bam/NHM_H3K27ac_rmdup.bam > bed/NHM_H3K27ac.bed &


diffReps.pl --treatment ./bed/CDKN2A+BRAF_H3K27ac.bed \
--control ./bed/NHM_H3K27ac.bed \
--meth gt --chrlen ~/resources/hg38.chrom.sizes --mode n --report /root/vivek/chip-seq/diffreps/CDKN2A+BRAF_vs_NHM --nproc 60 --noanno --nohs

diffReps.pl --treatment ./bed/BRAF_H3K27ac.bed \
--control ./bed/NHM_H3K27ac.bed \
--meth gt ---chrlen ~/resources/hg38.chrom.sizes --mode n --report /root/vivek/chip-seq/diffreps/BRAF_vs_NHM --nproc 60 --noanno --nohs

diffReps.pl --treatment ./bed/CDKN2A+BRAF_H3K27ac.bed \
--control ./bed/NHM_H3K27ac.bed \
--meth gt --chrlen ~/resources/hg38.chrom.sizes --mode p --report /root/vivek/chip-seq/diffreps/CDKN2A+BRAF_vs_NHM --nproc 60 --noanno --nohs

diffReps.pl --treatment ./bed/BRAF_H3K27ac.bed \
--control ./bed/NHM_H3K27ac.bed \
--meth gt --chrlen ~/resources/hg38.chrom.sizes --mode p --report /root/vivek/chip-seq/diffreps/BRAF_vs_NHM --nproc 60 --noanno --nohs

##########################################################################
