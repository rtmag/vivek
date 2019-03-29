bwa mem -t 23 -T 0 \
-R '@RG\tID:VM19\tSM:BATCH1' \
/home/references/broadhg38/bwa/Homo_sapiens_assembly38.fasta.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM19_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM19_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes/bam/VM19 -

bwa mem -t 23 -T 0 \
-R '@RG\tID:VM1\tSM:BATCH1' \
/home/references/broadhg38/bwa/Homo_sapiens_assembly38.fasta.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM1_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM1_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes/bam/VM1 -

bwa mem -t 23 -T 0 \
-R '@RG\tID:VM20\tSM:BATCH1' \
/home/references/broadhg38/bwa/Homo_sapiens_assembly38.fasta.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM20_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM20_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes/bam/VM20 -

bwa mem -t 23 -T 0 \
-R '@RG\tID:VM25\tSM:BATCH1' \
/home/references/broadhg38/bwa/Homo_sapiens_assembly38.fasta.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM25_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM25_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes/bam/VM25 -

bwa mem -t 23 -T 0 \
-R '@RG\tID:VM26\tSM:BATCH1' \
/home/references/broadhg38/bwa/Homo_sapiens_assembly38.fasta.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM26_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM26_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes/bam/VM26 -

bwa mem -t 23 -T 0 \
-R '@RG\tID:VM2\tSM:BATCH1' \
/home/references/broadhg38/bwa/Homo_sapiens_assembly38.fasta.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM2_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM2_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes/bam/VM2 -

bwa mem -t 23 -T 0 \
-R '@RG\tID:VM31\tSM:BATCH1' \
/home/references/broadhg38/bwa/Homo_sapiens_assembly38.fasta.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM31_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM31_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes/bam/VM31 -

bwa mem -t 23 -T 0 \
-R '@RG\tID:VM32\tSM:BATCH1' \
/home/references/broadhg38/bwa/Homo_sapiens_assembly38.fasta.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM32_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM32_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes/bam/VM32 -

bwa mem -t 23 -T 0 \
-R '@RG\tID:VM33\tSM:BATCH1' \
/home/references/broadhg38/bwa/Homo_sapiens_assembly38.fasta.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM33_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM33_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes/bam/VM33 -

bwa mem -t 23 -T 0 \
-R '@RG\tID:VM34\tSM:BATCH1' \
/home/references/broadhg38/bwa/Homo_sapiens_assembly38.fasta.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM34_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM34_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes/bam/VM34 -

bwa mem -t 23 -T 0 \
-R '@RG\tID:VM3\tSM:BATCH1' \
/home/references/broadhg38/bwa/Homo_sapiens_assembly38.fasta.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM3_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM3_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes/bam/VM3 -

bwa mem -t 23 -T 0 \
-R '@RG\tID:VM43\tSM:BATCH1' \
/home/references/broadhg38/bwa/Homo_sapiens_assembly38.fasta.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM43_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM43_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes/bam/VM43 -

bwa mem -t 23 -T 0 \
-R '@RG\tID:VM44\tSM:BATCH1' \
/home/references/broadhg38/bwa/Homo_sapiens_assembly38.fasta.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM44_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM44_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes/bam/VM44 -

bwa mem -t 23 -T 0 \
-R '@RG\tID:VM7\tSM:BATCH1' \
/home/references/broadhg38/bwa/Homo_sapiens_assembly38.fasta.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM7_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM7_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes/bam/VM7 -

bwa mem -t 23 -T 0 \
-R '@RG\tID:VM8\tSM:BATCH1' \
/home/references/broadhg38/bwa/Homo_sapiens_assembly38.fasta.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM8_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM8_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes/bam/VM8 -

