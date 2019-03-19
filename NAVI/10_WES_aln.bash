bwa mem -t 23 -T 0 \
-R @BATCH1_VN19 \
/home/references/bwa_hg38/hg38.fasta \
/home/rtm/vivek/navi/wes/fastq_trim/VM19_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM19_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes/bam/VM19 -

bwa mem -t 23 -T 0 \
-R @BATCH1_VN1 \
/home/references/bwa_hg38/hg38.fasta \
/home/rtm/vivek/navi/wes/fastq_trim/VM1_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM1_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes/bam/VM1 -

bwa mem -t 23 -T 0 \
-R @BATCH1_VN20 \
/home/references/bwa_hg38/hg38.fasta \
/home/rtm/vivek/navi/wes/fastq_trim/VM20_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM20_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes/bam/VM20 -

bwa mem -t 23 -T 0 \
-R @BATCH1_VN25 \
/home/references/bwa_hg38/hg38.fasta \
/home/rtm/vivek/navi/wes/fastq_trim/VM25_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM25_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes/bam/VM25 -

bwa mem -t 23 -T 0 \
-R @BATCH1_VN26 \
/home/references/bwa_hg38/hg38.fasta \
/home/rtm/vivek/navi/wes/fastq_trim/VM26_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM26_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes/bam/VM26 -

bwa mem -t 23 -T 0 \
-R @BATCH1_VN2 \
/home/references/bwa_hg38/hg38.fasta \
/home/rtm/vivek/navi/wes/fastq_trim/VM2_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM2_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes/bam/VM2 -

bwa mem -t 23 -T 0 \
-R @BATCH1_VN31 \
/home/references/bwa_hg38/hg38.fasta \
/home/rtm/vivek/navi/wes/fastq_trim/VM31_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM31_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes/bam/VM31 -

bwa mem -t 23 -T 0 \
-R @BATCH1_VN32 \
/home/references/bwa_hg38/hg38.fasta \
/home/rtm/vivek/navi/wes/fastq_trim/VM32_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM32_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes/bam/VM32 -

bwa mem -t 23 -T 0 \
-R @BATCH1_VN33 \
/home/references/bwa_hg38/hg38.fasta \
/home/rtm/vivek/navi/wes/fastq_trim/VM33_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM33_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes/bam/VM33 -

bwa mem -t 23 -T 0 \
-R @BATCH1_VN34 \
/home/references/bwa_hg38/hg38.fasta \
/home/rtm/vivek/navi/wes/fastq_trim/VM34_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM34_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes/bam/VM34 -

bwa mem -t 23 -T 0 \
-R @BATCH1_VN3 \
/home/references/bwa_hg38/hg38.fasta \
/home/rtm/vivek/navi/wes/fastq_trim/VM3_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM3_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes/bam/VM3 -

bwa mem -t 23 -T 0 \
-R @BATCH1_VN43 \
/home/references/bwa_hg38/hg38.fasta \
/home/rtm/vivek/navi/wes/fastq_trim/VM43_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM43_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes/bam/VM43 -

bwa mem -t 23 -T 0 \
-R @BATCH1_VN44 \
/home/references/bwa_hg38/hg38.fasta \
/home/rtm/vivek/navi/wes/fastq_trim/VM44_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM44_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes/bam/VM44 -

bwa mem -t 23 -T 0 \
-R @BATCH1_VN7 \
/home/references/bwa_hg38/hg38.fasta \
/home/rtm/vivek/navi/wes/fastq_trim/VM7_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM7_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes/bam/VM7 -

bwa mem -t 23 -T 0 \
-R @BATCH1_VN8 \
/home/references/bwa_hg38/hg38.fasta \
/home/rtm/vivek/navi/wes/fastq_trim/VM8_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes/fastq_trim/VM8_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes/bam/VM8 -
