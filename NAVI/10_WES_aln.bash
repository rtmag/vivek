bwa mem -t 23 -T 0 \
-R '@RG\tID:VN19\tSM:BATCH1' \
/home/references/bwa_hg38/hg38.fasta \
/home/rtm/vivek/navi/wes/fastq_trim/VM19_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM19_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes/bam/VM19 -

bwa mem -t 23 -T 0 \
-R '@RG\tID:VN1\tSM:BATCH1' \
/home/references/bwa_hg38/hg38.fasta \
/home/rtm/vivek/navi/wes/fastq_trim/VM1_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM1_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes/bam/VM1 -

bwa mem -t 23 -T 0 \
-R '@RG\tID:VN20\tSM:BATCH1' \
/home/references/bwa_hg38/hg38.fasta \
/home/rtm/vivek/navi/wes/fastq_trim/VM20_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM20_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes/bam/VM20 -

bwa mem -t 23 -T 0 \
-R '@RG\tID:VN25\tSM:BATCH1' \
/home/references/bwa_hg38/hg38.fasta \
/home/rtm/vivek/navi/wes/fastq_trim/VM25_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM25_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes/bam/VM25 -

bwa mem -t 23 -T 0 \
-R '@RG\tID:VN26\tSM:BATCH1' \
/home/references/bwa_hg38/hg38.fasta \
/home/rtm/vivek/navi/wes/fastq_trim/VM26_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM26_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes/bam/VM26 -

bwa mem -t 23 -T 0 \
-R '@RG\tID:VN2\tSM:BATCH1' \
/home/references/bwa_hg38/hg38.fasta \
/home/rtm/vivek/navi/wes/fastq_trim/VM2_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM2_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes/bam/VM2 -

bwa mem -t 23 -T 0 \
-R '@RG\tID:VN31\tSM:BATCH1' \
/home/references/bwa_hg38/hg38.fasta \
/home/rtm/vivek/navi/wes/fastq_trim/VM31_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM31_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes/bam/VM31 -

bwa mem -t 23 -T 0 \
-R '@RG\tID:VN32\tSM:BATCH1' \
/home/references/bwa_hg38/hg38.fasta \
/home/rtm/vivek/navi/wes/fastq_trim/VM32_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM32_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes/bam/VM32 -

bwa mem -t 23 -T 0 \
-R '@RG\tID:VN33\tSM:BATCH1' \
/home/references/bwa_hg38/hg38.fasta \
/home/rtm/vivek/navi/wes/fastq_trim/VM33_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM33_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes/bam/VM33 -

bwa mem -t 23 -T 0 \
-R '@RG\tID:VN34\tSM:BATCH1' \
/home/references/bwa_hg38/hg38.fasta \
/home/rtm/vivek/navi/wes/fastq_trim/VM34_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM34_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes/bam/VM34 -

bwa mem -t 23 -T 0 \
-R '@RG\tID:VN3\tSM:BATCH1' \
/home/references/bwa_hg38/hg38.fasta \
/home/rtm/vivek/navi/wes/fastq_trim/VM3_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM3_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes/bam/VM3 -

bwa mem -t 23 -T 0 \
-R '@RG\tID:VN43\tSM:BATCH1' \
/home/references/bwa_hg38/hg38.fasta \
/home/rtm/vivek/navi/wes/fastq_trim/VM43_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM43_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes/bam/VM43 -

bwa mem -t 23 -T 0 \
-R '@RG\tID:VN44\tSM:BATCH1' \
/home/references/bwa_hg38/hg38.fasta \
/home/rtm/vivek/navi/wes/fastq_trim/VM44_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM44_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes/bam/VM44 -

bwa mem -t 23 -T 0 \
-R '@RG\tID:VN7\tSM:BATCH1' \
/home/references/bwa_hg38/hg38.fasta \
/home/rtm/vivek/navi/wes/fastq_trim/VM7_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM7_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes/bam/VM7 -

bwa mem -t 23 -T 0 \
-R '@RG\tID:VN8\tSM:BATCH1' \
/home/references/bwa_hg38/hg38.fasta \
/home/rtm/vivek/navi/wes/fastq_trim/VM8_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM8_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes/bam/VM8 -

#######################################################################
# SORT
java -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=VM19 \
OUTPUT=VM19_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT &

java -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=VM1 \
OUTPUT=VM1_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT &

java -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=VM20 \
OUTPUT=VM20_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT &

java -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=VM25 \
OUTPUT=VM25_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT &

java -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=VM26 \
OUTPUT=VM26_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT &

java -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=VM2 \
OUTPUT=VM2_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT &

java -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=VM31 \
OUTPUT=VM31_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT &

java -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=VM32 \
OUTPUT=VM32_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT &

java -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=VM33 \
OUTPUT=VM33_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT &

java -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=VM34 \
OUTPUT=VM34_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT &

java -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=VM3 \
OUTPUT=VM3_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT &

java -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=VM43 \
OUTPUT=VM43_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT &

java -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=VM44 \
OUTPUT=VM44_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT &

java -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=VM4 \
OUTPUT=VM4_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT &

java -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=VM7 \
OUTPUT=VM7_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT &

java -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=VM8 \
OUTPUT=VM8_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT &
##########################################################################

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar MarkDuplicates \
VALIDATION_STRINGENCY=STRICT \
CREATE_INDEX=true \
M=VM19_MFILE.txt \
INPUT=VM19_sort.bam \
OUTPUT=VM19_rmdup.bam 

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar MarkDuplicates \
VALIDATION_STRINGENCY=STRICT \
CREATE_INDEX=true \
M=VM1_MFILE.txt \
INPUT=VM1_sort.bam \
OUTPUT=VM1_rmdup.bam 

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar MarkDuplicates \
VALIDATION_STRINGENCY=STRICT \
CREATE_INDEX=true \
M=VM20_MFILE.txt \
INPUT=VM20_sort.bam \
OUTPUT=VM20_rmdup.bam 

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar MarkDuplicates \
VALIDATION_STRINGENCY=STRICT \
CREATE_INDEX=true \
M=VM25_MFILE.txt \
INPUT=VM25_sort.bam \
OUTPUT=VM25_rmdup.bam 

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar MarkDuplicates \
VALIDATION_STRINGENCY=STRICT \
CREATE_INDEX=true \
M=VM26_MFILE.txt \
INPUT=VM26_sort.bam \
OUTPUT=VM26_rmdup.bam 

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar MarkDuplicates \
VALIDATION_STRINGENCY=STRICT \
CREATE_INDEX=true \
M=VM2_MFILE.txt \
INPUT=VM2_sort.bam \
OUTPUT=VM2_rmdup.bam 

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar MarkDuplicates \
VALIDATION_STRINGENCY=STRICT \
CREATE_INDEX=true \
M=VM31_MFILE.txt \
INPUT=VM31_sort.bam \
OUTPUT=VM31_rmdup.bam 

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar MarkDuplicates \
VALIDATION_STRINGENCY=STRICT \
CREATE_INDEX=true \
M=VM32_MFILE.txt \
INPUT=VM32_sort.bam \
OUTPUT=VM32_rmdup.bam 

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar MarkDuplicates \
VALIDATION_STRINGENCY=STRICT \
CREATE_INDEX=true \
M=VM33_MFILE.txt \
INPUT=VM33_sort.bam \
OUTPUT=VM33_rmdup.bam 

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar MarkDuplicates \
VALIDATION_STRINGENCY=STRICT \
CREATE_INDEX=true \
M=VM34_MFILE.txt \
INPUT=VM34_sort.bam \
OUTPUT=VM34_rmdup.bam 

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar MarkDuplicates \
VALIDATION_STRINGENCY=STRICT \
CREATE_INDEX=true \
M=VM43_MFILE.txt \
INPUT=VM43_sort.bam \
OUTPUT=VM43_rmdup.bam 

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar MarkDuplicates \
VALIDATION_STRINGENCY=STRICT \
CREATE_INDEX=true \
M=VM44_MFILE.txt \
INPUT=VM44_sort.bam \
OUTPUT=VM44_rmdup.bam 

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar MarkDuplicates \
VALIDATION_STRINGENCY=STRICT \
CREATE_INDEX=true \
M=VM4_MFILE.txt \
INPUT=VM4_sort.bam \
OUTPUT=VM4_rmdup.bam 

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar MarkDuplicates \
VALIDATION_STRINGENCY=STRICT \
CREATE_INDEX=true \
M=VM7_MFILE.txt \
INPUT=VM7_sort.bam \
OUTPUT=VM7_rmdup.bam 

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar MarkDuplicates \
VALIDATION_STRINGENCY=STRICT \
CREATE_INDEX=true \
M=VM8_MFILE.txt \
INPUT=VM8_sort.bam \
OUTPUT=VM8_rmdup.bam 
################################################################################################################
#DIR
java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar CreateSequenceDictionary \
R= /home/references/bwa_hg38/hg38.fasta \
O= /home/references/bwa_hg38/hg38.fasta.dict
# 
VM2_rmdup.bam
VM31_rmdup.bam
VM32_rmdup.bam
VM33_rmdup.bam
VM34_rmdup.bam
VM43_rmdup.bam
VM44_rmdup.bam
VM7_rmdup.bam
VM8_rmdup.bam

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T RealignerTargetCreator \
-R /home/references/bwa_hg38/hg38.fasta \
-nt 20 \
-known /home/references/hg38_bundle/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-I /home/rtm/vivek/navi/wes/bam/VM1_rmdup.bam \
-o /home/rtm/vivek/navi/wes/bam/VM1.realign_target.intervals

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T RealignerTargetCreator \
-R /home/references/bwa_hg38/hg38.fasta \
-nt 20 \
-known /home/references/hg38_bundle/Mills_and_1000G_gold_standard.indels.hg38.vcf \
/home/rtm/vivek/navi/wes/bam/VM20_rmdup.bam \
-o VM20.realign_target.intervals

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T RealignerTargetCreator \
-R /home/references/bwa_hg38/hg38.fasta \
-nt 20 \
-known /home/references/hg38_bundle/Mills_and_1000G_gold_standard.indels.hg38.vcf \
/home/rtm/vivek/navi/wes/bam/VM25_rmdup.bam \
-o VM25.realign_target.intervals

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T RealignerTargetCreator \
-R /home/references/bwa_hg38/hg38.fasta \
-nt 20 \
-known /home/references/hg38_bundle/Mills_and_1000G_gold_standard.indels.hg38.vcf \
/home/rtm/vivek/navi/wes/bam/VM26_rmdup.bam \
-o VM26.realign_target.intervals
########################################################################################################################
java -jar GenomeAnalysisTK.jar \
-T IndelRealigner \
-R <reference> \
-known <known_indels.vcf> \
-targetIntervals <realign_target.intervals> \
--noOriginalAlignmentTags \
[ -I <input.bam> ] \
-nWayOut <output.map>

java -jar GenomeAnalysisTK.jar \
-T BaseRecalibrator \
-R <reference> \
-I <input.bam> \
-knownSites <dbsnp.vcf>
-o <bqsr.grp>

java -jar GenomeAnalysisTK.jar \
-T PrintReads \
-R <reference> \
-I <input.bam> \
--BQSR <bqsr.grp> \
-o <output.bam>