#######################################################################
# SORT
java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=VM19 \
OUTPUT=VM19_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=VM1 \
OUTPUT=VM1_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=VM20 \
OUTPUT=VM20_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=VM25 \
OUTPUT=VM25_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=VM26 \
OUTPUT=VM26_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=VM2 \
OUTPUT=VM2_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=VM31 \
OUTPUT=VM31_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=VM32 \
OUTPUT=VM32_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=VM33 \
OUTPUT=VM33_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=VM34 \
OUTPUT=VM34_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=VM3 \
OUTPUT=VM3_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=VM43 \
OUTPUT=VM43_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=VM44 \
OUTPUT=VM44_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=VM4 \
OUTPUT=VM4_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=VM7 \
OUTPUT=VM7_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=VM8 \
OUTPUT=VM8_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT
##########################################################################
/home/rtm/myprograms/qualimap_v2.2.1/qualimap bamqc -bam VM19_sort.bam -outfile VM19_sort.pdf --java-mem-size=200G
/home/rtm/myprograms/qualimap_v2.2.1/qualimap bamqc -bam VM1_sort.bam -outfile VM1_sort.pdf --java-mem-size=200G
/home/rtm/myprograms/qualimap_v2.2.1/qualimap bamqc -bam VM20_sort.bam -outfile VM20_sort.pdf --java-mem-size=200G
/home/rtm/myprograms/qualimap_v2.2.1/qualimap bamqc -bam VM25_sort.bam -outfile VM25_sort.pdf --java-mem-size=200G
/home/rtm/myprograms/qualimap_v2.2.1/qualimap bamqc -bam VM26_sort.bam -outfile VM26_sort.pdf --java-mem-size=200G
/home/rtm/myprograms/qualimap_v2.2.1/qualimap bamqc -bam VM2_sort.bam -outfile VM2_sort.pdf --java-mem-size=200G
/home/rtm/myprograms/qualimap_v2.2.1/qualimap bamqc -bam VM31_sort.bam -outfile VM31_sort.pdf --java-mem-size=200G
/home/rtm/myprograms/qualimap_v2.2.1/qualimap bamqc -bam VM32_sort.bam -outfile VM32_sort.pdf --java-mem-size=200G
/home/rtm/myprograms/qualimap_v2.2.1/qualimap bamqc -bam VM33_sort.bam -outfile VM33_sort.pdf --java-mem-size=200G
/home/rtm/myprograms/qualimap_v2.2.1/qualimap bamqc -bam VM34_sort.bam -outfile VM34_sort.pdf --java-mem-size=200G
/home/rtm/myprograms/qualimap_v2.2.1/qualimap bamqc -bam VM3_sort.bam -outfile VM3_sort.pdf --java-mem-size=200G
/home/rtm/myprograms/qualimap_v2.2.1/qualimap bamqc -bam VM43_sort.bam -outfile VM43_sort.pdf --java-mem-size=200G
/home/rtm/myprograms/qualimap_v2.2.1/qualimap bamqc -bam VM44_sort.bam -outfile VM44_sort.pdf --java-mem-size=200G 
/home/rtm/myprograms/qualimap_v2.2.1/qualimap bamqc -bam VM7_sort.bam -outfile VM7_sort.pdf --java-mem-size=200G
/home/rtm/myprograms/qualimap_v2.2.1/qualimap bamqc -bam VM8_sort.bam -outfile VM8_sort.pdf --java-mem-size=200G
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

