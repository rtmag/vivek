
ls | perl -pe 's/(.+)/ \/root\/myPrograms\/STAR\/bin\/STAR --genomeDir \/root\/resources\/star_hg38_overhang100 \\\n--readFilesCommand zcat --runThreadN 35 --alignIntronMax 1 --alignEndsType EndToEnd \\\n--readFilesIn \/root\/vivek\/data\/$1 \\\n --outSAMtype BAM SortedByCoordinate --outFileNamePrefix \/root\/vivek\/bam\/$1 \n/g' | perl -pe 's/(\/root\/vivek\/bam\/.+)\.fastq\.gz/$1_/g'  

 /root/myPrograms/STAR/bin/STAR --genomeDir /root/resources/star_hg38_overhang100 \
--readFilesCommand zcat --runThreadN 35 --alignIntronMax 1 --alignEndsType EndToEnd \
--readFilesIn /root/vivek/data/ATAC-Seq_501MEL_1.fastq.gz /root/vivek/data/ATAC-Seq_501MEL_2.fastq.gz \
 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix /root/vivek/bam/ATAC-Seq_501MEL_

 /root/myPrograms/STAR/bin/STAR --genomeDir /root/resources/star_hg38_overhang100 \
--readFilesCommand zcat --runThreadN 35 --alignIntronMax 1 --alignEndsType EndToEnd \
--readFilesIn /root/vivek/data/ATAC-Seq_NHM1_1.fastq.gz /root/vivek/data/ATAC-Seq_NHM1_2.fastq.gz \
 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix /root/vivek/bam/ATAC-Seq_NHM1_

 /root/myPrograms/STAR/bin/STAR --genomeDir /root/resources/star_hg38_overhang100 \
--readFilesCommand zcat --runThreadN 35 --alignIntronMax 1 --alignEndsType EndToEnd \
--readFilesIn /root/vivek/data/ATAC-Seq_SKmel147_1.fastq.gz /root/vivek/data/ATAC-Seq_SKmel147_2.fastq.gz \
 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix /root/vivek/bam/ATAC-Seq_SKmel147_

 /root/myPrograms/STAR/bin/STAR --genomeDir /root/resources/star_hg38_overhang100 \
--readFilesCommand zcat --runThreadN 35 --alignIntronMax 1 --alignEndsType EndToEnd \
--readFilesIn /root/vivek/data/ChIP-Seq_BRD2_NHM1.fastq.gz \
 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix /root/vivek/bam/ChIP-Seq_BRD2_NHM1_ 

 /root/myPrograms/STAR/bin/STAR --genomeDir /root/resources/star_hg38_overhang100 \
--readFilesCommand zcat --runThreadN 35 --alignIntronMax 1 --alignEndsType EndToEnd \
--readFilesIn /root/vivek/data/ChIP-Seq_BRD2_SKmel147.fastq.gz \
 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix /root/vivek/bam/ChIP-Seq_BRD2_SKmel147_ 

 /root/myPrograms/STAR/bin/STAR --genomeDir /root/resources/star_hg38_overhang100 \
--readFilesCommand zcat --runThreadN 35 --alignIntronMax 1 --alignEndsType EndToEnd \
--readFilesIn /root/vivek/data/ChIP-Seq_BRD4_NHM1.fastq.gz \
 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix /root/vivek/bam/ChIP-Seq_BRD4_NHM1_ 

 /root/myPrograms/STAR/bin/STAR --genomeDir /root/resources/star_hg38_overhang100 \
--readFilesCommand zcat --runThreadN 35 --alignIntronMax 1 --alignEndsType EndToEnd \
--readFilesIn /root/vivek/data/ChIP-Seq_BRD4_SKmel147.fastq.gz \
 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix /root/vivek/bam/ChIP-Seq_BRD4_SKmel147_ 

 /root/myPrograms/STAR/bin/STAR --genomeDir /root/resources/star_hg38_overhang100 \
--readFilesCommand zcat --runThreadN 35 --alignIntronMax 1 --alignEndsType EndToEnd \
--readFilesIn /root/vivek/data/ChIP-Seq_CTCF_SKmel147.fastq.gz \
 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix /root/vivek/bam/ChIP-Seq_CTCF_SKmel147_ 

 /root/myPrograms/STAR/bin/STAR --genomeDir /root/resources/star_hg38_overhang100 \
--readFilesCommand zcat --runThreadN 35 --alignIntronMax 1 --alignEndsType EndToEnd \
--readFilesIn /root/vivek/data/ChIP-Seq_FOSL2_SKmel147.fastq.gz \
 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix /root/vivek/bam/ChIP-Seq_FOSL2_SKmel147_ 

 /root/myPrograms/STAR/bin/STAR --genomeDir /root/resources/star_hg38_overhang100 \
--readFilesCommand zcat --runThreadN 35 --alignIntronMax 1 --alignEndsType EndToEnd \
--readFilesIn /root/vivek/data/ChIP-Seq_H3K27ac_501MEL.fastq.gz \
 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix /root/vivek/bam/ChIP-Seq_H3K27ac_501MEL_ 

 /root/myPrograms/STAR/bin/STAR --genomeDir /root/resources/star_hg38_overhang100 \
