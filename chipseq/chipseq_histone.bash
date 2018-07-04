################################################################################################################################
# Cleanup
trim_galore --illumina -q 20 --fastqc -o /root/vivek/chip-seq/trimmed/ /root/vivek/chip-seq/fastq/Chip-01_S60_R1_001.fastq.gz &
trim_galore --illumina -q 20 --fastqc -o /root/vivek/chip-seq/trimmed/ /root/vivek/chip-seq/fastq/Chip-02_S46_R1_001.fastq.gz &
trim_galore --illumina -q 20 --fastqc -o /root/vivek/chip-seq/trimmed/ /root/vivek/chip-seq/fastq/Chip-03_S47_R1_001.fastq.gz &
trim_galore --illumina -q 20 --fastqc -o /root/vivek/chip-seq/trimmed/ /root/vivek/chip-seq/fastq/Chip-04_S56_R1_001.fastq.gz &
trim_galore --illumina -q 20 --fastqc -o /root/vivek/chip-seq/trimmed/ /root/vivek/chip-seq/fastq/Chip-05_S61_R1_001.fastq.gz &
trim_galore --illumina -q 20 --fastqc -o /root/vivek/chip-seq/trimmed/ /root/vivek/chip-seq/fastq/Chip-06_S48_R1_001.fastq.gz &
trim_galore --illumina -q 20 --fastqc -o /root/vivek/chip-seq/trimmed/ /root/vivek/chip-seq/fastq/Chip-07_S49_R1_001.fastq.gz &
trim_galore --illumina -q 20 --fastqc -o /root/vivek/chip-seq/trimmed/ /root/vivek/chip-seq/fastq/Chip-08_S57_R1_001.fastq.gz &
trim_galore --illumina -q 20 --fastqc -o /root/vivek/chip-seq/trimmed/ /root/vivek/chip-seq/fastq/Chip-09_S62_R1_001.fastq.gz &
trim_galore --illumina -q 20 --fastqc -o /root/vivek/chip-seq/trimmed/ /root/vivek/chip-seq/fastq/Chip-10_S50_R1_001.fastq.gz &
trim_galore --illumina -q 20 --fastqc -o /root/vivek/chip-seq/trimmed/ /root/vivek/chip-seq/fastq/Chip-11_S51_R1_001.fastq.gz &
trim_galore --illumina -q 20 --fastqc -o /root/vivek/chip-seq/trimmed/ /root/vivek/chip-seq/fastq/Chip-12_S58_R1_001.fastq.gz &
trim_galore --illumina -q 20 --fastqc -o /root/vivek/chip-seq/trimmed/ /root/vivek/chip-seq/fastq/Chip-13_S52_R1_001.fastq.gz &
trim_galore --illumina -q 20 --fastqc -o /root/vivek/chip-seq/trimmed/ /root/vivek/chip-seq/fastq/Chip-14_S63_R1_001.fastq.gz &
trim_galore --illumina -q 20 --fastqc -o /root/vivek/chip-seq/trimmed/ /root/vivek/chip-seq/fastq/Chip-15_S53_R1_001.fastq.gz &
trim_galore --illumina -q 20 --fastqc -o /root/vivek/chip-seq/trimmed/ /root/vivek/chip-seq/fastq/Chip-16_S54_R1_001.fastq.gz &
trim_galore --illumina -q 20 --fastqc -o /root/vivek/chip-seq/trimmed/ /root/vivek/chip-seq/fastq/Chip-17_S59_R1_001.fastq.gz &
trim_galore --illumina -q 20 --fastqc -o /root/vivek/chip-seq/trimmed/ /root/vivek/chip-seq/fastq/Chip-18_S55_R1_001.fastq.gz &
################################################################################################################################

STAR --genomeDir /root/resources/hg38_noanno/ \
--readFilesCommand zcat \
--runThreadN 60 \
--alignIntronMax 1 \
--alignEndsType EndToEnd \
--readFilesIn /root/vivek/chip-seq/trimmed/Chip-01_S60_R1_001_trimmed.fq.gz \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix /root/vivek/chip-seq/bam/NHM_H3K4me3_

