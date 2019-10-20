

/home/rtm/myprograms/mosdepth/mosdepth -t 4 --by MedExome_hg38_empirical_targets.bed \
VM19 /home/rtm/vivek/navi/wes/bam/VM19_recalibrated.bam


python /home/rtm/myprograms/mosdepth/scripts/plot-dist.py VM19.mosdepth.global.dist.txt

samtools depth -b /home/rtm/vivek/navi/WES_coverage/MedExome_hg38_empirical_targets.bed \
/home/rtm/vivek/navi/wes/bam/VM19_recalibrated.bam | awk '{sum+=$3} END { print "Average = ",sum/NR}'

java -jar picard.jar CollectHsMetrics I=Sample.bam O=hsmetrix.txt BI=target.interval_list TI=target.interval_list


java -jar /home/rtm/myprograms/picard/build/libs/picard.jar CollectHsMetrics \
BI=

CollectHsMetrics

####
java -jar /home/rtm/myprograms/picard/build/libs/picard.jar BedToIntervalList \
I=MedExome_hg38_capture_targets.bed \
O=MedExome_hg38_capture_targets.interval_list \
SD=/home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta

java -jar /home/rtm/myprograms/picard/build/libs/picard.jar BedToIntervalList \
I=MedExome_hg38_empirical_targets.bed \
O=MedExome_hg38_empirical_targets.interval_list \
SD=/home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta

java -jar /home/rtm/myprograms/picard/build/libs/picard.jar CollectHsMetrics \
TARGET_INTERVALS=MedExome_hg38_empirical_targets.interval_list \
BAIT_INTERVALS=MedExome_hg38_capture_targets.interval_list \
I=/home/rtm/vivek/navi/wes/bam/VM19_recalibrated.bam \
O=VM19.hsmetrix

##########################################################################################
##########################################################################################
for bamfile in /home/rtm/vivek/navi/wes*/bam/*recalibrated*bam;
do ls -lh $bamfile; 
sampleOut=$(basename $bamfile) ;
java -jar /home/rtm/myprograms/picard/build/libs/picard.jar CollectHsMetrics \
TARGET_INTERVALS=MedExome_hg38_empirical_targets.interval_list \
BAIT_INTERVALS=MedExome_hg38_capture_targets.interval_list \
I=$bamfile \
O=$sampleOut.hsmetrix ;
done
##########################################################################################
##########################################################################################
for bamfile in /home/rtm/vivek/navi/wes*/bam/*recalibrated*bam;
do ls -lh $bamfile; 
sampleOut=$(basename $bamfile) ;
java -Xmx100g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar -T DepthOfCoverage \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
   -o /home/rtm/vivek/navi/WES_coverage/DepthOfCoverage/$sampleOut.DepthOfCoverage \
   -I $bamfile \
   -L MedExome_hg38_empirical_targets.interval_list \
   -ct 10 ;
done


 grep -P "BRAF" /home/rtm/vivek/navi/wes3/vcf_test/all_VM42.maf| \
 grep -P -i "Missense_Mutation|Nonsense_Mutation|Nonstop_Mutation|_Del|_Ins"| \
 cut -f 1,5-10,35,37,38,41,42,80-82| \
 sort -V -k 1
 

 grep -P -w "BRAF" /home/rtm/vivek/navi/*/*/*maf| \
 grep -P -i "Missense_Mutation|Nonsense_Mutation|Nonstop_Mutation|_Del|_Ins"| \
 cut -f 1,5-10,35,37,38,41,42,80-82|perl -pe 's/\t/\,/g'| \
 perl -pe 's/\/home\/rtm\/vivek\/navi\/wes\/test\_funcotator\/all\_//g'|perl -pe 's/\.maf\:/\,/g'| \
 perl -pe 's/\/home\/rtm\/vivek\/navi\/wes3\/vcf\_test\/all\_//g'|sort -V -k 1




