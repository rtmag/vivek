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
##########
##########
##########
##########


STAR --genomeDir /root/resources/star_hg38_overhang100/ \
--readFilesCommand zcat \
--runThreadN 40 \
--readFilesIn RNA-01_S10_L002_R1_001.fastq.gz \
RNA-01_S10_L002_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/EPIC_NEVI_PILOT/RNA_seq/bam/S10_

STAR --genomeDir /root/resources/star_hg38_overhang100/ \
--readFilesCommand zcat \
--runThreadN 40 \
--readFilesIn RNA-02_S11_L002_R1_001.fastq.gz \
RNA-02_S11_L002_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/EPIC_NEVI_PILOT/RNA_seq/bam/S11_

STAR --genomeDir /root/resources/star_hg38_overhang100/ \
--readFilesCommand zcat \
--runThreadN 40 \
--readFilesIn RNA-03_S4_L001_R1_001.fastq.gz \
RNA-03_S4_L001_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/EPIC_NEVI_PILOT/RNA_seq/bam/S4_

STAR --genomeDir /root/resources/star_hg38_overhang100/ \
--readFilesCommand zcat \
--runThreadN 40 \
--readFilesIn RNA-04_S7_L001_R1_001.fastq.gz \
RNA-04_S7_L001_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/EPIC_NEVI_PILOT/RNA_seq/bam/S7_

STAR --genomeDir /root/resources/star_hg38_overhang100/ \
--readFilesCommand zcat \
--runThreadN 40 \
--readFilesIn RNA-05_S8_L001_R1_001.fastq.gz \
RNA-05_S8_L001_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/EPIC_NEVI_PILOT/RNA_seq/bam/S8_

STAR --genomeDir /root/resources/star_hg38_overhang100/ \
--readFilesCommand zcat \
--runThreadN 40 \
--readFilesIn RNA-06_S16_L002_R1_001.fastq.gz \
RNA-06_S16_L002_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/EPIC_NEVI_PILOT/RNA_seq/bam/S16_

STAR --genomeDir /root/resources/star_hg38_overhang100/ \
--readFilesCommand zcat \
--runThreadN 40 \
--readFilesIn RNA-07_S9_L001_R1_001.fastq.gz \
RNA-07_S9_L001_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/EPIC_NEVI_PILOT/RNA_seq/bam/S9_

STAR --genomeDir /root/resources/star_hg38_overhang100/ \
--readFilesCommand zcat \
--runThreadN 40 \
--readFilesIn RNA-08_S17_L002_R1_001.fastq.gz \
RNA-08_S17_L002_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/EPIC_NEVI_PILOT/RNA_seq/bam/S17_

STAR --genomeDir /root/resources/star_hg38_overhang100/ \
--readFilesCommand zcat \
--runThreadN 40 \
--readFilesIn RNA-09_S13_L002_R1_001.fastq.gz \
RNA-09_S13_L002_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/EPIC_NEVI_PILOT/RNA_seq/bam/S13_

STAR --genomeDir /root/resources/star_hg38_overhang100/ \
--readFilesCommand zcat \
--runThreadN 40 \
--readFilesIn RNA-11_S6_L001_R1_001.fastq.gz \
RNA-11_S6_L001_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/EPIC_NEVI_PILOT/RNA_seq/bam/S6_

STAR --genomeDir /root/resources/star_hg38_overhang100/ \
--readFilesCommand zcat \
--runThreadN 40 \
--readFilesIn RNA-12_S5_L001_R1_001.fastq.gz \
RNA-12_S5_L001_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/EPIC_NEVI_PILOT/RNA_seq/bam/S5_

STAR --genomeDir /root/resources/star_hg38_overhang100/ \
--readFilesCommand zcat \
--runThreadN 40 \
--readFilesIn RNA-13_S1_L001_R1_001.fastq.gz \
RNA-13_S1_L001_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/EPIC_NEVI_PILOT/RNA_seq/bam/S1_

STAR --genomeDir /root/resources/star_hg38_overhang100/ \
--readFilesCommand zcat \
--runThreadN 40 \
--readFilesIn RNA-14_S2_L001_R1_001.fastq.gz \
RNA-14_S2_L001_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/EPIC_NEVI_PILOT/RNA_seq/bam/S2_

