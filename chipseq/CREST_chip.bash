
~/myPrograms/sra-tools/sratoolkit.2.9.0-centos_linux64/bin/fastq-dump --split-files -Z SRR191355 > SRR191355.fastq 

trim_galore --illumina -q 20 --fastqc -o /root/vivek/chip-seq/trimmed/ SRR191355.fastq 

STAR --genomeDir /root/resources/hg38_noanno/ \
--readFilesCommand zcat \
--runThreadN 60 \
--alignIntronMax 1 \
--alignEndsType EndToEnd \
--readFilesIn SRR191355.fastq \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix crest_

java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=crest_Aligned.sortedByCoord.out.bam \
O=crest_rmdup.bam \
M=crest_rmdup.mfile 

samtools index crest_rmdup.bam 

bamCoverage -p max -e 200 -bs 1 --normalizeUsing CPM -b crest_rmdup.bam -o crest.bw