--readFilesCommand zcat --runThreadN 35 --alignIntronMax 1 --alignEndsType EndToEnd \
--readFilesIn /root/vivek/data/ChIP-Seq_H3K27ac_NHM1.fastq.gz \
 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix /root/vivek/bam/ChIP-Seq_H3K27ac_NHM1_ 

 /root/myPrograms/STAR/bin/STAR --genomeDir /root/resources/star_hg38_overhang100 \
--readFilesCommand zcat --runThreadN 35 --alignIntronMax 1 --alignEndsType EndToEnd \
--readFilesIn /root/vivek/data/ChIP-Seq_H3K27ac_NHM2.fastq.gz \
 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix /root/vivek/bam/ChIP-Seq_H3K27ac_NHM2_ 

 /root/myPrograms/STAR/bin/STAR --genomeDir /root/resources/star_hg38_overhang100 \
--readFilesCommand zcat --runThreadN 35 --alignIntronMax 1 --alignEndsType EndToEnd \
--readFilesIn /root/vivek/data/ChIP-Seq_H3K27ac_SKmel147.fastq.gz \
 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix /root/vivek/bam/ChIP-Seq_H3K27ac_SKmel147_ 

 /root/myPrograms/STAR/bin/STAR --genomeDir /root/resources/star_hg38_overhang100 \
--readFilesCommand zcat --runThreadN 35 --alignIntronMax 1 --alignEndsType EndToEnd \
--readFilesIn /root/vivek/data/ChIP-Seq_H3K27ac_SKmel2.fastq.gz \
 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix /root/vivek/bam/ChIP-Seq_H3K27ac_SKmel2_ 

 /root/myPrograms/STAR/bin/STAR --genomeDir /root/resources/star_hg38_overhang100 \
--readFilesCommand zcat --runThreadN 35 --alignIntronMax 1 --alignEndsType EndToEnd \
--readFilesIn /root/vivek/data/ChIP-Seq_H3K27ac_SKmel239.fastq.gz \
 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix /root/vivek/bam/ChIP-Seq_H3K27ac_SKmel239_ 

 /root/myPrograms/STAR/bin/STAR --genomeDir /root/resources/star_hg38_overhang100 \
--readFilesCommand zcat --runThreadN 35 --alignIntronMax 1 --alignEndsType EndToEnd \
--readFilesIn /root/vivek/data/ChIP-Seq_H3K27me3_SKmel147.fastq.gz \
 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix /root/vivek/bam/ChIP-Seq_H3K27me3_SKmel147_ 

 /root/myPrograms/STAR/bin/STAR --genomeDir /root/resources/star_hg38_overhang100 \
--readFilesCommand zcat --runThreadN 35 --alignIntronMax 1 --alignEndsType EndToEnd \
--readFilesIn /root/vivek/data/ChIP-Seq_H3K4me1_501MEL.fastq.gz \
 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix /root/vivek/bam/ChIP-Seq_H3K4me1_501MEL_ 

 /root/myPrograms/STAR/bin/STAR --genomeDir /root/resources/star_hg38_overhang100 \
--readFilesCommand zcat --runThreadN 35 --alignIntronMax 1 --alignEndsType EndToEnd \
--readFilesIn /root/vivek/data/ChIP-Seq_H3K4me1_NHM1.fastq.gz \
 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix /root/vivek/bam/ChIP-Seq_H3K4me1_NHM1_ 

 /root/myPrograms/STAR/bin/STAR --genomeDir /root/resources/star_hg38_overhang100 \
--readFilesCommand zcat --runThreadN 35 --alignIntronMax 1 --alignEndsType EndToEnd \
--readFilesIn /root/vivek/data/ChIP-Seq_H3K4me1_NHM2.fastq.gz \
 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix /root/vivek/bam/ChIP-Seq_H3K4me1_NHM2_ 

 /root/myPrograms/STAR/bin/STAR --genomeDir /root/resources/star_hg38_overhang100 \
--readFilesCommand zcat --runThreadN 35 --alignIntronMax 1 --alignEndsType EndToEnd \
--readFilesIn /root/vivek/data/ChIP-Seq_H3K4me1_SKmel147.fastq.gz \
 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix /root/vivek/bam/ChIP-Seq_H3K4me1_SKmel147_ 

 /root/myPrograms/STAR/bin/STAR --genomeDir /root/resources/star_hg38_overhang100 \
--readFilesCommand zcat --runThreadN 35 --alignIntronMax 1 --alignEndsType EndToEnd \
--readFilesIn /root/vivek/data/ChIP-Seq_H3K4me1_SKmel2.fastq.gz \
 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix /root/vivek/bam/ChIP-Seq_H3K4me1_SKmel2_ 

 /root/myPrograms/STAR/bin/STAR --genomeDir /root/resources/star_hg38_overhang100 \
