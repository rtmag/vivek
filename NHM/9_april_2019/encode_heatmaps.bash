# !) ADD H1-hesc heat map to the bivalent heat map (change color slightly and futon the right side) - withOur pipeline
# 3) take our bivalent regions and plot berstein h1hesc data h3k4me3 and h3k27me

#H3k4me3 ENCSR019SQX
# 36 nt se
wget https://www.encodeproject.org/files/ENCFF296CUY/@@download/ENCFF296CUY.fastq.gz
# 76 nt se
wget https://www.encodeproject.org/files/ENCFF739WMB/@@download/ENCFF739WMB.fastq.gz

# h3k27me3 ENCSR216OGD
# SE 76nt
wget https://www.encodeproject.org/files/ENCFF539PKS/@@download/ENCFF539PKS.fastq.gz
# SE 76nt
wget https://www.encodeproject.org/files/ENCFF374VEK/@@download/ENCFF374VEK.fastq.gz
###############################################################################################

STAR --genomeDir /root/resources/hg38_noanno/ \
--readFilesCommand zcat \
--runThreadN 40 \
--alignIntronMax 1 \
--alignEndsType EndToEnd \
--readFilesIn ENCFF296CUY.fastq.gz \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix H3K4me3_36_


STAR --genomeDir /root/resources/hg38_noanno/ \
--readFilesCommand zcat \
--runThreadN 40 \
--alignIntronMax 1 \
--alignEndsType EndToEnd \
--readFilesIn ENCFF739WMB.fastq.gz \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix H3K4me3_76_

STAR --genomeDir /root/resources/hg38_noanno/ \
--readFilesCommand zcat \
--runThreadN 40 \
--alignIntronMax 1 \
--alignEndsType EndToEnd \
--readFilesIn ENCFF539PKS.fastq.gz \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix H3K27me3_76_

STAR --genomeDir /root/resources/hg38_noanno/ \
--readFilesCommand zcat \
--runThreadN 40 \
--alignIntronMax 1 \
--alignEndsType EndToEnd \
--readFilesIn ENCFF374VEK.fastq.gz \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix H3K27me3_36_
#####################
java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=H3K4me3_36_Aligned.sortedByCoord.out.bam \
O=H3K4me3_36_rmdup.bam \
M=H3K4me3_36_rmdup.mfile

java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=H3K4me3_76_Aligned.sortedByCoord.out.bam \
O=H3K4me3_76_rmdup.bam \
M=H3K4me3_76_rmdup.mfile

java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=H3K27me3_36_Aligned.sortedByCoord.out.bam \
O=H3K27me3_36_rmdup.bam \
M=H3K27me3_36_rmdup.mfile

java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=H3K27me3_76_Aligned.sortedByCoord.out.bam \
O=H3K27me3_76_rmdup.bam \
M=H3K27me3_76_rmdup.mfile

samtools index H3K4me3_36_rmdup.bam &
samtools index H3K4me3_76_rmdup.bam &
samtools index H3K27me3_36_rmdup.bam &
samtools index H3K27me3_76_rmdup.bam &
wait
#bamCoverage -p max -e 200 -bs 1 --normalizeUsing CPM -b H3K4me3_36_rmdup.bam -o H3K4me3_36_rmdup.bw
#bamCoverage -p max -e 200 -bs 1 --normalizeUsing CPM -b H3K4me3_76_rmdup.bam -o H3K4me3_76_rmdup.bw
bamCoverage -p max -e 200 -bs 1 --normalizeUsing CPM -b H3K27me3_36_rmdup.bam -o H3K27me3_36_rmdup.bw
bamCoverage -p max -e 200 -bs 1 --normalizeUsing CPM -b H3K27me3_76_rmdup.bam -o H3K27me3_76_rmdup.bw

### DOWNLOAD BAMS
# H3K27me3 ENCSR216OGD
#1
wget https://www.encodeproject.org/files/ENCFF083QQZ/@@download/ENCFF083QQZ.bam
#2
wget https://www.encodeproject.org/files/ENCFF310SBN/@@download/ENCFF310SBN.bam

