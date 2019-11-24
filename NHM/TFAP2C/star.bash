
VMRLP-.fastq.gz
VMRLP-.fastq.gz
VMRLP-.fastq.gz
VMRLP-.fastq.gz
VMRLP-.fastq.gz
VMRLP-.fastq.gz

STAR --genomeDir /root/resources/star_hg38_overhang100/ \
--readFilesCommand zcat \
--runThreadN 40 \
--readFilesIn VMRLP-101_S292_L008_R1_001.fastq.gz \
VMRLP-101_S292_L008_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/TFAP2C_RNASEQ/bam/VMRLP-101_S292_

STAR --genomeDir /root/resources/star_hg38_overhang100/ \
--readFilesCommand zcat \
--runThreadN 40 \
--readFilesIn VMRLP-102_S293_L008_R1_001.fastq.gz \
VMRLP-102_S293_L008_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/TFAP2C_RNASEQ/bam/VMRLP-102_S293_

STAR --genomeDir /root/resources/star_hg38_overhang100/ \
--readFilesCommand zcat \
--runThreadN 40 \
--readFilesIn VMRLP-103_S294_L008_R1_001.fastq.gz \
VMRLP-103_S294_L008_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/TFAP2C_RNASEQ/bam/VMRLP-103_S294_

STAR --genomeDir /root/resources/star_hg38_overhang100/ \
--readFilesCommand zcat \
--runThreadN 40 \
--readFilesIn VMRLP-104_S295_L008_R1_001.fastq.gz \
VMRLP-104_S295_L008_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/TFAP2C_RNASEQ/bam/VMRLP-104_S295_

STAR --genomeDir /root/resources/star_hg38_overhang100/ \
--readFilesCommand zcat \
--runThreadN 40 \
--readFilesIn VMRLP-105_S296_L008_R1_001.fastq.gz \
VMRLP-105_S296_L008_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/TFAP2C_RNASEQ/bam/VMRLP-105_S296_

STAR --genomeDir /root/resources/star_hg38_overhang100/ \
--readFilesCommand zcat \
--runThreadN 40 \
--readFilesIn VMRLP-106_S297_L008_R1_001.fastq.gz \
VMRLP-106_S297_L008_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/TFAP2C_RNASEQ/bam/VMRLP-106_S297_
