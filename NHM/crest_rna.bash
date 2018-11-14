~/myPrograms/sra-tools/sratoolkit.2.9.0-centos_linux64/bin/fastq-dump --split-files -Z SRR191362 > SRR191362.fastq

STAR --genomeDir /root/resources/star_hg38_gencode27_overhang50/ \
--runThreadN 55 \
--readFilesIn SRR191362.fastq \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix crest_
