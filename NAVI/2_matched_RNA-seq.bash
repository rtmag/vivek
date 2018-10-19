STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndExit

STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn RNA-01_S10_L002_R1_001.fastq.gz \
RNA-01_S10_L002_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/EPIC_NEVI_PILOT/RNA_seq/bam/S10_

STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn RNA-02_S11_L002_R1_001.fastq.gz \
RNA-02_S11_L002_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/EPIC_NEVI_PILOT/RNA_seq/bam/S11_

STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn RNA-03_S4_L001_R1_001.fastq.gz \
RNA-03_S4_L001_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/EPIC_NEVI_PILOT/RNA_seq/bam/S4_

STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn RNA-04_S7_L001_R1_001.fastq.gz \
RNA-04_S7_L001_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/EPIC_NEVI_PILOT/RNA_seq/bam/S7_

STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn RNA-05_S8_L001_R1_001.fastq.gz \
RNA-05_S8_L001_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/EPIC_NEVI_PILOT/RNA_seq/bam/S8_

STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn RNA-06_S16_L002_R1_001.fastq.gz \
RNA-06_S16_L002_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/EPIC_NEVI_PILOT/RNA_seq/bam/S16_

STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn RNA-07_S9_L001_R1_001.fastq.gz \
RNA-07_S9_L001_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/EPIC_NEVI_PILOT/RNA_seq/bam/S9_

STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn RNA-08_S17_L002_R1_001.fastq.gz \
RNA-08_S17_L002_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/EPIC_NEVI_PILOT/RNA_seq/bam/S17_

STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn RNA-09_S13_L002_R1_001.fastq.gz \
RNA-09_S13_L002_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/EPIC_NEVI_PILOT/RNA_seq/bam/S13_

STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn RNA-11_S6_L001_R1_001.fastq.gz \
RNA-11_S6_L001_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/EPIC_NEVI_PILOT/RNA_seq/bam/S6_

STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn RNA-12_S5_L001_R1_001.fastq.gz \
RNA-12_S5_L001_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/EPIC_NEVI_PILOT/RNA_seq/bam/S5_

STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn RNA-13_S1_L001_R1_001.fastq.gz \
RNA-13_S1_L001_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/EPIC_NEVI_PILOT/RNA_seq/bam/S1_

STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn RNA-14_S2_L001_R1_001.fastq.gz \
RNA-14_S2_L001_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/EPIC_NEVI_PILOT/RNA_seq/bam/S2_

STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn RNA-15_S14_L002_R1_001.fastq.gz \
RNA-15_S14_L002_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/EPIC_NEVI_PILOT/RNA_seq/bam/S14_

STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn RNA-16_S15_L002_R1_001.fastq.gz \
RNA-16_S15_L002_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/EPIC_NEVI_PILOT/RNA_seq/bam/S15_

STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn RNA-18_S12_L002_R1_001.fastq.gz \
RNA-18_S12_L002_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/EPIC_NEVI_PILOT/RNA_seq/bam/S12_

STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn RNA-21_S18_L002_R1_001.fastq.gz \
RNA-21_S18_L002_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/EPIC_NEVI_PILOT/RNA_seq/bam/S18_

STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn RNA-22_S3_L001_R1_001.fastq.gz \
RNA-22_S3_L001_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/EPIC_NEVI_PILOT/RNA_seq/bam/S3_

STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn /root/vivek/vivek_new_rna_seq/fastq/B1_S38_R1_001.fastq.gz \
/root/vivek/vivek_new_rna_seq/fastq/B1_S38_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/EPIC_NEVI_PILOT/RNA_seq/bam/S38_


STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad Remove
###
#
#
