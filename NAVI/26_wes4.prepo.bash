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
#annotate bam
mv DLP-04_S13_L003.bam NORMAL_VM37_VM38.bam
mv DLP-05_S14_L003.bam VM38.bam
mv DLP-07_S15_L003.bam NORMAL_VM41_VM42.bam
mv DLP-10_S16_L003.bam NORMAL_VM3_VM4.bam
mv DLP-15_S17_L003.bam VM40.bam
mv DLP-16_S18_L003.bam VM39.bam
mv DLP-20_S19_L003.bam VM5.bam
mv DLP-23_S20_L003.bam NORMAL_VM13_VM14.bam
mv DLP-24_S21_L003.bam VM13.bam
mv DLP-48_S22_L003.bam VM18.bam
mv DLP-59_S23_L003.bam VM29.bam
mv DLP-68_S24_L003.bam NORMAL_VM17_VM18.bam
mv DLP-76_S25_L003.bam VM21.bam
mv DLP-80_S26_L003.bam VM47.bam
mv DLP-81_S27_L003.bam VM46.bam
mv DLP-83_S28_L003.bam NORMAL_VM5_VM6.bam
mv DLP-87_S29_L003.bam NORMAL_VM39_VM40.bam
mv DLP-88_S30_L003.bam discard/
############################################################################################################################
# BAM SORT
for bamfile in /home/rtm/vivek/navi/wes4/bam/*bam ;
do echo $bamfile; 
samplename=$(echo $bamfile|perl -pe 's/\/home\/rtm\/vivek\/navi\/wes3\/bam\///g'|perl -pe 's/.bam//g') ;
echo $samplename;
java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=$bamfile \
OUTPUT=/home/rtm/vivek/navi/wes4/bam/$samplename.sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT;
done
############################################################################################################################
# RMDUP
for bamfile in /home/rtm/vivek/navi/wes3/bam/*.sort.bam ;
do echo $bamfile; 
samplename=$(echo $bamfile|perl -pe 's/\/home\/rtm\/vivek\/navi\/wes3\/bam\///g'|perl -pe 's/.sort.bam//g') ;
echo $samplename;
java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar MarkDuplicates \
VALIDATION_STRINGENCY=STRICT \
CREATE_INDEX=true \
M=$samplename.MFILE.txt \
INPUT=$bamfile \
OUTPUT=$samplename.rmdup.sort.bam ;
done
############################################################################################################################
