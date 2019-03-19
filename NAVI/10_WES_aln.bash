bwa mem -M -t 16 -T 0 \
-R @BATCH1_VN \
/home/references/bwa_hg38/genome.fa \
/home/rtm/CY/RawData/P007_48_DMSO/P007_48_DMSO_1.fq.gz \
/home/rtm/CY/RawData/P007_48_DMSO/P007_48_DMSO_2.fq.gz | \
samtools view -Shb -o <output.bam> -
