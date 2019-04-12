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
--readFilesIn ENCFF296CUY.fastq.gz \
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
