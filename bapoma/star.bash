/home/rtm/myprograms/STAR/bin/Linux_x86_64/STAR  --genomeDir /logical_dev/resources/star_hg38_overhang100/ --genomeLoad LoadAndExit

#ls -1 *_R1.fastq.gz | \
#perl -pe 's/(.+)_R1.fastq.gz/ \/home\/rtm\/myprograms\/STAR\/bin\/Linux_x86_64\/STAR --genomeDir \/logical_dev\/resources\/star_hg38_overhang100\/ \\\n--readFilesCommand zcat --runThreadN 12 \\\n--readFilesIn \/home\/rtm\/CSI\/vivek\/bapoma\/fastq\/$1\_R1.fastq.gz \/home\/rtm\/CSI\/vivek\/bapoma\/fastq\/$1\_R2.fastq.gz  \\\n --outSAMtype BAM SortedByCoordinate --outFileNamePrefix \/home\/rtm\/CSI\/vivek\/bapoma\/bam\/$1_ \n/g' | perl -pe 's/(\/root\/vivek\/bam\/.+)\.fastq\.gz/$1_/g' 


 /home/rtm/myprograms/STAR/bin/Linux_x86_64/STAR --genomeDir /logical_dev/resources/star_hg38_overhang100/ \
--readFilesCommand zcat --runThreadN 12 \
--readFilesIn /home/rtm/CSI/vivek/bapoma/fastq/22121b_R1.fastq.gz /home/rtm/CSI/vivek/bapoma/fastq/22121b1_R2.fastq.gz  \
 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix /home/rtm/CSI/vivek/bapoma/bam/22121b_ 

 /home/rtm/myprograms/STAR/bin/Linux_x86_64/STAR --genomeDir /logical_dev/resources/star_hg38_overhang100/ \
--readFilesCommand zcat --runThreadN 12 \
--readFilesIn /home/rtm/CSI/vivek/bapoma/fastq/22121n1_R1.fastq.gz /home/rtm/CSI/vivek/bapoma/fastq/22121n1_R2.fastq.gz  \
 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix /home/rtm/CSI/vivek/bapoma/bam/22121n1_ 

 /home/rtm/myprograms/STAR/bin/Linux_x86_64/STAR --genomeDir /logical_dev/resources/star_hg38_overhang100/ \
--readFilesCommand zcat --runThreadN 12 \
--readFilesIn /home/rtm/CSI/vivek/bapoma/fastq/5009b2_R1.fastq.gz /home/rtm/CSI/vivek/bapoma/fastq/5009b2_R2.fastq.gz  \
 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix /home/rtm/CSI/vivek/bapoma/bam/5009b2_ 

 /home/rtm/myprograms/STAR/bin/Linux_x86_64/STAR --genomeDir /logical_dev/resources/star_hg38_overhang100/ \
--readFilesCommand zcat --runThreadN 12 \
--readFilesIn /home/rtm/CSI/vivek/bapoma/fastq/5009n2_R1.fastq.gz /home/rtm/CSI/vivek/bapoma/fastq/5009n2_R2.fastq.gz  \
 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix /home/rtm/CSI/vivek/bapoma/bam/5009n2_ 

 /home/rtm/myprograms/STAR/bin/Linux_x86_64/STAR --genomeDir /logical_dev/resources/star_hg38_overhang100/ \
--readFilesCommand zcat --runThreadN 12 \
--readFilesIn /home/rtm/CSI/vivek/bapoma/fastq/75350b_R1.fastq.gz /home/rtm/CSI/vivek/bapoma/fastq/75350b_R2.fastq.gz  \
 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix /home/rtm/CSI/vivek/bapoma/bam/75350b_ 

 /home/rtm/myprograms/STAR/bin/Linux_x86_64/STAR --genomeDir /logical_dev/resources/star_hg38_overhang100/ \
--readFilesCommand zcat --runThreadN 12 \
--readFilesIn /home/rtm/CSI/vivek/bapoma/fastq/75350n_R1.fastq.gz /home/rtm/CSI/vivek/bapoma/fastq/75350n_R2.fastq.gz  \
 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix /home/rtm/CSI/vivek/bapoma/bam/75350n_ 

 /home/rtm/myprograms/STAR/bin/Linux_x86_64/STAR --genomeDir /logical_dev/resources/star_hg38_overhang100/ \
--readFilesCommand zcat --runThreadN 12 \
--readFilesIn /home/rtm/CSI/vivek/bapoma/fastq/81374b1_R1.fastq.gz /home/rtm/CSI/vivek/bapoma/fastq/81374b1_R2.fastq.gz  \
 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix /home/rtm/CSI/vivek/bapoma/bam/81374b1_ 

 /home/rtm/myprograms/STAR/bin/Linux_x86_64/STAR --genomeDir /logical_dev/resources/star_hg38_overhang100/ \
--readFilesCommand zcat --runThreadN 12 \
--readFilesIn /home/rtm/CSI/vivek/bapoma/fastq/81374n1_R1.fastq.gz /home/rtm/CSI/vivek/bapoma/fastq/81374n1_R2.fastq.gz  \
 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix /home/rtm/CSI/vivek/bapoma/bam/81374n1_ 

 /home/rtm/myprograms/STAR/bin/Linux_x86_64/STAR --genomeDir /logical_dev/resources/star_hg38_overhang100/ \
--readFilesCommand zcat --runThreadN 12 \
--readFilesIn /home/rtm/CSI/vivek/bapoma/fastq/82483b1_R1.fastq.gz /home/rtm/CSI/vivek/bapoma/fastq/82483b1_R2.fastq.gz  \
 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix /home/rtm/CSI/vivek/bapoma/bam/82483b1_ 

 /home/rtm/myprograms/STAR/bin/Linux_x86_64/STAR --genomeDir /logical_dev/resources/star_hg38_overhang100/ \
--readFilesCommand zcat --runThreadN 12 \
--readFilesIn /home/rtm/CSI/vivek/bapoma/fastq/82483n2_R1.fastq.gz /home/rtm/CSI/vivek/bapoma/fastq/82483n2_R2.fastq.gz  \
 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix /home/rtm/CSI/vivek/bapoma/bam/82483n2_ 

 /home/rtm/myprograms/STAR/bin/Linux_x86_64/STAR --genomeDir /logical_dev/resources/star_hg38_overhang100/ \
--readFilesCommand zcat --runThreadN 12 \
--readFilesIn /home/rtm/CSI/vivek/bapoma/fastq/93178b1_R1.fastq.gz /home/rtm/CSI/vivek/bapoma/fastq/93178b1_R2.fastq.gz  \
 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix /home/rtm/CSI/vivek/bapoma/bam/93178b1_ 

 /home/rtm/myprograms/STAR/bin/Linux_x86_64/STAR --genomeDir /logical_dev/resources/star_hg38_overhang100/ \
--readFilesCommand zcat --runThreadN 12 \
--readFilesIn /home/rtm/CSI/vivek/bapoma/fastq/93178n1_R1.fastq.gz /home/rtm/CSI/vivek/bapoma/fastq/93178n1_R2.fastq.gz  \
 --outSAMtype BAM SortedByCoordinate --outFileNamePrefix /home/rtm/CSI/vivek/bapoma/bam/93178n1_ 










~/myPrograms/STAR/bin/Linux_x86_64/STAR --genomeDir /root/ayako/ref/mm10_star_sjdbO100/ --genomeLoad Remove