sudo java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T RealignerTargetCreator \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-nt 20 \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-I /home/rtm/vivek/navi/wes/bam/VM1_rmdup.bam \
-o /home/rtm/vivek/navi/wes/bam/VM1.realign_target.intervals

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T RealignerTargetCreator \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-nt 20 \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-I /home/rtm/vivek/navi/wes/bam/VM2_rmdup.bam \
-o /home/rtm/vivek/navi/wes/bam/VM2.realign_target.intervals

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T RealignerTargetCreator \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-nt 20 \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-I /home/rtm/vivek/navi/wes/bam/VM19_rmdup.bam \
-o /home/rtm/vivek/navi/wes/bam/VM19.realign_target.intervals

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T RealignerTargetCreator \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-nt 20 \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-I /home/rtm/vivek/navi/wes/bam/VM20_rmdup.bam \
-o /home/rtm/vivek/navi/wes/bam/VM20.realign_target.intervals

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T RealignerTargetCreator \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-nt 20 \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-I /home/rtm/vivek/navi/wes/bam/VM25_rmdup.bam \
-o /home/rtm/vivek/navi/wes/bam/VM25.realign_target.intervals

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T RealignerTargetCreator \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-nt 20 \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-I /home/rtm/vivek/navi/wes/bam/VM26_rmdup.bam \
-o /home/rtm/vivek/navi/wes/bam/VM26.realign_target.intervals

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T RealignerTargetCreator \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-nt 20 \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-I /home/rtm/vivek/navi/wes/bam/VM31_rmdup.bam \
-o /home/rtm/vivek/navi/wes/bam/VM31.realign_target.intervals

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T RealignerTargetCreator \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-nt 20 \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-I /home/rtm/vivek/navi/wes/bam/VM32_rmdup.bam \
-o /home/rtm/vivek/navi/wes/bam/VM32.realign_target.intervals

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T RealignerTargetCreator \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-nt 20 \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-I /home/rtm/vivek/navi/wes/bam/VM33_rmdup.bam \
-o /home/rtm/vivek/navi/wes/bam/VM33.realign_target.intervals

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T RealignerTargetCreator \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-nt 20 \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-I /home/rtm/vivek/navi/wes/bam/VM34_rmdup.bam \
-o /home/rtm/vivek/navi/wes/bam/VM34.realign_target.intervals

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T RealignerTargetCreator \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-nt 20 \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-I /home/rtm/vivek/navi/wes/bam/VM43_rmdup.bam \
-o /home/rtm/vivek/navi/wes/bam/VM43.realign_target.intervals

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T RealignerTargetCreator \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-nt 20 \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-I /home/rtm/vivek/navi/wes/bam/VM44_rmdup.bam \
-o /home/rtm/vivek/navi/wes/bam/VM44.realign_target.intervals

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T RealignerTargetCreator \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-nt 20 \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-I /home/rtm/vivek/navi/wes/bam/VM7_rmdup.bam \
-o /home/rtm/vivek/navi/wes/bam/VM7.realign_target.intervals

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T RealignerTargetCreator \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-nt 20 \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-I /home/rtm/vivek/navi/wes/bam/VM8_rmdup.bam \
-o /home/rtm/vivek/navi/wes/bam/VM8.realign_target.intervals
################################################################################################################
java -Xmx200g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T IndelRealigner \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-targetIntervals /home/rtm/vivek/navi/wes/bam/VM1.realign_target.intervals \
--noOriginalAlignmentTags \
-I /home/rtm/vivek/navi/wes/bam/VM1_rmdup.bam \
--out /home/rtm/vivek/navi/wes/bam/VM1_realigned.bam

java -Xmx200g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T IndelRealigner \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-targetIntervals /home/rtm/vivek/navi/wes/bam/VM2.realign_target.intervals \
--noOriginalAlignmentTags \
-I /home/rtm/vivek/navi/wes/bam/VM2_rmdup.bam \
--out /home/rtm/vivek/navi/wes/bam/VM2_realigned.bam

java -Xmx200g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T IndelRealigner \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-targetIntervals /home/rtm/vivek/navi/wes/bam/VM19.realign_target.intervals \
--noOriginalAlignmentTags \
-I /home/rtm/vivek/navi/wes/bam/VM19_rmdup.bam \
--out /home/rtm/vivek/navi/wes/bam/VM19_realigned.bam

java -Xmx200g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T IndelRealigner \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-targetIntervals /home/rtm/vivek/navi/wes/bam/VM20.realign_target.intervals \
--noOriginalAlignmentTags \
-I /home/rtm/vivek/navi/wes/bam/VM20_rmdup.bam \
--out /home/rtm/vivek/navi/wes/bam/VM20_realigned.bam

java -Xmx200g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T IndelRealigner \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-targetIntervals /home/rtm/vivek/navi/wes/bam/VM25.realign_target.intervals \
--noOriginalAlignmentTags \
-I /home/rtm/vivek/navi/wes/bam/VM25_rmdup.bam \
--out /home/rtm/vivek/navi/wes/bam/VM25_realigned.bam

java -Xmx200g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T IndelRealigner \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-targetIntervals /home/rtm/vivek/navi/wes/bam/VM26.realign_target.intervals \
--noOriginalAlignmentTags \
-I /home/rtm/vivek/navi/wes/bam/VM26_rmdup.bam \
--out /home/rtm/vivek/navi/wes/bam/VM26_realigned.bam

