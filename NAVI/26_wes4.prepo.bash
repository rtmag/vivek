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
samplename=$(echo $bamfile|perl -pe 's/\/home\/rtm\/vivek\/navi\/wes4\/bam\///g'|perl -pe 's/.bam//g') ;
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
for bamfile in /home/rtm/vivek/navi/wes4/bam/*.sort.bam ;
do echo $bamfile; 
samplename=$(echo $bamfile|perl -pe 's/\/home\/rtm\/vivek\/navi\/wes4\/bam\///g'|perl -pe 's/.sort.bam//g') ;
echo $samplename;
java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar MarkDuplicates \
VALIDATION_STRINGENCY=STRICT \
CREATE_INDEX=true \
M=/home/rtm/vivek/navi/wes4/bam/$samplename.MFILE.txt \
INPUT=$bamfile \
OUTPUT=/home/rtm/vivek/navi/wes4/bam/$samplename.rmdup.sort.bam ;
done
############################################################################################################################
############################################################################################################################
############################################################################################################################
for bamfile in /home/rtm/vivek/navi/wes4/bam/*.rmdup.sort.bam ;
do echo $bamfile; 
samplename=$(echo $bamfile|perl -pe 's/\/home\/rtm\/vivek\/navi\/wes4\/bam\///g'|perl -pe 's/.rmdup.sort.bam//g') ;
echo $samplename;
############################# Target intervals #############################
java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T RealignerTargetCreator \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-nt 20 \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-I $bamfile \
-o /home/rtm/vivek/navi/wes4/bam/$samplename.realign_target.intervals ;
############################# INDEL REALigner #############################
java -Xmx200g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T IndelRealigner \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-targetIntervals /home/rtm/vivek/navi/wes4/bam/$samplename.realign_target.intervals \
--noOriginalAlignmentTags \
-I $bamfile \
--out /home/rtm/vivek/navi/wes4/bam/$samplename.realigned.bam ;
############################## baserecalibrator #############################
java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T BaseRecalibrator \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-knownSites /home/references/broadhg38/broad_hg38/dbsnp_146.hg38.vcf \
-I /home/rtm/vivek/navi/wes4/bam/$samplename.realigned.bam \
-o /home/rtm/vivek/navi/wes4/bam/$samplename.bqsr.grp ;
############################# recalibrate #############################
java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T PrintReads \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes4/bam/$samplename.realigned.bam \
--BQSR /home/rtm/vivek/navi/wes4/bam/$samplename.bqsr.grp \
-o /home/rtm/vivek/navi/wes4/bam/$samplename.recalibrated.bam ;
done
############################################################################################################################


#### MUTECT VCF ALL Variant NO NORMAL using gatk4.1.3
for bamfile in /home/rtm/vivek/navi/wes4/bam/VM*recalibrated.bam;
do ls -lh $bamfile; 
name=${bamfile//\/home\/rtm\/vivek\/navi\/wes4\/bam\/} ;
sample=${name//\.recalibrated\.bam} ;
java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.3.0/gatk-package-4.1.3.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I $bamfile \
-tumor $sample \
-O /home/rtm/vivek/navi/wes4/vcf_gatk4.1.3/all_$sample.vcf.gz
done
############################################################################################################################
#### FUNCOTATOR VCF ALL Variant NO NORMAL
for vcf in /home/rtm/vivek/navi/wes4/vcf_gatk4.1.3/*tbi;
do echo $vcf; 
name=${vcf//\/home\/rtm\/vivek\/navi\/wes4\/vcf_gatk4.1.3\/} ;
name=${name//\.vcf\.gz\.tbi} ;
echo $name;
java -Xmx50G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar FilterMutectCalls \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-V /home/rtm/vivek/navi/wes4/vcf_gatk4.1.3/$name.vcf.gz \
-O /home/rtm/vivek/navi/wes4/vcf_test/$name.filtered.vcf.gz ;
java -Xmx50G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar SelectVariants \
   -R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
   -V /home/rtm/vivek/navi/wes4/vcf_test/$name.filtered.vcf.gz \
   -O /home/rtm/vivek/navi/wes4/vcf_test/$name.filtered.PASS.vcf.gz \
   --exclude-filtered ;
java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Funcotator \
   -R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
   -V /home/rtm/vivek/navi/wes4/vcf_test/$name.filtered.PASS.vcf.gz \
   -O /home/rtm/vivek/navi/wes4/vcf_test/$name.maf \
   --data-sources-path /home/rtm/myprograms/funcotator_data/funcotator_dataSources.v1.6.20190124s/ \
   --ref-version hg38 --output-file-format MAF;
done
#######################################################################