STAR --genomeDir /root/resources/hg38_noanno/ \
--readFilesCommand zcat \
--runThreadN 60 \
--alignIntronMax 1 \
--alignEndsType EndToEnd \
--readFilesIn /root/vivek/chip-seq/trimmed/Chip-02_S46_R1_001_trimmed.fq.gz \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix /root/vivek/chip-seq/bam/NHM_H3K9me3_

STAR --genomeDir /root/resources/hg38_noanno/ \
--readFilesCommand zcat \
--runThreadN 60 \
--alignIntronMax 1 \
--alignEndsType EndToEnd \
--readFilesIn /root/vivek/chip-seq/trimmed/Chip-03_S47_R1_001_trimmed.fq.gz \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix /root/vivek/chip-seq/bam/NHM_H3K27me3_

STAR --genomeDir /root/resources/hg38_noanno/ \
--readFilesCommand zcat \
--runThreadN 60 \
--alignIntronMax 1 \
--alignEndsType EndToEnd \
--readFilesIn /root/vivek/chip-seq/trimmed/Chip-04_S56_R1_001_trimmed.fq.gz \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix /root/vivek/chip-seq/bam/NHM_H3K27ac_

STAR --genomeDir /root/resources/hg38_noanno/ \
--readFilesCommand zcat \
--runThreadN 60 \
--alignIntronMax 1 \
--alignEndsType EndToEnd \
--readFilesIn /root/vivek/chip-seq/trimmed/Chip-05_S61_R1_001_trimmed.fq.gz \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix /root/vivek/chip-seq/bam/CDKN2A_H3K4me3_

STAR --genomeDir /root/resources/hg38_noanno/ \
--readFilesCommand zcat \
--runThreadN 60 \
--alignIntronMax 1 \
--alignEndsType EndToEnd \
--readFilesIn /root/vivek/chip-seq/trimmed/Chip-06_S48_R1_001_trimmed.fq.gz \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix /root/vivek/chip-seq/bam/CDKN2A_H3K9me3_

STAR --genomeDir /root/resources/hg38_noanno/ \
--readFilesCommand zcat \
--runThreadN 60 \
--alignIntronMax 1 \
--alignEndsType EndToEnd \
--readFilesIn /root/vivek/chip-seq/trimmed/Chip-07_S49_R1_001_trimmed.fq.gz \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix /root/vivek/chip-seq/bam/CDKN2A_H3K27me3_

STAR --genomeDir /root/resources/hg38_noanno/ \
--readFilesCommand zcat \
--runThreadN 60 \
--alignIntronMax 1 \
--alignEndsType EndToEnd \
--readFilesIn /root/vivek/chip-seq/trimmed/Chip-08_S57_R1_001_trimmed.fq.gz \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix /root/vivek/chip-seq/bam/CDKN2A_H3K27ac_

STAR --genomeDir /root/resources/hg38_noanno/ \
--readFilesCommand zcat \
--runThreadN 60 \
--alignIntronMax 1 \
--alignEndsType EndToEnd \
--readFilesIn /root/vivek/chip-seq/trimmed/Chip-09_S62_R1_001_trimmed.fq.gz \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix /root/vivek/chip-seq/bam/BRAF_H3K4me3_

STAR --genomeDir /root/resources/hg38_noanno/ \
--readFilesCommand zcat \
--runThreadN 60 \
--alignIntronMax 1 \
--alignEndsType EndToEnd \
--readFilesIn /root/vivek/chip-seq/trimmed/Chip-10_S50_R1_001_trimmed.fq.gz \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix /root/vivek/chip-seq/bam/BRAF_H3K9me3_

STAR --genomeDir /root/resources/hg38_noanno/ \
--readFilesCommand zcat \
--runThreadN 60 \
--alignIntronMax 1 \
--alignEndsType EndToEnd \
--readFilesIn /root/vivek/chip-seq/trimmed/Chip-11_S51_R1_001_trimmed.fq.gz \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix /root/vivek/chip-seq/bam/BRAF_H3K27me3_

STAR --genomeDir /root/resources/hg38_noanno/ \
--readFilesCommand zcat \
--runThreadN 60 \
--alignIntronMax 1 \
--alignEndsType EndToEnd \
--readFilesIn /root/vivek/chip-seq/trimmed/Chip-12_S58_R1_001_trimmed.fq.gz \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix /root/vivek/chip-seq/bam/BRAF_H3K27ac_

