
/home/sb/programfiles/STAR/bin/Linux_x86_64/STAR --genomeDir /home/roberto/references/star_hg38_gencode26_overhang149 \
--readFilesCommand zcat \
--runThreadN 35 \
--readFilesIn /home/roberto/deepa/novogene/HCT116_siC_1.fq.gz \
/home/roberto/deepa/novogene/HCT116_siC_2.fq.gz \
--outSAMtype BAM SortedByCoordinate  \
--outFileNamePrefix /home/roberto/deepa/novogene/STAR/HCT116_siC_
