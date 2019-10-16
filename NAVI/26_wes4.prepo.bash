# Unzip all files
unzip "*.zip"

############################################################################################################################
# Trimming

for fastqfile in /home/rtm/vivek/navi/wes4/fastq/*_R1_001.fastq.gz ;
do echo $fastqfile; 
fastq2=$(echo $fastqfile|perl -pe "s/_R1_/_R2_/g") ;
/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 \
--fastqc -o /home/rtm/vivek/navi/wes4/fastq_trim/ \
$fastqfile \
$fastq2 &
done
############################################################################################################################


