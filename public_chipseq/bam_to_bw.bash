samtools index ATAC-Seq_501MEL_Aligned.sortedByCoord.out.bam &
samtools index ATAC-Seq_NHM1_Aligned.sortedByCoord.out.bam &
samtools index ATAC-Seq_SKmel147_Aligned.sortedByCoord.out.bam &

samtools index ChIP-Seq_H3K27ac_501MEL_Aligned.sortedByCoord.out.bam &
samtools index ChIP-Seq_H3K27ac_NHM1_Aligned.sortedByCoord.out.bam &
samtools index ChIP-Seq_H3K27ac_SKmel147_Aligned.sortedByCoord.out.bam &
samtools index ChIP-Seq_H3K27ac_SKmel239_Aligned.sortedByCoord.out.bam &

samtools index ChIP-Seq_H3K4me1_501MEL_Aligned.sortedByCoord.out.bam &
samtools index ChIP-Seq_H3K4me1_NHM1_Aligned.sortedByCoord.out.bam &
samtools index ChIP-Seq_H3K4me1_SKmel147_Aligned.sortedByCoord.out.bam &
samtools index ChIP-Seq_H3K4me1_SKmel239_Aligned.sortedByCoord.out.bam &


####################################################################################################################################
# ATAC
bamCoverage -p max -bs 10 --normalizeUsing CPM -b /root/vivek/public_chipseq/bam/ATAC-Seq_501MEL_Aligned.sortedByCoord.out.bam \
--ignoreDuplicates -o /root/vivek/public_chipseq/bw/ATAC-Seq_501MEL.bw

bamCoverage -p max -bs 10 --normalizeUsing CPM -b /root/vivek/public_chipseq/bam/ATAC-Seq_NHM1_Aligned.sortedByCoord.out.bam \
--ignoreDuplicates -o /root/vivek/public_chipseq/bw/ATAC-Seq_NHM1.bw

bamCoverage -p max -bs 10 --normalizeUsing CPM -b /root/vivek/public_chipseq/bam/ATAC-Seq_SKmel147_Aligned.sortedByCoord.out.bam \
--ignoreDuplicates -o /root/vivek/public_chipseq/bw/ATAC-Seq_SKmel147.bw
#############################################################################################################
# H3K27ac
bamCoverage -p max -bs 10 --normalizeUsing CPM -b /root/vivek/public_chipseq/bam/ChIP-Seq_H3K27ac_501MEL_Aligned.sortedByCoord.out.bam \
--ignoreDuplicates -o /root/vivek/public_chipseq/bw/ChIP-Seq_H3K27ac_501MEL.bw

bamCoverage -p max -bs 10 --normalizeUsing CPM -b /root/vivek/public_chipseq/bam/ChIP-Seq_H3K27ac_NHM1_Aligned.sortedByCoord.out.bam \
--ignoreDuplicates -o /root/vivek/public_chipseq/bw/ChIP-Seq_H3K27ac_NHM1.bw

bamCoverage -p max -bs 10 --normalizeUsing CPM -b /root/vivek/public_chipseq/bam/ChIP-Seq_H3K27ac_SKmel147_Aligned.sortedByCoord.out.bam \
--ignoreDuplicates -o /root/vivek/public_chipseq/bw/ChIP-Seq_H3K27ac_SKmel147.bw

bamCoverage -p max -bs 10 --normalizeUsing CPM -b /root/vivek/public_chipseq/bam/ChIP-Seq_H3K27ac_SKmel239_Aligned.sortedByCoord.out.bam \
--ignoreDuplicates -o /root/vivek/public_chipseq/bw/ChIP-Seq_H3K27ac_SKmel239.bw
#############################################################################################################
# H3K4me1
bamCoverage -p max -bs 10 --normalizeUsing CPM -b /root/vivek/public_chipseq/bam/ChIP-Seq_H3K4me1_501MEL_Aligned.sortedByCoord.out.bam \
--ignoreDuplicates -o /root/vivek/public_chipseq/bw/ChIP-Seq_H3K4me1_501MEL.bw

bamCoverage -p max -bs 10 --normalizeUsing CPM -b /root/vivek/public_chipseq/bam/ChIP-Seq_H3K4me1_NHM1_Aligned.sortedByCoord.out.bam \
--ignoreDuplicates -o /root/vivek/public_chipseq/bw/ChIP-Seq_H3K4me1_NHM1.bw

bamCoverage -p max -bs 10 --normalizeUsing CPM -b /root/vivek/public_chipseq/bam/ChIP-Seq_H3K4me1_SKmel147_Aligned.sortedByCoord.out.bam \
--ignoreDuplicates -o /root/vivek/public_chipseq/bw/ChIP-Seq_H3K4me1_SKmel147.bw

bamCoverage -p max -bs 10 --normalizeUsing CPM -b /root/vivek/public_chipseq/bam/ChIP-Seq_H3K4me1_SKmel239_Aligned.sortedByCoord.out.bam \
--ignoreDuplicates -o /root/vivek/public_chipseq/bw/ChIP-Seq_H3K4me1_SKmel239.bw
######
