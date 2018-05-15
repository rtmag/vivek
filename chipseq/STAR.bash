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
