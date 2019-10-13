

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