STAR --genomeDir /root/resources/star_hg38_overhang100/ \
--readFilesCommand zcat \
--runThreadN 40 \
--readFilesIn RNA-15_S14_L002_R1_001.fastq.gz \
RNA-15_S14_L002_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/EPIC_NEVI_PILOT/RNA_seq/bam/S14_

STAR --genomeDir /root/resources/star_hg38_overhang100/ \
--readFilesCommand zcat \
--runThreadN 40 \
--readFilesIn RNA-16_S15_L002_R1_001.fastq.gz \
RNA-16_S15_L002_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/EPIC_NEVI_PILOT/RNA_seq/bam/S15_

STAR --genomeDir /root/resources/star_hg38_overhang100/ \
--readFilesCommand zcat \
--runThreadN 40 \
--readFilesIn RNA-18_S12_L002_R1_001.fastq.gz \
RNA-18_S12_L002_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/EPIC_NEVI_PILOT/RNA_seq/bam/S12_

STAR --genomeDir /root/resources/star_hg38_overhang100/ \
--readFilesCommand zcat \
--runThreadN 40 \
--readFilesIn RNA-21_S18_L002_R1_001.fastq.gz \
RNA-21_S18_L002_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/EPIC_NEVI_PILOT/RNA_seq/bam/S18_

STAR --genomeDir /root/resources/star_hg38_overhang100/ \
--readFilesCommand zcat \
--runThreadN 40 \
--readFilesIn RNA-22_S3_L001_R1_001.fastq.gz \
RNA-22_S3_L001_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/EPIC_NEVI_PILOT/RNA_seq/bam/S3_

STAR --genomeDir /root/resources/star_hg38_overhang100/ \
--readFilesCommand zcat \
--runThreadN 40 \
--readFilesIn /root/vivek/vivek_new_rna_seq/fastq/B1_S38_R1_001.fastq.gz \
/root/vivek/vivek_new_rna_seq/fastq/B1_S38_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/EPIC_NEVI_PILOT/RNA_seq/bam/S38_


####################################################################################################################
####################################################################################################################
####################################################################################################################
R01  S10
R02  S11
R18  S12
R09  S13
R15  S14
R16  S15
R06  S16
R08  S17
R21  S18
R13  S1
R14  S2
R22  S3 
R03  S4
R12  S5
R11  S6
R04  S7
R05  S8
R07  S9


mv S10_Aligned.sortedByCoord.out.bam R01_Aligned.sortedByCoord.out.bam
mv S11_Aligned.sortedByCoord.out.bam R02_Aligned.sortedByCoord.out.bam
mv S12_Aligned.sortedByCoord.out.bam R18_Aligned.sortedByCoord.out.bam
mv S13_Aligned.sortedByCoord.out.bam R09_Aligned.sortedByCoord.out.bam
mv S14_Aligned.sortedByCoord.out.bam R15_Aligned.sortedByCoord.out.bam
mv S15_Aligned.sortedByCoord.out.bam R16_Aligned.sortedByCoord.out.bam
mv S16_Aligned.sortedByCoord.out.bam R06_Aligned.sortedByCoord.out.bam
mv S17_Aligned.sortedByCoord.out.bam R08_Aligned.sortedByCoord.out.bam
mv S18_Aligned.sortedByCoord.out.bam R21_Aligned.sortedByCoord.out.bam
mv S1_Aligned.sortedByCoord.out.bam R13_Aligned.sortedByCoord.out.bam
mv S2_Aligned.sortedByCoord.out.bam R14_Aligned.sortedByCoord.out.bam
mv S38_Aligned.sortedByCoord.out.bam B1_Aligned.sortedByCoord.out.bam
mv S3_Aligned.sortedByCoord.out.bam R22_Aligned.sortedByCoord.out.bam
mv S4_Aligned.sortedByCoord.out.bam R03_Aligned.sortedByCoord.out.bam
mv S5_Aligned.sortedByCoord.out.bam R12_Aligned.sortedByCoord.out.bam
mv S6_Aligned.sortedByCoord.out.bam R11_Aligned.sortedByCoord.out.bam
mv S7_Aligned.sortedByCoord.out.bam R04_Aligned.sortedByCoord.out.bam
mv S8_Aligned.sortedByCoord.out.bam R05_Aligned.sortedByCoord.out.bam
mv S9_Aligned.sortedByCoord.out.bam R07_Aligned.sortedByCoord.out.bam




































