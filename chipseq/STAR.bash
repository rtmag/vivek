#####################

STAR --genomeDir /home/references/hg38/STAR_hg38_noAnnotation \
--readFilesCommand zcat \
--runThreadN 20 \
--alignIntronMax 1 \
--alignEndsType EndToEnd \
--readFilesIn /home/rtm/vivek/chipseq/fastq/VM1_1.fq.gz \
/home/rtm/vivek/chipseq/fastq/VM1_2.fq.gz \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix /home/rtm/vivek/chipseq/bam/Miz1_P92-1_

STAR --genomeDir /home/references/hg38/STAR_hg38_noAnnotation \
--readFilesCommand zcat \
--runThreadN 20 \
--alignIntronMax 1 \
--alignEndsType EndToEnd \
--readFilesIn /home/rtm/vivek/chipseq/fastq/VM2_1.fq.gz \
/home/rtm/vivek/chipseq/fastq/VM2_2.fq.gz \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix /home/rtm/vivek/chipseq/bam/Miz1_MP46_

STAR --genomeDir /home/references/hg38/STAR_hg38_noAnnotation \
--readFilesCommand zcat \
--runThreadN 20 \
--alignIntronMax 1 \
--alignEndsType EndToEnd \
--readFilesIn /home/rtm/vivek/chipseq/fastq/VM4_1.fq.gz \
/home/rtm/vivek/chipseq/fastq/VM4_2.fq.gz \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix /home/rtm/vivek/chipseq/bam/Myc_MP46_

STAR --genomeDir /home/references/hg38/STAR_hg38_noAnnotation \
--readFilesCommand zcat \
--runThreadN 20 \
--alignIntronMax 1 \
--alignEndsType EndToEnd \
--readFilesIn /home/rtm/vivek/chipseq/fastq/VM5_1.fq.gz \
/home/rtm/vivek/chipseq/fastq/VM5_2.fq.gz \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix /home/rtm/vivek/chipseq/bam/BAP1_Mel202_

STAR --genomeDir /home/references/hg38/STAR_hg38_noAnnotation \
--readFilesCommand zcat \
--runThreadN 20 \
--alignIntronMax 1 \
--alignEndsType EndToEnd \
--readFilesIn /home/rtm/vivek/chipseq/fastq/VM6_1.fq.gz \
/home/rtm/vivek/chipseq/fastq/VM6_2.fq.gz \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix /home/rtm/vivek/chipseq/bam/BAP1_P92-1_
#
STAR --genomeDir /home/references/hg38/STAR_hg38_noAnnotation \
--readFilesCommand zcat \
--runThreadN 20 \
--alignIntronMax 1 \
--alignEndsType EndToEnd \
--readFilesIn /home/rtm/vivek/chipseq/fastq/VM7_1.fq.gz \
/home/rtm/vivek/chipseq/fastq/VM7_2.fq.gz \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix /home/rtm/vivek/chipseq/bam/INPUT_P92-1_

STAR --genomeDir /home/references/hg38/STAR_hg38_noAnnotation \
--readFilesCommand zcat \
--runThreadN 20 \
--alignIntronMax 1 \
--alignEndsType EndToEnd \
--readFilesIn /home/rtm/vivek/chipseq/fastq/VM8_1.fq.gz \
/home/rtm/vivek/chipseq/fastq/VM8_2.fq.gz \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix /home/rtm/vivek/chipseq/bam/INPUT_Mel202_

STAR --genomeDir /home/references/hg38/STAR_hg38_noAnnotation \
--readFilesCommand zcat \
--runThreadN 20 \
--alignIntronMax 1 \
--alignEndsType EndToEnd \
--readFilesIn /home/rtm/vivek/chipseq/fastq/VM9_1.fq.gz \
/home/rtm/vivek/chipseq/fastq/VM9_2.fq.gz \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix /home/rtm/vivek/chipseq/bam/INPUT_MP46_
#################################################################
#grep -P "Number of input reads|Uniquely mapped reads number |Uniquely mapped reads %" *Log.final.out| \
#perl -pe 's/\s{2,}/\s/g'|perl -pe 's/\|/\t/g'
#################################################################

#ls -1 /home/rtm/vivek/chipseq/bam/*sortedByCoord.out.bam | perl -pe 's/(.+)\_Aligned.+/ \
#picard MarkDuplicates REMOVE_DUPLICATES=true \\ \
#I\=$1\_Aligned\.sortedByCoord\.out\.bam \\ \
#O\=$1\_rmdup\.bam \\ \
#M\=$1\_rmdup\.mfile
#/g'

java -jar /home/rtm/myprograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/home/rtm/vivek/chipseq/bam/BAP1_Mel202_Aligned.sortedByCoord.out.bam \
O=/home/rtm/vivek/chipseq/bam/BAP1_Mel202_rmdup.bam \
M=/home/rtm/vivek/chipseq/bam/BAP1_Mel202_rmdup.mfile

samtools index /home/rtm/vivek/chipseq/bam/BAP1_Mel202_rmdup.bam

java -jar /home/rtm/myprograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/home/rtm/vivek/chipseq/bam/BAP1_P92-1_Aligned.sortedByCoord.out.bam \
O=/home/rtm/vivek/chipseq/bam/BAP1_P92-1_rmdup.bam \
M=/home/rtm/vivek/chipseq/bam/BAP1_P92-1_rmdup.mfile

samtools index /home/rtm/vivek/chipseq/bam/BAP1_P92-1_rmdup.bam

java -jar /home/rtm/myprograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/home/rtm/vivek/chipseq/bam/INPUT_Mel202_Aligned.sortedByCoord.out.bam \
O=/home/rtm/vivek/chipseq/bam/INPUT_Mel202_rmdup.bam \
M=/home/rtm/vivek/chipseq/bam/INPUT_Mel202_rmdup.mfile

