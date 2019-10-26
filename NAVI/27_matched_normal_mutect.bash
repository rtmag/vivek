#ls -1 /home/rtm/vivek/navi/*/*/NORMAL_VM*recalibrated.bam|perl -pe 's/NORMAL_/\t/g'|sort -V -k2|perl -pe 's/\tVM/NORMAL_VM/g'

#ls -1 /home/rtm/vivek/navi/*/bam/*recalibrated.bam|perl -pe 's/bam\/VM/\tVM/g'|sort -V -k2|perl -pe 's/\tVM/bam\/VM/g'


/home/rtm/vivek/navi/wes4/bam/NORMAL_VM3_VM4.recalibrated.bam



/home/rtm/vivek/navi/wes/bam/VM7_recalibrated.bam
/home/rtm/vivek/navi/wes/bam/VM8_recalibrated.bam
/home/rtm/vivek/navi/wes4/bam/VM13.recalibrated.bam
/home/rtm/vivek/navi/wes_normal/bam/VM15.recalibrated.bam
/home/rtm/vivek/navi/wes3/bam/VM16.recalibrated.bam






/home/rtm/vivek/navi/wes/bam/VM25_recalibrated.bam
/home/rtm/vivek/navi/wes/bam/VM26_recalibrated.bam
/home/rtm/vivek/navi/wes4/bam/VM29.recalibrated.bam
/home/rtm/vivek/navi/wes_normal/bam/VM29.recalibrated.bam
/home/rtm/vivek/navi/wes/bam/VM31_recalibrated.bam
/home/rtm/vivek/navi/wes/bam/VM32_recalibrated.bam
/home/rtm/vivek/navi/wes/bam/VM33_recalibrated.bam
/home/rtm/vivek/navi/wes/bam/VM34_recalibrated.bam







/home/rtm/vivek/navi/wes3/bam/VM46.recalibrated.bam
/home/rtm/vivek/navi/wes4/bam/VM46.recalibrated.bam
/home/rtm/vivek/navi/wes4/bam/VM47.recalibrated.bam
/home/rtm/vivek/navi/wes3/bam/VM48.recalibrated.bam

####################################### NORMAL_VM1_VM2 ##########################################
java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM1_recalibrated.bam \
-I /home/rtm/vivek/navi/wes_normal/bam/NORMAL_VM1_VM2.recalibrated.bam \
-tumor VM1 \
-normal DLP-025_S66 \
--germline-resource /home/references/hg38_bundle/best_practice/af-only-gnomad.hg38_july_2019.vcf.gz \
-O /home/rtm/vivek/navi/mutect2/VM1.uf.vcf.gz

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM2_recalibrated.bam \
-I /home/rtm/vivek/navi/wes_normal/bam/NORMAL_VM1_VM2.recalibrated.bam \
-tumor VM2 \
-normal DLP-025_S66 \
--germline-resource /home/references/hg38_bundle/best_practice/af-only-gnomad.hg38_july_2019.vcf.gz \
-O /home/rtm/vivek/navi/mutect2/VM2.uf.vcf.gz

####################################### NORMAL_VM9_VM10 ##########################################
java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes_normal/bam/VM9.recalibrated.bam \
-I /home/rtm/vivek/navi/wes_normal/bam/NORMAL_VM9_VM10.recalibrated.bam \
-tumor DLP-027_S58 \
-normal DLP-026_S57 \
--germline-resource /home/references/hg38_bundle/best_practice/af-only-gnomad.hg38_july_2019.vcf.gz \
-O /home/rtm/vivek/navi/mutect2/VM9.uf.vcf.gz

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes_normal/bam/VM10.recalibrated.bam \
-I /home/rtm/vivek/navi/wes_normal/bam/NORMAL_VM9_VM10.recalibrated.bam \
-tumor DLP-028_S67 \
-normal DLP-026_S57 \
--germline-resource /home/references/hg38_bundle/best_practice/af-only-gnomad.hg38_july_2019.vcf.gz \
-O /home/rtm/vivek/navi/mutect2/VM10.uf.vcf.gz

