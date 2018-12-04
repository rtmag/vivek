STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndExit

STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn RNA-26_S1_L001_R1_001.fastq.gz \
RNA-26_S1_L001_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/EPIC_NEVI_PILOT/RNA_seq/bam/R26_

STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn RNA-27_S2_L001_R1_001.fastq.gz \
RNA-27_S2_L001_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/EPIC_NEVI_PILOT/RNA_seq/bam/R27_

STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn RNA-28_S3_L001_R1_001.fastq.gz \
RNA-28_S3_L001_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/EPIC_NEVI_PILOT/RNA_seq/bam/R28_

STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn RNA-29_S4_L001_R1_001.fastq.gz \
RNA-29_S4_L001_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/EPIC_NEVI_PILOT/RNA_seq/bam/R29_

STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn RNA-30_S5_L001_R1_001.fastq.gz \
RNA-30_S5_L001_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/EPIC_NEVI_PILOT/RNA_seq/bam/R30_

STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn RNA-31_S6_L001_R1_001.fastq.gz \
RNA-31_S6_L001_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/EPIC_NEVI_PILOT/RNA_seq/bam/R31_

STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn RNA-32_S7_L001_R1_001.fastq.gz \
RNA-32_S7_L001_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/EPIC_NEVI_PILOT/RNA_seq/bam/R32_

STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn RNA-33_S8_L001_R1_001.fastq.gz \
RNA-33_S8_L001_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/EPIC_NEVI_PILOT/RNA_seq/bam/R33_

STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn RNA-34_S9_L001_R1_001.fastq.gz \
RNA-34_S9_L001_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/EPIC_NEVI_PILOT/RNA_seq/bam/R34_

STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn RNA-35_S10_L001_R1_001.fastq.gz \
RNA-35_S10_L001_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/EPIC_NEVI_PILOT/RNA_seq/bam/R35_

STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn RNA-36_S11_L001_R1_001.fastq.gz \
RNA-36_S11_L001_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/EPIC_NEVI_PILOT/RNA_seq/bam/R36_

STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn RNA-37_S12_L001_R1_001.fastq.gz \
RNA-37_S12_L001_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/EPIC_NEVI_PILOT/RNA_seq/bam/R37_

STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn RNA-38_S13_L001_R1_001.fastq.gz \
RNA-38_S13_L001_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/EPIC_NEVI_PILOT/RNA_seq/bam/R38_

STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn RNA-39_S14_L001_R1_001.fastq.gz \
RNA-39_S14_L001_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/EPIC_NEVI_PILOT/RNA_seq/bam/R39_

STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn RNA-40_S15_L001_R1_001.fastq.gz \
RNA-40_S15_L001_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/EPIC_NEVI_PILOT/RNA_seq/bam/R40_

STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad Remove