STAR --genomeDir /root/resources/hg38_noanno/ \
--readFilesCommand zcat \
--runThreadN 60 \
--alignIntronMax 1 \
--alignEndsType EndToEnd \
--readFilesIn /root/vivek/chip-seq/trimmed/Chip-13_S52_R1_001_trimmed.fq.gz \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix /root/vivek/chip-seq/bam/NHM_input_

STAR --genomeDir /root/resources/hg38_noanno/ \
--readFilesCommand zcat \
--runThreadN 60 \
--alignIntronMax 1 \
--alignEndsType EndToEnd \
--readFilesIn /root/vivek/chip-seq/trimmed/Chip-14_S63_R1_001_trimmed.fq.gz \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix /root/vivek/chip-seq/bam/CDKN2A+BRAF_H3K4me3_

STAR --genomeDir /root/resources/hg38_noanno/ \
--readFilesCommand zcat \
--runThreadN 60 \
--alignIntronMax 1 \
--alignEndsType EndToEnd \
--readFilesIn /root/vivek/chip-seq/trimmed/Chip-15_S53_R1_001_trimmed.fq.gz \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix /root/vivek/chip-seq/bam/CDKN2A+BRAF_H3K9me3_

STAR --genomeDir /root/resources/hg38_noanno/ \
--readFilesCommand zcat \
--runThreadN 60 \
--alignIntronMax 1 \
--alignEndsType EndToEnd \
--readFilesIn /root/vivek/chip-seq/trimmed/Chip-16_S54_R1_001_trimmed.fq.gz \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix /root/vivek/chip-seq/bam/CDKN2A+BRAF_H3K27me3_

STAR --genomeDir /root/resources/hg38_noanno/ \
--readFilesCommand zcat \
--runThreadN 60 \
--alignIntronMax 1 \
--alignEndsType EndToEnd \
--readFilesIn /root/vivek/chip-seq/trimmed/Chip-17_S59_R1_001_trimmed.fq.gz \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix /root/vivek/chip-seq/bam/CDKN2A+BRAF_H3K27ac_

STAR --genomeDir /root/resources/hg38_noanno/ \
--readFilesCommand zcat \
--runThreadN 60 \
--alignIntronMax 1 \
--alignEndsType EndToEnd \
--readFilesIn /root/vivek/chip-seq/trimmed/Chip-18_S55_R1_001_trimmed.fq.gz \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix /root/vivek/chip-seq/bam/CDKN2A+BRAF_input_
################################################################################################################################
# NHM
java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/root/vivek/chip-seq/bam/NHM_H3K4me3_Aligned.sortedByCoord.out.bam \
O=/root/vivek/chip-seq/bam/NHM_H3K4me3_rmdup.bam \
M=/root/vivek/chip-seq/bam/NHM_H3K4me3_rmdup.mfile &

java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/root/vivek/chip-seq/bam/NHM_H3K9me3_Aligned.sortedByCoord.out.bam \
O=/root/vivek/chip-seq/bam/NHM_H3K9me3_rmdup.bam \
M=/root/vivek/chip-seq/bam/NHM_H3K9me3_rmdup.mfile &

java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/root/vivek/chip-seq/bam/NHM_H3K27me3_Aligned.sortedByCoord.out.bam \
O=/root/vivek/chip-seq/bam/NHM_H3K27me3_rmdup.bam \
M=/root/vivek/chip-seq/bam/NHM_H3K27me3_rmdup.mfile &

java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/root/vivek/chip-seq/bam/NHM_H3K27ac_Aligned.sortedByCoord.out.bam \
O=/root/vivek/chip-seq/bam/NHM_H3K27ac_rmdup.bam \
M=/root/vivek/chip-seq/bam/NHM_H3K27ac_rmdup.mfile &