java -Xmx200g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T IndelRealigner \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-targetIntervals /home/rtm/vivek/navi/wes/bam/VM31.realign_target.intervals \
--noOriginalAlignmentTags \
-I /home/rtm/vivek/navi/wes/bam/VM31_rmdup.bam \
--out /home/rtm/vivek/navi/wes/bam/VM31_realigned.bam

java -Xmx200g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T IndelRealigner \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-targetIntervals /home/rtm/vivek/navi/wes/bam/VM32.realign_target.intervals \
--noOriginalAlignmentTags \
-I /home/rtm/vivek/navi/wes/bam/VM32_rmdup.bam \
--out /home/rtm/vivek/navi/wes/bam/VM32_realigned.bam

java -Xmx200g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T IndelRealigner \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-targetIntervals /home/rtm/vivek/navi/wes/bam/VM33.realign_target.intervals \
--noOriginalAlignmentTags \
-I /home/rtm/vivek/navi/wes/bam/VM33_rmdup.bam \
--out /home/rtm/vivek/navi/wes/bam/VM33_realigned.bam

java -Xmx200g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T IndelRealigner \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-targetIntervals /home/rtm/vivek/navi/wes/bam/VM34.realign_target.intervals \
--noOriginalAlignmentTags \
-I /home/rtm/vivek/navi/wes/bam/VM34_rmdup.bam \
--out /home/rtm/vivek/navi/wes/bam/VM34_realigned.bam

java -Xmx200g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T IndelRealigner \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-targetIntervals /home/rtm/vivek/navi/wes/bam/VM43.realign_target.intervals \
--noOriginalAlignmentTags \
-I /home/rtm/vivek/navi/wes/bam/VM43_rmdup.bam \
--out /home/rtm/vivek/navi/wes/bam/VM43_realigned.bam

java -Xmx200g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T IndelRealigner \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-targetIntervals /home/rtm/vivek/navi/wes/bam/VM44.realign_target.intervals \
--noOriginalAlignmentTags \
-I /home/rtm/vivek/navi/wes/bam/VM44_rmdup.bam \
--out /home/rtm/vivek/navi/wes/bam/VM44_realigned.bam

java -Xmx200g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T IndelRealigner \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-targetIntervals /home/rtm/vivek/navi/wes/bam/VM7.realign_target.intervals \
--noOriginalAlignmentTags \
-I /home/rtm/vivek/navi/wes/bam/VM7_rmdup.bam \
--out /home/rtm/vivek/navi/wes/bam/VM7_realigned.bam

java -Xmx200g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T IndelRealigner \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-targetIntervals /home/rtm/vivek/navi/wes/bam/VM8.realign_target.intervals \
--noOriginalAlignmentTags \
-I /home/rtm/vivek/navi/wes/bam/VM8_rmdup.bam \
--out /home/rtm/vivek/navi/wes/bam/VM8_realigned.bam
####################################################################################################################################
####################################################################################################################################
java -Xmx10g -jar /home/rtm/myprograms/picard/build/libs/picard.jar AddOrReplaceReadGroups \
INPUT=/home/rtm/vivek/navi/wes/bam/VM1_realigned.bam \
OUTPUT=/home/rtm/vivek/navi/wes/bam/VM1_realigned.addRG.bam \
RGID=VM1 RGLB=WES RGPL=illumina RGPU=NULL RGSM=VM1 CREATE_INDEX=true &

java -Xmx10g -jar /home/rtm/myprograms/picard/build/libs/picard.jar AddOrReplaceReadGroups \
INPUT=/home/rtm/vivek/navi/wes/bam/VM2_realigned.bam \
OUTPUT=/home/rtm/vivek/navi/wes/bam/VM2_realigned.addRG.bam \
RGID=VM2 RGLB=WES RGPL=illumina RGPU=NULL RGSM=VM2 CREATE_INDEX=true &

