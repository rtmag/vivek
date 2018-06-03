bowtie2 -p 40 -x /root/resources/hg38_bowtie2/hg38 \
-1 <(zcat /root/vivek/vivek_new_rna_seq/fastq/B1_S38_R1_001.fastq.gz) \
-2 <(zcat /root/vivek/vivek_new_rna_seq/fastq/B1_S38_R2_001.fastq.gz) \
-S /root/vivek/vivek_new_rna_seq/bowtie2/BRAF_1.sam &> BRAF_1.log

samtools view -bS /root/vivek/vivek_new_rna_seq/bowtie2/BRAF_1.sam > /root/vivek/vivek_new_rna_seq/bowtie2/BRAF_1.bam
rm /root/vivek/vivek_new_rna_seq/bowtie2/BRAF_1.sam 
#
bowtie2 -p 40 -x /root/resources/hg38_bowtie2/hg38 \
-1 <(zcat /root/vivek/vivek_new_rna_seq/fastq/B2_S39_R1_001.fastq.gz) \
-2 <(zcat /root/vivek/vivek_new_rna_seq/fastq/B2_S39_R2_001.fastq.gz) \
-S /root/vivek/vivek_new_rna_seq/bowtie2/BRAF_2.sam &> BRAF_2.log

samtools view -bS /root/vivek/vivek_new_rna_seq/bowtie2/BRAF_2.sam > /root/vivek/vivek_new_rna_seq/bowtie2/BRAF_2.bam
rm /root/vivek/vivek_new_rna_seq/bowtie2/BRAF_2.sam
#
bowtie2 -p 40 -x /root/resources/hg38_bowtie2/hg38 \
-1 <(zcat /root/vivek/vivek_new_rna_seq/fastq/B3_S40_R1_001.fastq.gz) \
-2 <(zcat /root/vivek/vivek_new_rna_seq/fastq/B3_S40_R2_001.fastq.gz) \
-S /root/vivek/vivek_new_rna_seq/bowtie2/BRAF_3.sam &> BRAF_3.log

samtools view -bS /root/vivek/vivek_new_rna_seq/bowtie2/BRAF_3.sam > /root/vivek/vivek_new_rna_seq/bowtie2/BRAF_3.bam
rm /root/vivek/vivek_new_rna_seq/bowtie2/BRAF_3.sam
#
bowtie2 -p 40 -x /root/resources/hg38_bowtie2/hg38 \
-1 <(zcat /root/vivek/vivek_new_rna_seq/fastq/D1_NHMbplusc__S44_R1_001.fastq.gz) \
-2 <(zcat /root/vivek/vivek_new_rna_seq/fastq/D1_NHMbplusc__S44_R2_001.fastq.gz) \
-S /root/vivek/vivek_new_rna_seq/bowtie2/B_C_1.sam &> BC_1.log

samtools view -bS /root/vivek/vivek_new_rna_seq/bowtie2/B_C_1.sam > /root/vivek/vivek_new_rna_seq/bowtie2/B_C_1.bam
rm /root/vivek/vivek_new_rna_seq/bowtie2/B_C_1.sam
#
bowtie2 -p 40 -x /root/resources/hg38_bowtie2/hg38 \
-1 <(zcat /root/vivek/vivek_new_rna_seq/fastq/D2_NHMbplusc__S45_R1_001.fastq.gz) \
-2 <(zcat /root/vivek/vivek_new_rna_seq/fastq/D2_NHMbplusc__S45_R2_001.fastq.gz) \
-S /root/vivek/vivek_new_rna_seq/bowtie2/B_C_2.sam &> BC_2.log

samtools view -bS /root/vivek/vivek_new_rna_seq/bowtie2/B_C_2.sam > /root/vivek/vivek_new_rna_seq/bowtie2/B_C_2.bam
rm /root/vivek/vivek_new_rna_seq/bowtie2/B_C_2.sam
#
bowtie2 -p 40 -x /root/resources/hg38_bowtie2/hg38 \
-1 <(zcat /root/vivek/vivek_new_rna_seq/fastq/D3_NHMbplusc__S46_R1_001.fastq.gz) \
-2 <(zcat /root/vivek/vivek_new_rna_seq/fastq/D3_NHMbplusc__S46_R2_001.fastq.gz) \
-S /root/vivek/vivek_new_rna_seq/bowtie2/B_C_3.sam &> BC_3.log

samtools view -bS /root/vivek/vivek_new_rna_seq/bowtie2/B_C_3.sam > /root/vivek/vivek_new_rna_seq/bowtie2/B_C_3.bam
rm /root/vivek/vivek_new_rna_seq/bowtie2/B_C_3.sam

##############################################################################################################################
samtools sort /root/vivek/vivek_new_rna_seq/bowtie2/BRAF_1.bam > /root/vivek/vivek_new_rna_seq/bowtie2/BRAF_1_sort.bam &
samtools sort /root/vivek/vivek_new_rna_seq/bowtie2/BRAF_2.bam > /root/vivek/vivek_new_rna_seq/bowtie2/BRAF_2_sort.bam &
samtools sort /root/vivek/vivek_new_rna_seq/bowtie2/BRAF_3.bam > /root/vivek/vivek_new_rna_seq/bowtie2/BRAF_3_sort.bam &
samtools sort /root/vivek/vivek_new_rna_seq/bowtie2/B_C_1.bam > /root/vivek/vivek_new_rna_seq/bowtie2/B_C_1_sort.bam &
#
samtools sort /root/vivek/vivek_new_rna_seq/bowtie2/B_C_2.bam > /root/vivek/vivek_new_rna_seq/bowtie2/B_C_2_sort.bam &
samtools sort /root/vivek/vivek_new_rna_seq/bowtie2/B_C_3.bam > /root/vivek/vivek_new_rna_seq/bowtie2/B_C_3_sort.bam &
#

samtools index /root/vivek/vivek_new_rna_seq/bowtie2/BRAF_1_sort.bam &
samtools index /root/vivek/vivek_new_rna_seq/bowtie2/BRAF_2_sort.bam &
samtools index /root/vivek/vivek_new_rna_seq/bowtie2/BRAF_3_sort.bam &
samtools index /root/vivek/vivek_new_rna_seq/bowtie2/B_C_1_sort.bam &
#
samtools sort /root/vivek/vivek_new_rna_seq/bowtie2/B_C_2.bam > /root/vivek/vivek_new_rna_seq/bowtie2/B_C_2_sort.bam &
samtools sort /root/vivek/vivek_new_rna_seq/bowtie2/B_C_3.bam > /root/vivek/vivek_new_rna_seq/bowtie2/B_C_3_sort.bam &



