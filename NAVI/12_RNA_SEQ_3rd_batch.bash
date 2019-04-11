# unzip \*.zip
ls -1 *R1_001.fastq.gz| perl -pe 's/(VMRLP-)(\d\d)(_S.+)\_L004_R1.+\.fastq\.gz/ \
STAR \-\-genomeDir \/root\/resources\/star_hg38_overhang100\/ \-\-genomeLoad LoadAndKeep \\\
\-\-readFilesCommand zcat \-\-limitBAMsortRAM 10000000000 \\\
\-\-runThreadN 40 \\\
\-\-readFilesIn $1$2$3\_L004\_R1\_001\.fastq\.gz \\\
$1$2$3\_L004\_R2\_001\.fastq\.gz \\\
\-\-outSAMtype BAM SortedByCoordinate  \\\
\-\-outFileNamePrefix \/root\/vivek\/NEVI\_MEL\_RNA\/bam3\/$2\_/g'

STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndExit

STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn VMRLP-41_S110_L004_R1_001.fastq.gz \
VMRLP-41_S110_L004_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/NEVI_MEL_RNA/bam3/R41_
 
STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn VMRLP-42_S111_L004_R1_001.fastq.gz \
VMRLP-42_S111_L004_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/NEVI_MEL_RNA/bam3/R42_
 
STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn VMRLP-43_S112_L004_R1_001.fastq.gz \
VMRLP-43_S112_L004_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/NEVI_MEL_RNA/bam3/R43_
 
STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn VMRLP-44_S113_L004_R1_001.fastq.gz \
VMRLP-44_S113_L004_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/NEVI_MEL_RNA/bam3/R44_
 
STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn VMRLP-45_S114_L004_R1_001.fastq.gz \
VMRLP-45_S114_L004_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/NEVI_MEL_RNA/bam3/R45_
 
STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn VMRLP-46_S115_L004_R1_001.fastq.gz \
VMRLP-46_S115_L004_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/NEVI_MEL_RNA/bam3/R46_
 
STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn VMRLP-47_S116_L004_R1_001.fastq.gz \
VMRLP-47_S116_L004_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/NEVI_MEL_RNA/bam3/R47_
 
STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn VMRLP-48_S117_L004_R1_001.fastq.gz \
VMRLP-48_S117_L004_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/NEVI_MEL_RNA/bam3/R48_
 
STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn VMRLP-49_S118_L004_R1_001.fastq.gz \
VMRLP-49_S118_L004_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/NEVI_MEL_RNA/bam3/R49_
 
STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn VMRLP-50_S119_L004_R1_001.fastq.gz \
VMRLP-50_S119_L004_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/NEVI_MEL_RNA/bam3/R50_
 
STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn VMRLP-51_S120_L004_R1_001.fastq.gz \
VMRLP-51_S120_L004_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/NEVI_MEL_RNA/bam3/R51_
 
STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn VMRLP-52_S121_L004_R1_001.fastq.gz \
VMRLP-52_S121_L004_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/NEVI_MEL_RNA/bam3/R52_
 
STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn VMRLP-53_S122_L004_R1_001.fastq.gz \
VMRLP-53_S122_L004_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/NEVI_MEL_RNA/bam3/R53_
 
STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn VMRLP-54_S123_L004_R1_001.fastq.gz \
VMRLP-54_S123_L004_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/NEVI_MEL_RNA/bam3/R54_
 
STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn VMRLP-55_S124_L004_R1_001.fastq.gz \
VMRLP-55_S124_L004_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/NEVI_MEL_RNA/bam3/R55_
 
STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn VMRLP-56_S125_L004_R1_001.fastq.gz \
VMRLP-56_S125_L004_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/NEVI_MEL_RNA/bam3/R56_
 
STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn VMRLP-59_S126_L004_R1_001.fastq.gz \
VMRLP-59_S126_L004_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/NEVI_MEL_RNA/bam3/R59_
 
STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn VMRLP-60_S127_L004_R1_001.fastq.gz \
VMRLP-60_S127_L004_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/NEVI_MEL_RNA/bam3/R60_
 
STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn VMRLP-61_S128_L004_R1_001.fastq.gz \
VMRLP-61_S128_L004_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/NEVI_MEL_RNA/bam3/R61_
 
STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn VMRLP-62_S129_L004_R1_001.fastq.gz \
VMRLP-62_S129_L004_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/NEVI_MEL_RNA/bam3/R62_
 
STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad LoadAndKeep \
--readFilesCommand zcat --limitBAMsortRAM 10000000000 \
--runThreadN 40 \
--readFilesIn VMRLP-63_S130_L004_R1_001.fastq.gz \
VMRLP-63_S130_L004_R2_001.fastq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /root/vivek/NEVI_MEL_RNA/bam3/R63_

STAR --genomeDir /root/resources/star_hg38_overhang100/ --genomeLoad Remove