java -Xmx10g -jar /home/rtm/myprograms/picard/build/libs/picard.jar AddOrReplaceReadGroups \
INPUT=/home/rtm/vivek/navi/wes/bam/VM19_realigned.bam \
OUTPUT=/home/rtm/vivek/navi/wes/bam/VM19_realigned.addRG.bam \
RGID=VM19 RGLB=WES RGPL=illumina RGPU=NULL RGSM=VM19 CREATE_INDEX=true &

java -Xmx10g -jar /home/rtm/myprograms/picard/build/libs/picard.jar AddOrReplaceReadGroups \
INPUT=/home/rtm/vivek/navi/wes/bam/VM20_realigned.bam \
OUTPUT=/home/rtm/vivek/navi/wes/bam/VM20_realigned.addRG.bam \
RGID=VM20 RGLB=WES RGPL=illumina RGPU=NULL RGSM=VM20 CREATE_INDEX=true &

java -Xmx10g -jar /home/rtm/myprograms/picard/build/libs/picard.jar AddOrReplaceReadGroups \
INPUT=/home/rtm/vivek/navi/wes/bam/VM25_realigned.bam \
OUTPUT=/home/rtm/vivek/navi/wes/bam/VM25_realigned.addRG.bam \
RGID=VM25 RGLB=WES RGPL=illumina RGPU=NULL RGSM=VM25 CREATE_INDEX=true &

java -Xmx10g -jar /home/rtm/myprograms/picard/build/libs/picard.jar AddOrReplaceReadGroups \
INPUT=/home/rtm/vivek/navi/wes/bam/VM26_realigned.bam \
OUTPUT=/home/rtm/vivek/navi/wes/bam/VM26_realigned.addRG.bam \
RGID=VM26 RGLB=WES RGPL=illumina RGPU=NULL RGSM=VM26 CREATE_INDEX=true &

java -Xmx10g -jar /home/rtm/myprograms/picard/build/libs/picard.jar AddOrReplaceReadGroups \
INPUT=/home/rtm/vivek/navi/wes/bam/VM31_realigned.bam \
OUTPUT=/home/rtm/vivek/navi/wes/bam/VM31_realigned.addRG.bam \
RGID=VM31 RGLB=WES RGPL=illumina RGPU=NULL RGSM=VM31 CREATE_INDEX=true &

java -Xmx10g -jar /home/rtm/myprograms/picard/build/libs/picard.jar AddOrReplaceReadGroups \
INPUT=/home/rtm/vivek/navi/wes/bam/VM32_realigned.bam \
OUTPUT=/home/rtm/vivek/navi/wes/bam/VM32_realigned.addRG.bam \
RGID=VM32 RGLB=WES RGPL=illumina RGPU=NULL RGSM=VM32 CREATE_INDEX=true &

java -Xmx10g -jar /home/rtm/myprograms/picard/build/libs/picard.jar AddOrReplaceReadGroups \
INPUT=/home/rtm/vivek/navi/wes/bam/VM33_realigned.bam \
OUTPUT=/home/rtm/vivek/navi/wes/bam/VM33_realigned.addRG.bam \
RGID=VM33 RGLB=WES RGPL=illumina RGPU=NULL RGSM=VM33 CREATE_INDEX=true &

java -Xmx10g -jar /home/rtm/myprograms/picard/build/libs/picard.jar AddOrReplaceReadGroups \
INPUT=/home/rtm/vivek/navi/wes/bam/VM34_realigned.bam \
OUTPUT=/home/rtm/vivek/navi/wes/bam/VM34_realigned.addRG.bam \
RGID=VM34 RGLB=WES RGPL=illumina RGPU=NULL RGSM=VM34 CREATE_INDEX=true &

java -Xmx10g -jar /home/rtm/myprograms/picard/build/libs/picard.jar AddOrReplaceReadGroups \
INPUT=/home/rtm/vivek/navi/wes/bam/VM43_realigned.bam \
OUTPUT=/home/rtm/vivek/navi/wes/bam/VM43_realigned.addRG.bam \
RGID=VM43 RGLB=WES RGPL=illumina RGPU=NULL RGSM=VM43 CREATE_INDEX=true &