samtools index /home/rtm/vivek/chipseq/bam/INPUT_Mel202_rmdup.bam

java -jar /home/rtm/myprograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/home/rtm/vivek/chipseq/bam/INPUT_MP46_Aligned.sortedByCoord.out.bam \
O=/home/rtm/vivek/chipseq/bam/INPUT_MP46_rmdup.bam \
M=/home/rtm/vivek/chipseq/bam/INPUT_MP46_rmdup.mfile

samtools index /home/rtm/vivek/chipseq/bam/INPUT_MP46_rmdup.bam

java -jar /home/rtm/myprograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/home/rtm/vivek/chipseq/bam/INPUT_P92-1_Aligned.sortedByCoord.out.bam \
O=/home/rtm/vivek/chipseq/bam/INPUT_P92-1_rmdup.bam \
M=/home/rtm/vivek/chipseq/bam/INPUT_P92-1_rmdup.mfile

samtools index /home/rtm/vivek/chipseq/bam/INPUT_P92-1_rmdup.bam

java -jar /home/rtm/myprograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/home/rtm/vivek/chipseq/bam/Miz1_MP46_Aligned.sortedByCoord.out.bam \
O=/home/rtm/vivek/chipseq/bam/Miz1_MP46_rmdup.bam \
M=/home/rtm/vivek/chipseq/bam/Miz1_MP46_rmdup.mfile

samtools index /home/rtm/vivek/chipseq/bam/Miz1_MP46_rmdup.bam

java -jar /home/rtm/myprograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/home/rtm/vivek/chipseq/bam/Miz1_P92-1_Aligned.sortedByCoord.out.bam \
O=/home/rtm/vivek/chipseq/bam/Miz1_P92-1_rmdup.bam \
M=/home/rtm/vivek/chipseq/bam/Miz1_P92-1_rmdup.mfile

samtools index /home/rtm/vivek/chipseq/bam/Miz1_P92-1_rmdup.bam

java -jar /home/rtm/myprograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=/home/rtm/vivek/chipseq/bam/Myc_MP46_Aligned.sortedByCoord.out.bam \
O=/home/rtm/vivek/chipseq/bam/Myc_MP46_rmdup.bam \
M=/home/rtm/vivek/chipseq/bam/Myc_MP46_rmdup.mfile

samtools index /home/rtm/vivek/chipseq/bam/Myc_MP46_rmdup.bam
##############################################################################
macs2 callpeak -f BAMPE -g hs -q 0.05 --keep-dup auto --call-summits -n Miz1_P92-1 --outdir /home/rtm/vivek/chipseq/macs2 \
-t /home/rtm/vivek/chipseq/bam/Miz1_P92-1_rmdup.bam -c /home/rtm/vivek/chipseq/bam/INPUT_P92-1_rmdup.bam &

macs2 callpeak -f BAMPE -g hs -q 0.05 --keep-dup auto --call-summits -n BAP1_P92-1 --outdir /home/rtm/vivek/chipseq/macs2 \
-t /home/rtm/vivek/chipseq/bam/BAP1_P92-1_rmdup.bam -c /home/rtm/vivek/chipseq/bam/INPUT_P92-1_rmdup.bam &
#
macs2 callpeak -f BAMPE -g hs -q 0.05 --keep-dup auto --call-summits -n Miz1_MP46 --outdir /home/rtm/vivek/chipseq/macs2 \
-t /home/rtm/vivek/chipseq/bam/Miz1_MP46_rmdup.bam -c /home/rtm/vivek/chipseq/bam/INPUT_MP46_rmdup.bam &

macs2 callpeak -f BAMPE -g hs -q 0.05 --keep-dup auto --call-summits -n Myc_MP46 --outdir /home/rtm/vivek/chipseq/macs2 \
-t /home/rtm/vivek/chipseq/bam/Myc_MP46_rmdup.bam -c /home/rtm/vivek/chipseq/bam/INPUT_MP46_rmdup.bam &
#
macs2 callpeak -f BAMPE -g hs -q 0.05 --keep-dup auto --call-summits -n BAP1_Mel202 --outdir /home/rtm/vivek/chipseq/macs2 \
-t /home/rtm/vivek/chipseq/bam/BAP1_Mel202_rmdup.bam -c /home/rtm/vivek/chipseq/bam/INPUT_Mel202_rmdup.bam &
##############################################################################

bamCoverage -p max -bs 1 --normalizeUsing CPM -b /home/rtm/vivek/chipseq/bam/Miz1_P92-1_rmdup.bam \
-o /home/rtm/vivek/chipseq/bw/Miz1_P92-1.bw

bamCoverage -p max -bs 1 --normalizeUsing CPM -b /home/rtm/vivek/chipseq/bam/BAP1_P92-1_rmdup.bam \
-o /home/rtm/vivek/chipseq/bw/BAP1_P92-1.bw

bamCoverage -p max -bs 1 --normalizeUsing CPM -b /home/rtm/vivek/chipseq/bam/Miz1_MP46_rmdup.bam \
-o /home/rtm/vivek/chipseq/bw/Miz1_MP46.bw

bamCoverage -p max -bs 1 --normalizeUsing CPM -b /home/rtm/vivek/chipseq/bam/Myc_MP46_rmdup.bam \
-o /home/rtm/vivek/chipseq/bw/Myc_MP46.bw

bamCoverage -p max -bs 1 --normalizeUsing CPM -b /home/rtm/vivek/chipseq/bam/BAP1_Mel202_rmdup.bam \
-o /home/rtm/vivek/chipseq/bw/BAP1_Mel202.bw

#################################################################################


