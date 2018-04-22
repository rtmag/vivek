###
STAR --genomeDir /root/resources/star_hg38_overhang100/ \
--readFilesCommand zcat \
--runThreadN 40 \
--readFilesIn /root/vivek/vivek_new_rna_seq/fastq/B1_S38_R1_001.fastq.gz \
/root/vivek/vivek_new_rna_seq/fastq/B1_S38_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/vivek_new_rna_seq/bam/BRAF_1_

STAR --genomeDir /root/resources/star_hg38_overhang100/ \
--readFilesCommand zcat \
--runThreadN 40 \
--readFilesIn /root/vivek/vivek_new_rna_seq/fastq/B2_S39_R1_001.fastq.gz \
/root/vivek/vivek_new_rna_seq/fastq/B2_S39_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/vivek_new_rna_seq/bam/BRAF_2_

STAR --genomeDir /root/resources/star_hg38_overhang100/ \
--readFilesCommand zcat \
--runThreadN 40 \
--readFilesIn /root/vivek/vivek_new_rna_seq/fastq/B3_S40_R1_001.fastq.gz \
/root/vivek/vivek_new_rna_seq/fastq/B3_S40_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/vivek_new_rna_seq/bam/BRAF_3_
#######################################################################################
STAR --genomeDir /root/resources/star_hg38_overhang100/ \
--readFilesCommand zcat \
--runThreadN 40 \
--readFilesIn /root/vivek/vivek_new_rna_seq/fastq/C1_S41_R1_001.fastq.gz \
/root/vivek/vivek_new_rna_seq/fastq/C1_S41_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/vivek_new_rna_seq/bam/CDKN2A_1_

STAR --genomeDir /root/resources/star_hg38_overhang100/ \
--readFilesCommand zcat \
--runThreadN 40 \
--readFilesIn /root/vivek/vivek_new_rna_seq/fastq/C2_S42_R1_001.fastq.gz \
/root/vivek/vivek_new_rna_seq/fastq/C2_S42_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/vivek_new_rna_seq/bam/CDKN2A_2_

STAR --genomeDir /root/resources/star_hg38_overhang100/ \
--readFilesCommand zcat \
--runThreadN 40 \
--readFilesIn /root/vivek/vivek_new_rna_seq/fastq/C3_S43_R1_001.fastq.gz \
/root/vivek/vivek_new_rna_seq/fastq/C3_S43_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/vivek_new_rna_seq/bam/CDKN2A_3_
#######################################################################################
STAR --genomeDir /root/resources/star_hg38_overhang100/ \
--readFilesCommand zcat \
--runThreadN 40 \
--readFilesIn /root/vivek/vivek_new_rna_seq/fastq/D1_NHMbplusc__S44_R1_001.fastq.gz \
/root/vivek/vivek_new_rna_seq/fastq/D1_NHMbplusc__S44_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/vivek_new_rna_seq/bam/BRAF_+_CDKN2A_1_

STAR --genomeDir /root/resources/star_hg38_overhang100/ \
--readFilesCommand zcat \
--runThreadN 40 \
--readFilesIn /root/vivek/vivek_new_rna_seq/fastq/D2_NHMbplusc__S45_R1_001.fastq.gz \
/root/vivek/vivek_new_rna_seq/fastq/D2_NHMbplusc__S45_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/vivek_new_rna_seq/bam/BRAF_+_CDKN2A_2_

STAR --genomeDir /root/resources/star_hg38_overhang100/ \
--readFilesCommand zcat \
--runThreadN 40 \
--readFilesIn /root/vivek/vivek_new_rna_seq/fastq/D3_NHMbplusc__S46_R1_001.fastq.gz \
/root/vivek/vivek_new_rna_seq/fastq/D3_NHMbplusc__S46_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/vivek_new_rna_seq/bam/BRAF_+_CDKN2A_3_
#######################################################################################
STAR --genomeDir /root/resources/star_hg38_overhang100/ \
--readFilesCommand zcat \
--runThreadN 40 \
--readFilesIn /root/vivek/vivek_new_rna_seq/fastq/N1_S35_R1_001.fastq.gz \
/root/vivek/vivek_new_rna_seq/fastq/N1_S35_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/vivek_new_rna_seq/bam/NHM_1_

STAR --genomeDir /root/resources/star_hg38_overhang100/ \
--readFilesCommand zcat \
--runThreadN 40 \
--readFilesIn /root/vivek/vivek_new_rna_seq/fastq/N2_S36_R1_001.fastq.gz \
/root/vivek/vivek_new_rna_seq/fastq/N2_S36_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/vivek_new_rna_seq/bam/NHM_2_

STAR --genomeDir /root/resources/star_hg38_overhang100/ \
--readFilesCommand zcat \
--runThreadN 40 \
--readFilesIn /root/vivek/vivek_new_rna_seq/fastq/N3_S37_R1_001.fastq.gz \
/root/vivek/vivek_new_rna_seq/fastq/N3_S37_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/vivek_new_rna_seq/bam/NHM_3_
#################################################
