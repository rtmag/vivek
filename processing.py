samtools view -b -F 4 ChIP-Seq_H3K4me1_501MEL_Aligned.sortedByCoord.out.bam > ChIP-Seq_H3K4me1_501MEL.bam
samtools view -b -F 4 ChIP-Seq_H3K4me1_NHM1_Aligned.sortedByCoord.out.bam > ChIP-Seq_H3K4me1_NHM1.bam
samtools view -b -F 4 ChIP-Seq_H3K4me1_NHM2_Aligned.sortedByCoord.out.bam > ChIP-Seq_H3K4me1_NHM2.bam
samtools view -b -F 4 ChIP-Seq_H3K4me1_SKmel147_Aligned.sortedByCoord.out.bam > ChIP-Seq_H3K4me1_SKmel147.bam
samtools view -b -F 4 ChIP-Seq_H3K4me1_SKmel239_Aligned.sortedByCoord.out.bam > ChIP-Seq_H3K4me1_SKmel239.bam
samtools view -b -F 4 ChIP-Seq_H3K4me1_SKmel2_Aligned.sortedByCoord.out.bam > ChIP-Seq_H3K4me1_SKmel2.bam

samtools view -b -F 4 ChIP-Seq_H3K27ac_501MEL_Aligned.sortedByCoord.out.bam > ChIP-Seq_H3K27ac_501MEL.bam
samtools view -b -F 4 ChIP-Seq_H3K27ac_NHM1_Aligned.sortedByCoord.out.bam > ChIP-Seq_H3K27ac_NHM1.bam
samtools view -b -F 4 ChIP-Seq_H3K27ac_NHM2_Aligned.sortedByCoord.out.bam > ChIP-Seq_H3K27ac_NHM2.bam
samtools view -b -F 4 ChIP-Seq_H3K27ac_SKmel147_Aligned.sortedByCoord.out.bam > ChIP-Seq_H3K27ac_SKmel147.bam
samtools view -b -F 4 ChIP-Seq_H3K27ac_SKmel239_Aligned.sortedByCoord.out.bam > ChIP-Seq_H3K27ac_SKmel239.bam
samtools view -b -F 4 ChIP-Seq_H3K27ac_SKmel2_Aligned.sortedByCoord.out.bam > ChIP-Seq_H3K27ac_SKmel2.bam

samtools view -b -F 4  ChIP-Seq_BRD4_NHM1_Aligned.sortedByCoord.out.bam > ChIP-Seq_BRD4_NHM1.bam
samtools view -b -F 4  ChIP-Seq_BRD4_SKmel147_2_Aligned.sortedByCoord.out.bam > ChIP-Seq_BRD4_SKmel147_2.bam
samtools view -b -F 4  ChIP-Seq_BRD4_SKmel147_Aligned.sortedByCoord.out.bam > ChIP-Seq_BRD4_SKmel147.bam

java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=ChIP-Seq_H3K4me1_501MEL.bam O=ChIP-Seq_H3K4me1_501MEL_rmdup.bam  M=ChIP-Seq_H3K4me1_501MEL.mfile

java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=ChIP-Seq_H3K4me1_NHM1.bam O=ChIP-Seq_H3K4me1_NHM1_rmdup.bam  M=ChIP-Seq_H3K4me1_NHM1.mfile

java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=ChIP-Seq_H3K4me1_NHM2.bam O=ChIP-Seq_H3K4me1_NHM2_rmdup.bam  M=ChIP-Seq_H3K4me1_NHM2.mfile

java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=ChIP-Seq_H3K4me1_SKmel147.bam.bam O=ChIP-Seq_H3K4me1_SKmel147.bam_rmdup.bam  M=ChIP-Seq_H3K4me1_SKmel147.bam.mfile

java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=ChIP-Seq_H3K4me1_SKmel239.bam O=ChIP-Seq_H3K4me1_SKmel239_rmdup.bam  M=ChIP-Seq_H3K4me1_SKmel239.mfile

java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=ChIP-Seq_H3K4me1_SKmel2.bam O=ChIP-Seq_H3K4me1_SKmel2_rmdup.bam  M=ChIP-Seq_H3K4me1_SKmel2.mfile
########
java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=ChIP-Seq_H3K27ac_501MEL.bam O=ChIP-Seq_H3K27ac_501MEL_rmdup.bam  M=ChIP-Seq_H3K27ac_501MEL.mfile

java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=ChIP-Seq_H3K27ac_NHM1.bam O=ChIP-Seq_H3K27ac_NHM1_rmdup.bam  M=ChIP-Seq_H3K27ac_NHM1.mfile

java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=ChIP-Seq_H3K27ac_NHM2.bam O=ChIP-Seq_H3K27ac_NHM2_rmdup.bam  M=ChIP-Seq_H3K27ac_NHM2.mfile

java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=ChIP-Seq_H3K27ac_SKmel147.bam O=ChIP-Seq_H3K27ac_SKmel147_rmdup.bam  M=ChIP-Seq_H3K27ac_SKmel147.mfile

java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=ChIP-Seq_H3K27ac_SKmel239.bam O=ChIP-Seq_H3K27ac_SKmel239_rmdup.bam  M=ChIP-Seq_H3K27ac_SKmel239.mfile

java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=ChIP-Seq_H3K27ac_SKmel2.bam O=ChIP-Seq_H3K27ac_SKmel2_rmdup.bam  M=ChIP-Seq_H3K27ac_SKmel2.mfile
##
java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=ChIP-Seq_BRD4_NHM1.bam O=ChIP-Seq_BRD4_NHM1_rmdup.bam  M=ChIP-Seq_BRD4_NHM1.mfile

java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=ChIP-Seq_BRD4_SKmel147_2.bam O=ChIP-Seq_BRD4_SKmel147_2_rmdup.bam  M=ChIP-Seq_BRD4_SKmel147_2.mfile

java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=ChIP-Seq_BRD4_SKmel147.bam O=ChIP-Seq_BRD4_SKmel147_rmdup.bam  M=ChIP-Seq_BRD4_SKmel147.mfile