java -Xmx10g -jar /home/rtm/myprograms/picard/build/libs/picard.jar AddOrReplaceReadGroups \
INPUT=/home/rtm/vivek/navi/wes/bam/VM44_realigned.bam \
OUTPUT=/home/rtm/vivek/navi/wes/bam/VM44_realigned.addRG.bam \
RGID=VM44 RGLB=WES RGPL=illumina RGPU=NULL RGSM=VM44 CREATE_INDEX=true &

java -Xmx10g -jar /home/rtm/myprograms/picard/build/libs/picard.jar AddOrReplaceReadGroups \
INPUT=/home/rtm/vivek/navi/wes/bam/VM7_realigned.bam \
OUTPUT=/home/rtm/vivek/navi/wes/bam/VM7_realigned.addRG.bam \
RGID=VM7 RGLB=WES RGPL=illumina RGPU=NULL RGSM=VM7 CREATE_INDEX=true &

java -Xmx10g -jar /home/rtm/myprograms/picard/build/libs/picard.jar AddOrReplaceReadGroups \
INPUT=/home/rtm/vivek/navi/wes/bam/VM8_realigned.bam \
OUTPUT=/home/rtm/vivek/navi/wes/bam/VM8_realigned.addRG.bam \
RGID=VM8 RGLB=WES RGPL=illumina RGPU=NULL RGSM=VM8 CREATE_INDEX=true &