# H3K4me3 ENCSR019SQX
#1
wget https://www.encodeproject.org/files/ENCFF467XCU/@@download/ENCFF467XCU.bam
#2
wget https://www.encodeproject.org/files/ENCFF494FNC/@@download/ENCFF494FNC.bam
###########################################################################################
samtools index ENCFF083QQZ.bam &
samtools index ENCFF310SBN.bam &
samtools index ENCFF467XCU.bam &
samtools index ENCFF494FNC.bam &
wait
bamCoverage -p max -e 200 -bs 1 --normalizeUsing CPM -b ENCFF083QQZ.bam -o dw.H3K27me3_1_rmdup.bw
bamCoverage -p max -e 200 -bs 1 --normalizeUsing CPM -b ENCFF310SBN.bam -o dw.H3K27me3_2_rmdup.bw
bamCoverage -p max -e 200 -bs 1 --normalizeUsing CPM -b ENCFF467XCU.bam -o dw.H3K4me3_1_rmdup.bw
bamCoverage -p max -e 200 -bs 1 --normalizeUsing CPM -b ENCFF494FNC.bam -o dw.H3K4me3_2_rmdup.bw
##################################################################################################################
computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K4me3.bw \
/root/vivek/chip-seq/bw/NHM_H3K27me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K4me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K4me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K4me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27me3.bw \
/root/vivek/chip-seq/roadmap/dw.H3K4me3_1_rmdup.bw \
/root/vivek/chip-seq/roadmap/dw.H3K4me3_2_rmdup.bw \
/root/vivek/chip-seq/roadmap/dw.H3K27me3_1_rmdup.bw \
/root/vivek/chip-seq/roadmap/dw.H3K27me3_2_rmdup.bw \
-R /root/vivek/NHM/joe_costello/H1_heSC_poised_TSS.bed --referencePoint center \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out H1_heSC_poised_withRoadmapSample.mat

plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "H1-PoisedTSS" \
--colorMap Greens Reds Greens Reds Greens Reds Greens Reds Purples Purples Oranges Oranges \
-m H1_heSC_poised_withRoadmapSample.mat --zMin 0 0 0 0 0 0 0 0 --zMax 1.7 1.2 1.7 1.2 1.7 1.2 1.7 1.2 1.7 1.7 1.2 1.2 \
--samplesLabel "H3K4me3 NHM" "H3K27me3 NHM" "H3K4me3 NB" "H3K27me3 NB" "H3K4me3 NC" "H3K27me3 NC" "H3K4me3 NBC" "H3K27me3 NBC" \
"H3K4me3 hESC" "H3K4me3 hESC" "H3K27me3 hESC" "H3K27me3 hESC" \
-out H1_heSC_poised_withRoadmapSample_dw.pdf

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K4me3.bw \
/root/vivek/chip-seq/bw/NHM_H3K27me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K4me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K4me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K4me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27me3.bw \
/root/vivek/chip-seq/roadmap/H3K4me3_36_rmdup.bw \
/root/vivek/chip-seq/roadmap/H3K4me3_76_rmdup.bw \
/root/vivek/chip-seq/roadmap/H3K27me3_36_rmdup.bw \
/root/vivek/chip-seq/roadmap/H3K27me3_76_rmdup.bw \
-R /root/vivek/NHM/joe_costello/H1_heSC_poised_TSS.bed --referencePoint center \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out H1_heSC_poised_withRoadmapSample.mat

plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "H1-PoisedTSS" \
--colorMap Greens Reds Greens Reds Greens Reds Greens Reds Purples Purples Oranges Oranges \
-m H1_heSC_poised_withRoadmapSample.mat --zMin 0 0 0 0 0 0 0 0 --zMax 1.7 1.2 1.7 1.2 1.7 1.2 1.7 1.2 1.7 1.7 1.2 1.2 \
--samplesLabel "H3K4me3 NHM" "H3K27me3 NHM" "H3K4me3 NB" "H3K27me3 NB" "H3K4me3 NC" "H3K27me3 NC" "H3K4me3 NBC" "H3K27me3 NBC" \
"H3K4me3 hESC" "H3K4me3 hESC" "H3K27me3 hESC" "H3K27me3 hESC" \
-out H1_heSC_poised_withRoadmapSample_STAR.pdf
########
