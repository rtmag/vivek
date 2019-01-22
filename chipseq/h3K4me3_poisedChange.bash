bamToBed -i bam/CDKN2A+BRAF_H3K4me3_rmdup.bam > bed/CDKN2A+BRAF_H3K4me3.bed &
bamToBed -i bam/NHM_H3K4me3_rmdup.bam > bed/NHM_H3K4me3.bed &


diffReps.pl --treatment ../bed/CDKN2A+BRAF_H3K4me3.bed \
--control ../bed/NHM_H3K4me3.bed \
--meth gt --chrlen ~/resources/hg38.chrom.sizes --report /root/vivek/chip-seq/diffreps/H3K4me3_CDKN2A+BRAF_vs_NHM --nproc 60 --noanno --nohs

