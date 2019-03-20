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
VALIDATION_STRINGENCY=STRICT

java -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=VM1 \
OUTPUT=VM1_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT

java -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=VM20 \
OUTPUT=VM20_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT

java -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=VM25 \
OUTPUT=VM25_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT

java -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=VM26 \
OUTPUT=VM26_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT

java -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=VM2 \
OUTPUT=VM2_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT

java -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=VM31 \
OUTPUT=VM31_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT

java -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=VM32 \
OUTPUT=VM32_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT

java -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=VM33 \
OUTPUT=VM33_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT

java -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=VM34 \
OUTPUT=VM34_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT

java -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=VM3 \
OUTPUT=VM3_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT

java -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=VM43 \
OUTPUT=VM43_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT

java -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=VM44 \
OUTPUT=VM44_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT

java -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=VM4 \
OUTPUT=VM4_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT

java -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=VM7 \
OUTPUT=VM7_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT

java -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=VM8 \
OUTPUT=VM8_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT
##########################################################################
VM19
VM1
VM20
VM25
VM26
VM2
VM31
VM32
VM33
VM34
VM3
VM43
VM44
VM4
VM7
VM8

java -Xmx60g -jar /home/rtm/myprograms/picard/build/libs/picard.jar MarkDuplicates \
VALIDATION_STRINGENCY=STRICT \
CREATE_INDEX=true \
M=VM19_rmdup.txt \
INPUT=VM19_sort.bam \
OUTPUT=HCT116_DMSO_48h_addRG_realigned_recalibrated_rmdup.bam


java -jar picard.jar MarkDuplicates \
CREATE_INDEX=true \
INPUT=<input.bam> \
VALIDATION_STRINGENCY=STRICT
