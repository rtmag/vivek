##################### VM3 stopped after sort ####################

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar MarkDuplicates \
VALIDATION_STRINGENCY=STRICT \
CREATE_INDEX=true \
M=/home/rtm/vivek/navi/wes/bam/VM3.MFILE.txt \
INPUT=/home/rtm/vivek/navi/wes/bam/VM3_sort.bam \
OUTPUT=/home/rtm/vivek/navi/wes/bam/VM3.rmdup.sort.bam ;

############################# Target intervals #############################
java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T RealignerTargetCreator \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-nt 20 \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-I /home/rtm/vivek/navi/wes/bam/VM3.rmdup.sort.bam \
-o /home/rtm/vivek/navi/wes/bam/VM3.realign_target.intervals ;
############################# INDEL REALigner #############################
java -Xmx200g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T IndelRealigner \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-targetIntervals /home/rtm/vivek/navi/wes/bam/VM3.realign_target.intervals \
--noOriginalAlignmentTags \
-I /home/rtm/vivek/navi/wes/bam/VM3.rmdup.sort.bam \
--out /home/rtm/vivek/navi/wes/bam/VM3.realigned.bam ;
###### ADD GROUP
java -Xmx10g -jar /home/rtm/myprograms/picard/build/libs/picard.jar AddOrReplaceReadGroups \
INPUT=/home/rtm/vivek/navi/wes/bam/VM3.realigned.bam \
OUTPUT=/home/rtm/vivek/navi/wes/bam/VM3.realigned.addRG.bam \
RGID=VM3 RGLB=WES RGPL=illumina RGPU=NULL RGSM=VM3 CREATE_INDEX=true
############################## baserecalibrator #############################
java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T BaseRecalibrator \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-knownSites /home/references/broadhg38/broad_hg38/dbsnp_146.hg38.vcf \
-I /home/rtm/vivek/navi/wes/bam/VM3.realigned.addRG.bam \
-o /home/rtm/vivek/navi/wes/bam/VM3.bqsr.grp ;
############################# recalibrate #############################
java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T PrintReads \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM3.realigned.addRG.bam \
--BQSR /home/rtm/vivek/navi/wes/bam/VM3.bqsr.grp \
-o /home/rtm/vivek/navi/wes/bam/VM3.recalibrated.bam ;

################################################################

#################### VM4 need to cat the files ####################
cat fastq/DLP-011*R1* > VM4_R1.fastq.gz &
cat fastq/DLP-011*R2* > VM4_R2.fastq.gz &

# Trimming
/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 \
--fastqc -o /home/rtm/vivek/navi/wes/fastq_trim/ \
/home/rtm/vivek/navi/wes/fastq_cat/VM4_R1.fastq.gz \
/home/rtm/vivek/navi/wes/fastq_cat/VM4_R2.fastq.gz

# Mapping
bwa mem -t 23 -T 0 -R "@RG\tID:VM4\tLB:WES1\tPL:illumina\tPU:NULL\tSM:VM4" \
/home/references/broadhg38/bwa/Homo_sapiens_assembly38.fasta.gz /home/rtm/vivek/navi/wes/fastq_trim/VM4_R1_val_1.fq.gz /home/rtm/vivek/navi/wes/fastq_trim/VM4_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes/bam/VM4.bam - ;

# sort
java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=/home/rtm/vivek/navi/wes/bam/VM4.bam \
OUTPUT=/home/rtm/vivek/navi/wes/bam/VM4.sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT;

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar MarkDuplicates \
VALIDATION_STRINGENCY=STRICT \
CREATE_INDEX=true \
M=/home/rtm/vivek/navi/wes/bam/VM4.MFILE.txt \
INPUT=/home/rtm/vivek/navi/wes/bam/VM4.sort.bam \
OUTPUT=/home/rtm/vivek/navi/wes/bam/VM4.rmdup.sort.bam ;

############################# Target intervals #############################
java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T RealignerTargetCreator \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-nt 20 \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-I /home/rtm/vivek/navi/wes/bam/VM4.rmdup.sort.bam \
-o /home/rtm/vivek/navi/wes/bam/VM4.realign_target.intervals ;
############################# INDEL REALigner #############################
java -Xmx200g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T IndelRealigner \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-targetIntervals /home/rtm/vivek/navi/wes/bam/VM4.realign_target.intervals \
--noOriginalAlignmentTags \
-I /home/rtm/vivek/navi/wes/bam/VM4.rmdup.sort.bam \
--out /home/rtm/vivek/navi/wes/bam/VM4.realigned.bam ;
############################## baserecalibrator #############################
java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T BaseRecalibrator \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-knownSites /home/references/broadhg38/broad_hg38/dbsnp_146.hg38.vcf \
-I /home/rtm/vivek/navi/wes/bam/VM4.realigned.bam \
-o /home/rtm/vivek/navi/wes/bam/VM4.bqsr.grp ;
############################# recalibrate #############################
java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T PrintReads \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM4.realigned.bam \
--BQSR /home/rtm/vivek/navi/wes/bam/VM4.bqsr.grp \
-o /home/rtm/vivek/navi/wes/bam/VM4.recalibrated.bam ;
################################################################