####################################### NORMAL_VM11_VM12 ##########################################  
java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes_normal/bam/VM11.recalibrated.bam \
-I /home/rtm/vivek/navi/wes_normal/bam/NORMAL_VM11_VM12.recalibrated.bam \
-tumor DLP-031_S62 \
-normal DLP-029_S59 \
--germline-resource /home/references/hg38_bundle/best_practice/af-only-gnomad.hg38_july_2019.vcf.gz \
-O /home/rtm/vivek/navi/mutect2/VM11.uf.vcf.gz

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes_normal/bam/VM12.recalibrated.bam \
-I /home/rtm/vivek/navi/wes_normal/bam/NORMAL_VM11_VM12.recalibrated.bam \
-tumor DLP-030_S74 \
-normal DLP-029_S59 \
--germline-resource /home/references/hg38_bundle/best_practice/af-only-gnomad.hg38_july_2019.vcf.gz \
-O /home/rtm/vivek/navi/mutect2/VM12.uf.vcf.gz

####################################### NORMAL_VM17_VM18 ##########################################  
java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes_normal/bam/VM17.recalibrated.bam \
-I /home/rtm/vivek/navi/wes4/bam/NORMAL_VM17_VM18.recalibrated.bam \
-tumor DLP-047_S75 \
-normal DLP-68_S24_L003 \
--germline-resource /home/references/hg38_bundle/best_practice/af-only-gnomad.hg38_july_2019.vcf.gz \
-O /home/rtm/vivek/navi/mutect2/VM17.uf.vcf.gz

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes4/bam/VM18.recalibrated.bam \
-I /home/rtm/vivek/navi/wes4/bam/NORMAL_VM17_VM18.recalibrated.bam \
-tumor DLP-48_S22_L003 \
-normal DLP-68_S24_L003 \
--germline-resource /home/references/hg38_bundle/best_practice/af-only-gnomad.hg38_july_2019.vcf.gz \
-O /home/rtm/vivek/navi/mutect2/VM18.uf.vcf.gz

####################################### NORMAL_VM19_VM20 ##########################################  
java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM19_recalibrated.bam \
-I /home/rtm/vivek/navi/wes_normal/bam/NORMAL_VM19_VM20.recalibrated.bam \
-tumor VM19 \
-normal DLP-069_S61 \
--germline-resource /home/references/hg38_bundle/best_practice/af-only-gnomad.hg38_july_2019.vcf.gz \
-O /home/rtm/vivek/navi/mutect2/VM19.uf.vcf.gz

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM20_recalibrated.bam \
-I /home/rtm/vivek/navi/wes_normal/bam/NORMAL_VM19_VM20.recalibrated.bam \
-tumor VM20 \
-normal DLP-069_S61 \
--germline-resource /home/references/hg38_bundle/best_practice/af-only-gnomad.hg38_july_2019.vcf.gz \
-O /home/rtm/vivek/navi/mutect2/VM20.uf.vcf.gz

####################################### NORMAL_VM21_VM22 ##########################################  
java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes4/bam/VM21.recalibrated.bam \
-I /home/rtm/vivek/navi/wes_normal/bam/NORMAL_VM21_VM22.recalibrated.bam \
-tumor DLP-76_S25_L003 \
-normal DLP-070_S71 \
--germline-resource /home/references/hg38_bundle/best_practice/af-only-gnomad.hg38_july_2019.vcf.gz \
-O /home/rtm/vivek/navi/mutect2/VM21.uf.vcf.gz

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes_normal/bam/VM22.recalibrated.bam \
-I /home/rtm/vivek/navi/wes_normal/bam/NORMAL_VM21_VM22.recalibrated.bam \
-tumor DLP-052_S69 \
-normal DLP-070_S71 \
--germline-resource /home/references/hg38_bundle/best_practice/af-only-gnomad.hg38_july_2019.vcf.gz \
-O /home/rtm/vivek/navi/mutect2/VM22.uf.vcf.gz

####################################### NORMAL_VM35_VM36 ##########################################  
java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes3/bam/VM35.recalibrated.bam \
-I /home/rtm/vivek/navi/wes_normal/bam/NORMAL_VM35_VM36.recalibrated.bam \
-tumor VM35 \
-normal DLP-001_S65 \
--germline-resource /home/references/hg38_bundle/best_practice/af-only-gnomad.hg38_july_2019.vcf.gz \
-O /home/rtm/vivek/navi/mutect2/VM35.uf.vcf.gz

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes3/bam/VM36.recalibrated.bam \
-I /home/rtm/vivek/navi/wes_normal/bam/NORMAL_VM35_VM36.recalibrated.bam \
-tumor VM36 \
-normal DLP-001_S65 \
--germline-resource /home/references/hg38_bundle/best_practice/af-only-gnomad.hg38_july_2019.vcf.gz \
-O /home/rtm/vivek/navi/mutect2/VM36.uf.vcf.gz