--readFilesCommand zcat --runThreadN 35 --alignIntronMax 1 --alignEndsType EndToEnd \
--readFilesIn /root/vivek/data/ChIP-Seq_H3K4me1_SKmel239.fastq.gz \
 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix /root/vivek/bam/ChIP-Seq_H3K4me1_SKmel239_ 

 /root/myPrograms/STAR/bin/STAR --genomeDir /root/resources/star_hg38_overhang100 \
--readFilesCommand zcat --runThreadN 35 --alignIntronMax 1 --alignEndsType EndToEnd \
--readFilesIn /root/vivek/data/ChIP-Seq_H3K4me3_SKmel147.fastq.gz \
 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix /root/vivek/bam/ChIP-Seq_H3K4me3_SKmel147_ 

 /root/myPrograms/STAR/bin/STAR --genomeDir /root/resources/star_hg38_overhang100 \
--readFilesCommand zcat --runThreadN 35 --alignIntronMax 1 --alignEndsType EndToEnd \
--readFilesIn /root/vivek/data/ChIP-Seq_MED1_SKmel147.fastq.gz \
 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix /root/vivek/bam/ChIP-Seq_MED1_SKmel147_ 

 /root/myPrograms/STAR/bin/STAR --genomeDir /root/resources/star_hg38_overhang100 \
--readFilesCommand zcat --runThreadN 35 --alignIntronMax 1 --alignEndsType EndToEnd \
--readFilesIn /root/vivek/data/ChIP-Seq_TEAD4_SKmel147.fastq.gz \
 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix /root/vivek/bam/ChIP-Seq_TEAD4_SKmel147_ 

 /root/myPrograms/STAR/bin/STAR --genomeDir /root/resources/star_hg38_overhang100 \
--readFilesCommand zcat --runThreadN 35 --alignIntronMax 1 --alignEndsType EndToEnd \
--readFilesIn /root/vivek/data/ChIP-Seq_input_501MEL.fastq.gz \
 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix /root/vivek/bam/ChIP-Seq_input_501MEL_ 

 /root/myPrograms/STAR/bin/STAR --genomeDir /root/resources/star_hg38_overhang100 \
--readFilesCommand zcat --runThreadN 35 --alignIntronMax 1 --alignEndsType EndToEnd \
--readFilesIn /root/vivek/data/ChIP-Seq_input_NHM1.fastq.gz \
 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix /root/vivek/bam/ChIP-Seq_input_NHM1_ 

 /root/myPrograms/STAR/bin/STAR --genomeDir /root/resources/star_hg38_overhang100 \
--readFilesCommand zcat --runThreadN 35 --alignIntronMax 1 --alignEndsType EndToEnd \
--readFilesIn /root/vivek/data/ChIP-Seq_input_NHM2.fastq.gz \
 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix /root/vivek/bam/ChIP-Seq_input_NHM2_ 

 /root/myPrograms/STAR/bin/STAR --genomeDir /root/resources/star_hg38_overhang100 \
--readFilesCommand zcat --runThreadN 35 --alignIntronMax 1 --alignEndsType EndToEnd \
--readFilesIn /root/vivek/data/ChIP-Seq_input_SKmel147.fastq.gz \
 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix /root/vivek/bam/ChIP-Seq_input_SKmel147_ 

 /root/myPrograms/STAR/bin/STAR --genomeDir /root/resources/star_hg38_overhang100 \
--readFilesCommand zcat --runThreadN 35 --alignIntronMax 1 --alignEndsType EndToEnd \
--readFilesIn /root/vivek/data/ChIP-Seq_input_SKmel2.fastq.gz \
 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix /root/vivek/bam/ChIP-Seq_input_SKmel2_ 

 /root/myPrograms/STAR/bin/STAR --genomeDir /root/resources/star_hg38_overhang100 \
--readFilesCommand zcat --runThreadN 35 --alignIntronMax 1 --alignEndsType EndToEnd \
--readFilesIn /root/vivek/data/ChIP-Seq_input_SKmel239.fastq.gz \
 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix /root/vivek/bam/ChIP-Seq_input_SKmel239_ 

 /root/myPrograms/STAR/bin/STAR --genomeDir /root/resources/star_hg38_overhang100 \
--readFilesCommand zcat --runThreadN 35 --alignIntronMax 1 --alignEndsType EndToEnd \
--readFilesIn /root/vivek/data/ChIP-Seq_macroH2A1_SKmel147.fastq.gz \
 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix /root/vivek/bam/ChIP-Seq_macroH2A1_SKmel147_ 

 /root/myPrograms/STAR/bin/STAR --genomeDir /root/resources/star_hg38_overhang100 \
--readFilesCommand zcat --runThreadN 35 --alignIntronMax 1 --alignEndsType EndToEnd \
--readFilesIn /root/vivek/data/ChIP-Seq_macroH2A2_SKmel147.fastq.gz \
 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix /root/vivek/bam/ChIP-Seq_macroH2A2_SKmel147_ 