java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/root/vivek/chip-seq/bam/NHM_input_Aligned.sortedByCoord.out.bam \
O=/root/vivek/chip-seq/bam/NHM_input_rmdup.bam \
M=/root/vivek/chip-seq/bam/NHM_input_rmdup.mfile &
####################################################################################################
# CDKN2A
java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/root/vivek/chip-seq/bam/CDKN2A_H3K4me3_Aligned.sortedByCoord.out.bam \
O=/root/vivek/chip-seq/bam/CDKN2A_H3K4me3_rmdup.bam \
M=/root/vivek/chip-seq/bam/CDKN2A_H3K4me3_rmdup.mfile &

java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/root/vivek/chip-seq/bam/CDKN2A_H3K9me3_Aligned.sortedByCoord.out.bam \
O=/root/vivek/chip-seq/bam/CDKN2A_H3K9me3_rmdup.bam \
M=/root/vivek/chip-seq/bam/CDKN2A_H3K9me3_rmdup.mfile &

java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/root/vivek/chip-seq/bam/CDKN2A_H3K27me3_Aligned.sortedByCoord.out.bam \
O=/root/vivek/chip-seq/bam/CDKN2A_H3K27me3_rmdup.bam \
M=/root/vivek/chip-seq/bam/CDKN2A_H3K27me3_rmdup.mfile &

java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/root/vivek/chip-seq/bam/CDKN2A_H3K27ac_Aligned.sortedByCoord.out.bam \
O=/root/vivek/chip-seq/bam/CDKN2A_H3K27ac_rmdup.bam \
M=/root/vivek/chip-seq/bam/CDKN2A_H3K27ac_rmdup.mfile &
####################################################################################################
# BRAF
java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/root/vivek/chip-seq/bam/BRAF_H3K4me3_Aligned.sortedByCoord.out.bam \
O=/root/vivek/chip-seq/bam/BRAF_H3K4me3_rmdup.bam \
M=/root/vivek/chip-seq/bam/BRAF_H3K4me3_rmdup.mfile &

java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/root/vivek/chip-seq/bam/BRAF_H3K9me3_Aligned.sortedByCoord.out.bam \
O=/root/vivek/chip-seq/bam/BRAF_H3K9me3_rmdup.bam \
M=/root/vivek/chip-seq/bam/BRAF_H3K9me3_rmdup.mfile &

java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/root/vivek/chip-seq/bam/BRAF_H3K27me3_Aligned.sortedByCoord.out.bam \
O=/root/vivek/chip-seq/bam/BRAF_H3K27me3_rmdup.bam \
M=/root/vivek/chip-seq/bam/BRAF_H3K27me3_rmdup.mfile &

java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/root/vivek/chip-seq/bam/BRAF_H3K27ac_Aligned.sortedByCoord.out.bam \
O=/root/vivek/chip-seq/bam/BRAF_H3K27ac_rmdup.bam \
M=/root/vivek/chip-seq/bam/BRAF_H3K27ac_rmdup.mfile &
####################################################################################################
# CDKN2A+BRAF
java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/root/vivek/chip-seq/bam/CDKN2A+BRAF_H3K4me3_Aligned.sortedByCoord.out.bam \
O=/root/vivek/chip-seq/bam/CDKN2A+BRAF_H3K4me3_rmdup.bam \
M=/root/vivek/chip-seq/bam/CDKN2A+BRAF_H3K4me3_rmdup.mfile &

java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/root/vivek/chip-seq/bam/CDKN2A+BRAF_H3K9me3_Aligned.sortedByCoord.out.bam \
O=/root/vivek/chip-seq/bam/CDKN2A+BRAF_H3K9me3_rmdup.bam \
M=/root/vivek/chip-seq/bam/CDKN2A+BRAF_H3K9me3_rmdup.mfile &

java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/root/vivek/chip-seq/bam/CDKN2A+BRAF_H3K27me3_Aligned.sortedByCoord.out.bam \
O=/root/vivek/chip-seq/bam/CDKN2A+BRAF_H3K27me3_rmdup.bam \
M=/root/vivek/chip-seq/bam/CDKN2A+BRAF_H3K27me3_rmdup.mfile &

java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/root/vivek/chip-seq/bam/CDKN2A+BRAF_H3K27ac_Aligned.sortedByCoord.out.bam \
O=/root/vivek/chip-seq/bam/CDKN2A+BRAF_H3K27ac_rmdup.bam \
M=/root/vivek/chip-seq/bam/CDKN2A+BRAF_H3K27ac_rmdup.mfile &