####################################################################################################################################
####################################################################################################################################
java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T BaseRecalibrator \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM1_realigned.addRG.bam \
-knownSites /home/references/broadhg38/broad_hg38/dbsnp_146.hg38.vcf \
-o /home/rtm/vivek/navi/wes/bam/VM1.bqsr.grp

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T BaseRecalibrator \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM2_realigned.addRG.bam \
-knownSites /home/references/broadhg38/broad_hg38/dbsnp_146.hg38.vcf \
-o /home/rtm/vivek/navi/wes/bam/VM2.bqsr.grp

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T BaseRecalibrator \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM19_realigned.addRG.bam \
-knownSites /home/references/broadhg38/broad_hg38/dbsnp_146.hg38.vcf \
-o /home/rtm/vivek/navi/wes/bam/VM19.bqsr.grp

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T BaseRecalibrator \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM20_realigned.addRG.bam \
-knownSites /home/references/broadhg38/broad_hg38/dbsnp_146.hg38.vcf \
-o /home/rtm/vivek/navi/wes/bam/VM20.bqsr.grp

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T BaseRecalibrator \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM25_realigned.addRG.bam \
-knownSites /home/references/broadhg38/broad_hg38/dbsnp_146.hg38.vcf \
-o /home/rtm/vivek/navi/wes/bam/VM25.bqsr.grp

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T BaseRecalibrator \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM26_realigned.addRG.bam \
-knownSites /home/references/broadhg38/broad_hg38/dbsnp_146.hg38.vcf \
-o /home/rtm/vivek/navi/wes/bam/VM26.bqsr.grp

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T BaseRecalibrator \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM31_realigned.addRG.bam \
-knownSites /home/references/broadhg38/broad_hg38/dbsnp_146.hg38.vcf \
-o /home/rtm/vivek/navi/wes/bam/VM31.bqsr.grp

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T BaseRecalibrator \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM32_realigned.addRG.bam \
-knownSites /home/references/broadhg38/broad_hg38/dbsnp_146.hg38.vcf \
-o /home/rtm/vivek/navi/wes/bam/VM32.bqsr.grp

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T BaseRecalibrator \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM33_realigned.addRG.bam \
-knownSites /home/references/broadhg38/broad_hg38/dbsnp_146.hg38.vcf \
-o /home/rtm/vivek/navi/wes/bam/VM33.bqsr.grp

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T BaseRecalibrator \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM34_realigned.addRG.bam \
-knownSites /home/references/broadhg38/broad_hg38/dbsnp_146.hg38.vcf \
-o /home/rtm/vivek/navi/wes/bam/VM34.bqsr.grp

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T BaseRecalibrator \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM43_realigned.addRG.bam \
-knownSites /home/references/broadhg38/broad_hg38/dbsnp_146.hg38.vcf \
-o /home/rtm/vivek/navi/wes/bam/VM43.bqsr.grp

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T BaseRecalibrator \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM44_realigned.addRG.bam \
-knownSites /home/references/broadhg38/broad_hg38/dbsnp_146.hg38.vcf \
-o /home/rtm/vivek/navi/wes/bam/VM44.bqsr.grp

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T BaseRecalibrator \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM7_realigned.addRG.bam \
-knownSites /home/references/broadhg38/broad_hg38/dbsnp_146.hg38.vcf \
-o /home/rtm/vivek/navi/wes/bam/VM7.bqsr.grp

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T BaseRecalibrator \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM8_realigned.addRG.bam \
-knownSites /home/references/broadhg38/broad_hg38/dbsnp_146.hg38.vcf \
-o /home/rtm/vivek/navi/wes/bam/VM8.bqsr.grp
####################################################################################################################################

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T PrintReads \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM1_realigned.addRG.bam \
--BQSR /home/rtm/vivek/navi/wes/bam/VM1.bqsr.grp \
-o /home/rtm/vivek/navi/wes/bam/VM1_recalibrated.bam

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T PrintReads \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM2_realigned.addRG.bam \
--BQSR /home/rtm/vivek/navi/wes/bam/VM2.bqsr.grp \
-o /home/rtm/vivek/navi/wes/bam/VM2_recalibrated.bam

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T PrintReads \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM19_realigned.addRG.bam \
--BQSR /home/rtm/vivek/navi/wes/bam/VM19.bqsr.grp \
-o /home/rtm/vivek/navi/wes/bam/VM19_recalibrated.bam

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T PrintReads \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM20_realigned.addRG.bam \
--BQSR /home/rtm/vivek/navi/wes/bam/VM20.bqsr.grp \
-o /home/rtm/vivek/navi/wes/bam/VM20_recalibrated.bam

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T PrintReads \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM25_realigned.addRG.bam \
--BQSR /home/rtm/vivek/navi/wes/bam/VM25.bqsr.grp \
-o /home/rtm/vivek/navi/wes/bam/VM25_recalibrated.bam

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T PrintReads \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM26_realigned.addRG.bam \
--BQSR /home/rtm/vivek/navi/wes/bam/VM26.bqsr.grp \
-o /home/rtm/vivek/navi/wes/bam/VM26_recalibrated.bam

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T PrintReads \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM31_realigned.addRG.bam \
--BQSR /home/rtm/vivek/navi/wes/bam/VM31.bqsr.grp \
-o /home/rtm/vivek/navi/wes/bam/VM31_recalibrated.bam

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T PrintReads \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM32_realigned.addRG.bam \
--BQSR /home/rtm/vivek/navi/wes/bam/VM32.bqsr.grp \
-o /home/rtm/vivek/navi/wes/bam/VM32_recalibrated.bam

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T PrintReads \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM33_realigned.addRG.bam \
--BQSR /home/rtm/vivek/navi/wes/bam/VM33.bqsr.grp \
-o /home/rtm/vivek/navi/wes/bam/VM33_recalibrated.bam

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T PrintReads \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM34_realigned.addRG.bam \
--BQSR /home/rtm/vivek/navi/wes/bam/VM34.bqsr.grp \
-o /home/rtm/vivek/navi/wes/bam/VM34_recalibrated.bam

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T PrintReads \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM43_realigned.addRG.bam \
--BQSR /home/rtm/vivek/navi/wes/bam/VM43.bqsr.grp \
-o /home/rtm/vivek/navi/wes/bam/VM43_recalibrated.bam

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T PrintReads \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM44_realigned.addRG.bam \
--BQSR /home/rtm/vivek/navi/wes/bam/VM44.bqsr.grp \
-o /home/rtm/vivek/navi/wes/bam/VM44_recalibrated.bam

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T PrintReads \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM7_realigned.addRG.bam \
--BQSR /home/rtm/vivek/navi/wes/bam/VM7.bqsr.grp \
-o /home/rtm/vivek/navi/wes/bam/VM7_recalibrated.bam

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T PrintReads \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM8_realigned.addRG.bam \
--BQSR /home/rtm/vivek/navi/wes/bam/VM8.bqsr.grp \
-o /home/rtm/vivek/navi/wes/bam/VM8_recalibrated.bam