####################################### NORMAL_VM37_VM38 ##########################################  
java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes3/bam/VM37.recalibrated.bam \
-I /home/rtm/vivek/navi/wes4/bam/NORMAL_VM37_VM38.recalibrated.bam \
-tumor VM37 \
-normal DLP-04_S13_L003 \
--germline-resource /home/references/hg38_bundle/best_practice/af-only-gnomad.hg38_july_2019.vcf.gz \
-O /home/rtm/vivek/navi/mutect2/VM37.uf.vcf.gz

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes4/bam/VM38.recalibrated.bam \
-I /home/rtm/vivek/navi/wes4/bam/NORMAL_VM37_VM38.recalibrated.bam \
-tumor DLP-05_S14_L003 \
-normal DLP-04_S13_L003 \
--germline-resource /home/references/hg38_bundle/best_practice/af-only-gnomad.hg38_july_2019.vcf.gz \
-O /home/rtm/vivek/navi/mutect2/VM38.uf.vcf.gz

####################################### NORMAL_VM39_VM40 ##########################################  
java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes4/bam/VM39.recalibrated.bam \
-I /home/rtm/vivek/navi/wes4/bam/NORMAL_VM39_VM40.recalibrated.bam \
-tumor DLP-16_S18_L003 \
-normal DLP-87_S29_L003 \
--germline-resource /home/references/hg38_bundle/best_practice/af-only-gnomad.hg38_july_2019.vcf.gz \
-O /home/rtm/vivek/navi/mutect2/VM39.uf.vcf.gz

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes4/bam/VM40.recalibrated.bam \
-I /home/rtm/vivek/navi/wes4/bam/NORMAL_VM39_VM40.recalibrated.bam \
-tumor DLP-15_S17_L003 \
-normal DLP-87_S29_L003 \
--germline-resource /home/references/hg38_bundle/best_practice/af-only-gnomad.hg38_july_2019.vcf.gz \
-O /home/rtm/vivek/navi/mutect2/VM40.uf.vcf.gz

####################################### NORMAL_VM41_VM42 ##########################################  
java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes3/bam/VM41.recalibrated.bam \
-I /home/rtm/vivek/navi/wes4/bam/NORMAL_VM41_VM42.recalibrated.bam \
-tumor VM41 \
-normal DLP-07_S15_L003 \
--germline-resource /home/references/hg38_bundle/best_practice/af-only-gnomad.hg38_july_2019.vcf.gz \
-O /home/rtm/vivek/navi/mutect2/VM39.uf.vcf.gz

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes3/bam/VM42.recalibrated.bam \
-I /home/rtm/vivek/navi/wes4/bam/NORMAL_VM41_VM42.recalibrated.bam \
-tumor VM42 \
-normal DLP-07_S15_L003 \
--germline-resource /home/references/hg38_bundle/best_practice/af-only-gnomad.hg38_july_2019.vcf.gz \
-O /home/rtm/vivek/navi/mutect2/VM40.uf.vcf.gz

####################################### NORMAL_VM43_VM44 ##########################################  
java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM43_recalibrated.bam \
-I /home/rtm/vivek/navi/wes_normal/bam/NORMAL_VM43_VM44.recalibrated.bam \
-tumor VM43 \
-normal DLP-073_S73 \
--germline-resource /home/references/hg38_bundle/best_practice/af-only-gnomad.hg38_july_2019.vcf.gz \
-O /home/rtm/vivek/navi/mutect2/VM39.uf.vcf.gz

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM44_recalibrated.bam \
-I /home/rtm/vivek/navi/wes_normal/bam/NORMAL_VM43_VM44.recalibrated.bam \
-tumor VM44 \
-normal DLP-073_S73 \
--germline-resource /home/references/hg38_bundle/best_practice/af-only-gnomad.hg38_july_2019.vcf.gz \
-O /home/rtm/vivek/navi/mutect2/VM40.uf.vcf.gz


#####################################################################################################################