java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/root/vivek/chip-seq/bam/CDKN2A+BRAF_input_Aligned.sortedByCoord.out.bam \
O=/root/vivek/chip-seq/bam/CDKN2A+BRAF_input_rmdup.bam \
M=/root/vivek/chip-seq/bam/CDKN2A+BRAF_input_rmdup.mfile &
########################################################################################################
# MACS2 NHM
macs2 callpeak -g hs -q 0.05 --keep-dup auto --broad -n NHM_H3K4me3 --outdir /home/rtm/vivek/chip-seq/macs2 \
-t /root/vivek/chip-seq/bam/NHM_H3K4me3_rmdup.bam -c /root/vivek/chip-seq/bam/NHM_input_rmdup.bam &

macs2 callpeak -g hs -q 0.05 --keep-dup auto --broad -n NHM_H3K9me3 --outdir /home/rtm/vivek/chip-seq/macs2 \
-t /root/vivek/chip-seq/bam/NHM_H3K9me3_rmdup.bam -c /root/vivek/chip-seq/bam/NHM_input_rmdup.bam &

macs2 callpeak -g hs -q 0.05 --keep-dup auto --broad -n NHM_H3K27me3 --outdir /home/rtm/vivek/chip-seq/macs2 \
-t /root/vivek/chip-seq/bam/NHM_H3K27me3_rmdup.bam -c /root/vivek/chip-seq/bam/NHM_input_rmdup.bam &

macs2 callpeak -g hs -q 0.05 --keep-dup auto --broad -n NHM_H3K27ac --outdir /home/rtm/vivek/chip-seq/macs2 \
-t /root/vivek/chip-seq/bam/NHM_H3K27ac_rmdup.bam -c /root/vivek/chip-seq/bam/NHM_input_rmdup.bam &
########################################################################################################
# MACS2 CDKN2A
macs2 callpeak -g hs -q 0.05 --keep-dup auto --broad -n CDKN2A_H3K4me3 --outdir /home/rtm/vivek/chip-seq/macs2 \
-t /root/vivek/chip-seq/bam/CDKN2A_H3K4me3_rmdup.bam -c /root/vivek/chip-seq/bam/CDKN2A+BRAF_input_rmdup.bam &

macs2 callpeak -g hs -q 0.05 --keep-dup auto --broad -n CDKN2A_H3K9me3 --outdir /home/rtm/vivek/chip-seq/macs2 \
-t /root/vivek/chip-seq/bam/CDKN2A_H3K9me3_rmdup.bam -c /root/vivek/chip-seq/bam/CDKN2A+BRAF_input_rmdup.bam &

macs2 callpeak -g hs -q 0.05 --keep-dup auto --broad -n CDKN2A_H3K27me3 --outdir /home/rtm/vivek/chip-seq/macs2 \
-t /root/vivek/chip-seq/bam/CDKN2A_H3K27me3_rmdup.bam -c /root/vivek/chip-seq/bam/CDKN2A+BRAF_input_rmdup.bam &

macs2 callpeak -g hs -q 0.05 --keep-dup auto --broad -n CDKN2A_H3K27ac --outdir /home/rtm/vivek/chip-seq/macs2 \
-t /root/vivek/chip-seq/bam/CDKN2A_H3K27ac_rmdup.bam -c /root/vivek/chip-seq/bam/CDKN2A+BRAF_input_rmdup.bam &
########################################################################################################
# MACS2 BRAF
macs2 callpeak -g hs -q 0.05 --keep-dup auto --broad -n BRAF_H3K4me3 --outdir /home/rtm/vivek/chip-seq/macs2 \
-t /root/vivek/chip-seq/bam/BRAF_H3K4me3_rmdup.bam -c /root/vivek/chip-seq/bam/CDKN2A+BRAF_input_rmdup.bam &

macs2 callpeak -g hs -q 0.05 --keep-dup auto --broad -n BRAF_H3K9me3 --outdir /home/rtm/vivek/chip-seq/macs2 \
-t /root/vivek/chip-seq/bam/BRAF_H3K9me3_rmdup.bam -c /root/vivek/chip-seq/bam/CDKN2A+BRAF_input_rmdup.bam &

