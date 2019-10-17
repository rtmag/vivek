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
# Mapping

for fastqfile in /home/rtm/vivek/navi/wes4/fastq_trim/*R1*.fq.gz ;
do echo $fastqfile; 
fastq2=$(echo $fastqfile|perl -pe "s/R1_val_1/R2_val_2/g") ;
samplename=$(echo $fastqfile|perl -pe 's/\/home\/rtm\/vivek\/navi\/wes3\/fastq_trimmed\///g'|perl -pe 's/_R.+_val_.+//g') ;
echo $fastq2;
echo $samplename;
bwa mem -t 23 -T 0 -R "@RG\tID:$samplename\tLB:WES3\tPL:illumina\tPU:NULL\tSM:$samplename" \
/home/references/broadhg38/bwa/Homo_sapiens_assembly38.fasta.gz $fastqfile $fastq2 | \
samtools view -Shb -o /home/rtm/vivek/navi/wes3/bam/$samplename.bam - ;
done

############################################################################################################################
# BAM SORT
for fastqfile in /home/rtm/vivek/navi/wes4/fastq_trim/*R1*.fq.gz ;
do echo $fastqfile; 
fastq2=$(echo $fastqfile|perl -pe "s/R1_001_val_1/R2_001_val_2/g") ;
samplename=$(basename $fastqfile) ;
samplename=$(echo $samplename|perl -pe "s/_R1_001_val_1.fq.gz//g") ;
echo $fastq2;
echo $samplename;
bwa mem -t 23 -T 0 -R "@RG\tID:$samplename\tLB:WES4\tPL:illumina\tPU:NULL\tSM:$samplename" \
/home/references/broadhg38/bwa/Homo_sapiens_assembly38.fasta.gz $fastqfile $fastq2 | \
samtools view -Shb -o /home/rtm/vivek/navi/wes4/bam/$samplename.bam - ;
done
############################################################################################################################