####################################### NORMAL_VM3_VM4 ##########################################
# do VM3 and VM4

####################################### NORMAL_VM13_VM14 ##########################################
## LACKING VM14
java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes_normal/bam/VM11.recalibrated.bam \
-I /home/rtm/vivek/navi/wes4/bam/NORMAL_VM13_VM14.recalibrated.bam \
-tumor DLP-031_S62 \
-normal DLP-029_S59 \
--germline-resource /home/references/hg38_bundle/best_practice/af-only-gnomad.hg38_july_2019.vcf.gz \
-O /home/rtm/vivek/navi/mutect2/VM1.uf.vcf.gz

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes_normal/bam/VM12.recalibrated.bam \
-I /home/rtm/vivek/navi/wes4/bam/NORMAL_VM13_VM14.recalibrated.bam \
-tumor DLP-030_S74 \
-normal DLP-029_S59 \
--germline-resource /home/references/hg38_bundle/best_practice/af-only-gnomad.hg38_july_2019.vcf.gz \
-O /home/rtm/vivek/navi/mutect2/VM2.uf.vcf.gz



####################################### NORMAL_VM5_VM6 ##########################################
# VM5 MERGE BOTH BAMS for VM5
/home/rtm/vivek/navi/wes3/bam/VM5.recalibrated.bam
/home/rtm/vivek/navi/wes4/bam/VM5.recalibrated.bam

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I  \
-I /home/rtm/vivek/navi/wes4/bam/NORMAL_VM5_VM6.recalibrated.bam \
-tumor VM5 \
-normal DLP-83_S28_L003 \
--germline-resource /home/references/hg38_bundle/best_practice/af-only-gnomad.hg38_july_2019.vcf.gz \
-O /home/rtm/vivek/navi/mutect2/VM1.uf.vcf.gz

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes3/bam/VM6.recalibrated.bam \
-I /home/rtm/vivek/navi/wes4/bam/NORMAL_VM5_VM6.recalibrated.bam \
-tumor VM6 \
-normal DLP-83_S28_L003 \
--germline-resource /home/references/hg38_bundle/best_practice/af-only-gnomad.hg38_july_2019.vcf.gz \
-O /home/rtm/vivek/navi/mutect2/VM6.uf.vcf.gz


####################################### NORMAL_VM23_VM24 ##########################################  
# NO VM24 SAMPLE
java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes_normal/bam/VM23.recalibrated.bam \
-I /home/rtm/vivek/navi/wes_normal/bam/NORMAL_VM23_VM24.recalibrated.bam \
-tumor DLP-76_S25_L003 \
-normal DLP-070_S71 \
--germline-resource /home/references/hg38_bundle/best_practice/af-only-gnomad.hg38_july_2019.vcf.gz \
-O /home/rtm/vivek/navi/mutect2/VM19.uf.vcf.gz

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes_normal/bam/VM22.recalibrated.bam \
-I /home/rtm/vivek/navi/wes_normal/bam/NORMAL_VM23_VM24.recalibrated.bam \
-tumor DLP-052_S69 \
-normal DLP-070_S71 \
--germline-resource /home/references/hg38_bundle/best_practice/af-only-gnomad.hg38_july_2019.vcf.gz \
-O /home/rtm/vivek/navi/mutect2/VM20.uf.vcf.gz

####################################### NORMAL_VM45_VM46 ##########################################  
# DOUBLE VM46 both in WES3 and WES4
java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes_normal/bam/VM45.recalibrated.bam \
-I /home/rtm/vivek/navi/wes3/bam/NORMAL_VM45_VM46.recalibrated.bam \
-tumor VM43 \
-normal DLP-073_S73 \
--germline-resource /home/references/hg38_bundle/best_practice/af-only-gnomad.hg38_july_2019.vcf.gz \
-O /home/rtm/vivek/navi/mutect2/VM39.uf.vcf.gz

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM44_recalibrated.bam \
-I /home/rtm/vivek/navi/wes3/bam/NORMAL_VM45_VM46.recalibrated.bam \
-tumor VM44 \
-normal DLP-073_S73 \
--germline-resource /home/references/hg38_bundle/best_practice/af-only-gnomad.hg38_july_2019.vcf.gz \
-O /home/rtm/vivek/navi/mutect2/VM40.uf.vcf.gz