macs2 callpeak -g hs -q 0.05 --keep-dup auto --broad -n BRAF_H3K27me3 --outdir /home/rtm/vivek/chip-seq/macs2 \
-t /root/vivek/chip-seq/bam/BRAF_H3K27me3_rmdup.bam -c /root/vivek/chip-seq/bam/CDKN2A+BRAF_input_rmdup.bam &

macs2 callpeak -g hs -q 0.05 --keep-dup auto --broad -n BRAF_H3K27ac --outdir /home/rtm/vivek/chip-seq/macs2 \
-t /root/vivek/chip-seq/bam/BRAF_H3K27ac_rmdup.bam -c /root/vivek/chip-seq/bam/CDKN2A+BRAF_input_rmdup.bam &
########################################################################################################
# MACS2 CDKN2A+BRAF
macs2 callpeak -g hs -q 0.05 --keep-dup auto --broad -n CDKN2A+BRAF_H3K4me3 --outdir /home/rtm/vivek/chip-seq/macs2 \
-t /root/vivek/chip-seq/bam/CDKN2A+BRAF_H3K4me3_rmdup.bam -c /root/vivek/chip-seq/bam/CDKN2A+BRAF_input_rmdup.bam &

macs2 callpeak -g hs -q 0.05 --keep-dup auto --broad -n CDKN2A+BRAF_H3K9me3 --outdir /home/rtm/vivek/chip-seq/macs2 \
-t /root/vivek/chip-seq/bam/CDKN2A+BRAF_H3K9me3_rmdup.bam -c /root/vivek/chip-seq/bam/CDKN2A+BRAF_input_rmdup.bam &

macs2 callpeak -g hs -q 0.05 --keep-dup auto --broad -n CDKN2A+BRAF_H3K27me3 --outdir /home/rtm/vivek/chip-seq/macs2 \
-t /root/vivek/chip-seq/bam/CDKN2A+BRAF_H3K27me3_rmdup.bam -c /root/vivek/chip-seq/bam/CDKN2A+BRAF_input_rmdup.bam &

macs2 callpeak -g hs -q 0.05 --keep-dup auto --broad -n CDKN2A+BRAF_H3K27ac --outdir /home/rtm/vivek/chip-seq/macs2 \
-t /root/vivek/chip-seq/bam/CDKN2A+BRAF_H3K27ac_rmdup.bam -c /root/vivek/chip-seq/bam/CDKN2A+BRAF_input_rmdup.bam &
########################################################################################################
samtools index/root/vivek/chip-seq/bam/BRAF_H3K27ac_rmdup.bam &
samtools index/root/vivek/chip-seq/bam/BRAF_H3K27me3_rmdup.bam &
samtools index/root/vivek/chip-seq/bam/BRAF_H3K4me3_rmdup.bam &
samtools index/root/vivek/chip-seq/bam/BRAF_H3K9me3_rmdup.bam &
samtools index/root/vivek/chip-seq/bam/CDKN2A+BRAF_H3K27ac_rmdup.bam &
samtools index/root/vivek/chip-seq/bam/CDKN2A+BRAF_H3K27me3_rmdup.bam &
samtools index/root/vivek/chip-seq/bam/CDKN2A+BRAF_H3K4me3_rmdup.bam &
samtools index/root/vivek/chip-seq/bam/CDKN2A+BRAF_H3K9me3_rmdup.bam &
samtools index/root/vivek/chip-seq/bam/CDKN2A+BRAF_input_rmdup.bam &
samtools index/root/vivek/chip-seq/bam/CDKN2A_H3K27ac_rmdup.bam &
samtools index/root/vivek/chip-seq/bam/CDKN2A_H3K27me3_rmdup.bam &
samtools index/root/vivek/chip-seq/bam/CDKN2A_H3K4me3_rmdup.bam &
samtools index/root/vivek/chip-seq/bam/CDKN2A_H3K9me3_rmdup.bam &
samtools index/root/vivek/chip-seq/bam/NHM_H3K27ac_rmdup.bam &
samtools index/root/vivek/chip-seq/bam/NHM_H3K27me3_rmdup.bam &
samtools index/root/vivek/chip-seq/bam/NHM_H3K4me3_rmdup.bam &
samtools index/root/vivek/chip-seq/bam/NHM_H3K9me3_rmdup.bam &
samtools index/root/vivek/chip-seq/bam/NHM_input_rmdup.bam &

