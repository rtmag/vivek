STAR --runThreadN 50 --runMode genomeGenerate \
--genomeDir star_hg38_gencode27_overhang50/ --genomeFastaFiles hg38_allchr.fasta \
--sjdbGTFfile gencode.v27.annotation.gtf --sjdbOverhang 50

STAR --genomeDir /root/resources/star_hg38_gencode27_overhang50/ \
--readFilesCommand zcat \
--runThreadN 40 \
--readFilesIn /root/vivek/RNAseq_Vivek_UCSF/VKM-2393_A-a2_S26_L004_R1_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/RNAseq_Vivek_UCSF/bam/wm_1_

STAR --genomeDir /root/resources/star_hg38_gencode27_overhang50/ \
--readFilesCommand zcat \
--runThreadN 40 \
--readFilesIn /root/vivek/RNAseq_Vivek_UCSF/VKM-2393_B-b2_S27_L004_R1_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/RNAseq_Vivek_UCSF/bam/wm_2_

STAR --genomeDir /root/resources/star_hg38_gencode27_overhang50/ \
--readFilesCommand zcat \
--runThreadN 40 \
--readFilesIn /root/vivek/RNAseq_Vivek_UCSF/VKM-2393_C-c2_S28_L004_R1_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/RNAseq_Vivek_UCSF/bam/wm_3_

STAR --genomeDir /root/resources/star_hg38_gencode27_overhang50/ \
--readFilesCommand zcat \
--runThreadN 40 \
--readFilesIn /root/vivek/RNAseq_Vivek_UCSF/VKM-2393_D-d2_S29_L004_R1_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/RNAseq_Vivek_UCSF/bam/lu_1_

STAR --genomeDir /root/resources/star_hg38_gencode27_overhang50/ \
--readFilesCommand zcat \
--runThreadN 40 \
--readFilesIn /root/vivek/RNAseq_Vivek_UCSF/VKM-2393_E-e2_S30_L004_R1_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/RNAseq_Vivek_UCSF/bam/lu_2_

STAR --genomeDir /root/resources/star_hg38_gencode27_overhang50/ \
--readFilesCommand zcat \
--runThreadN 40 \
--readFilesIn /root/vivek/RNAseq_Vivek_UCSF/VKM-2393_F-f2_S31_L004_R1_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/RNAseq_Vivek_UCSF/bam/lu_3_

#