wait
##########################################################################################


bamCoverage -p max -e 200 -bs 1 --normalizeUsing CPM -b /root/vivek/chip-seq/bam/BRAF_H3K27ac_rmdup.bam -o /root/vivek/chip-seq/bw/BRAF_H3K27ac.bw
bamCoverage -p max -e 200 -bs 1 --normalizeUsing CPM -b /root/vivek/chip-seq/bam/BRAF_H3K27me3_rmdup.bam -o /root/vivek/chip-seq/bw/BRAF_H3K27me3.bw
bamCoverage -p max -e 200 -bs 1 --normalizeUsing CPM -b /root/vivek/chip-seq/bam/BRAF_H3K4me3_rmdup.bam -o /root/vivek/chip-seq/bw/BRAF_H3K4me3.bw
bamCoverage -p max -e 200 -bs 1 --normalizeUsing CPM -b /root/vivek/chip-seq/bam/BRAF_H3K9me3_rmdup.bam -o /root/vivek/chip-seq/bw/BRAF_H3K9me3.bw
bamCoverage -p max -e 200 -bs 1 --normalizeUsing CPM -b /root/vivek/chip-seq/bam/CDKN2A+BRAF_H3K27ac_rmdup.bam -o /root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27ac.bw
bamCoverage -p max -e 200 -bs 1 --normalizeUsing CPM -b /root/vivek/chip-seq/bam/CDKN2A+BRAF_H3K27me3_rmdup.bam -o /root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27me3.bw
bamCoverage -p max -e 200 -bs 1 --normalizeUsing CPM -b /root/vivek/chip-seq/bam/CDKN2A+BRAF_H3K4me3_rmdup.bam -o /root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K4me3.bw
bamCoverage -p max -e 200 -bs 1 --normalizeUsing CPM -b /root/vivek/chip-seq/bam/CDKN2A+BRAF_H3K9me3_rmdup.bam -o /root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K9me3.bw
bamCoverage -p max -e 200 -bs 1 --normalizeUsing CPM -b /root/vivek/chip-seq/bam/CDKN2A_H3K27ac_rmdup.bam -o /root/vivek/chip-seq/bw/CDKN2A_H3K27ac.bw
bamCoverage -p max -e 200 -bs 1 --normalizeUsing CPM -b /root/vivek/chip-seq/bam/CDKN2A_H3K27me3_rmdup.bam -o /root/vivek/chip-seq/bw/CDKN2A_H3K27me3.bw
bamCoverage -p max -e 200 -bs 1 --normalizeUsing CPM -b /root/vivek/chip-seq/bam/CDKN2A_H3K4me3_rmdup.bam -o /root/vivek/chip-seq/bw/CDKN2A_H3K4me3.bw
bamCoverage -p max -e 200 -bs 1 --normalizeUsing CPM -b /root/vivek/chip-seq/bam/CDKN2A_H3K9me3_rmdup.bam -o /root/vivek/chip-seq/bw/CDKN2A_H3K9me3.bw
bamCoverage -p max -e 200 -bs 1 --normalizeUsing CPM -b /root/vivek/chip-seq/bam/NHM_H3K27ac_rmdup.bam -o /root/vivek/chip-seq/bw/NHM_H3K27ac.bw
bamCoverage -p max -e 200 -bs 1 --normalizeUsing CPM -b /root/vivek/chip-seq/bam/NHM_H3K27me3_rmdup.bam -o /root/vivek/chip-seq/bw/NHM_H3K27me3.bw
bamCoverage -p max -e 200 -bs 1 --normalizeUsing CPM -b /root/vivek/chip-seq/bam/NHM_H3K4me3_rmdup.bam -o /root/vivek/chip-seq/bw/NHM_H3K4me3.bw
bamCoverage -p max -e 200 -bs 1 --normalizeUsing CPM -b /root/vivek/chip-seq/bam/NHM_H3K9me3_rmdup.bam -o /root/vivek/chip-seq/bw/NHM_H3K9me3.bw

######
