# https://gatkforums.broadinstitute.org/gatk/discussion/11136/how-to-call-somatic-mutations-using-gatk4-mutect2
# region chr7:140753269-140753400


/home/rtm/vivek/navi/wes/bam/VM1_recalibrated.bam
/home/rtm/vivek/navi/wes/bam/VM20_recalibrated.bam
/home/rtm/vivek/navi/wes/bam/VM25_recalibrated.bam
/home/rtm/vivek/navi/wes/bam/VM26_recalibrated.bam
/home/rtm/vivek/navi/wes/bam/VM2_recalibrated.bam
/home/rtm/vivek/navi/wes/bam/VM31_recalibrated.bam
/home/rtm/vivek/navi/wes/bam/VM32_recalibrated.bam
/home/rtm/vivek/navi/wes/bam/VM33_recalibrated.bam
/home/rtm/vivek/navi/wes/bam/VM34_recalibrated.bam
/home/rtm/vivek/navi/wes/bam/VM43_recalibrated.bam
/home/rtm/vivek/navi/wes/bam/VM44_recalibrated.bam
/home/rtm/vivek/navi/wes/bam/VM7_recalibrated.bam
/home/rtm/vivek/navi/wes/bam/VM8_recalibrated.bam

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM19_recalibrated.bam \
-tumor VM19 \
--germline-resource /home/references/hg38_bundle/gnomad.exomes.r2.1.1.AFonly.withChr.b37tohg38.vcf \
-L chr7:140753269-140753400 \
-O /home/rtm/vivek/navi/wes/braf_vc/VM19_BRAF_EXON15.vcf.gz \
--af-of-alleles-not-in-resource 2.5e-06 

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM1_recalibrated.bam \
-tumor VM1 \
--germline-resource /home/references/hg38_bundle/gnomad.exomes.r2.1.1.AFonly.withChr.b37tohg38.vcf \
-L chr7:140753269-140753400 \
-O /home/rtm/vivek/navi/wes/braf_vc/VM1_BRAF_EXON15.vcf.gz \
--af-of-alleles-not-in-resource 2.5e-06 

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM20_recalibrated.bam \
-tumor VM20 \
--germline-resource /home/references/hg38_bundle/gnomad.exomes.r2.1.1.AFonly.withChr.b37tohg38.vcf \
-L chr7:140753269-140753400 \
-O /home/rtm/vivek/navi/wes/braf_vc/VM20_BRAF_EXON15.vcf.gz \
--af-of-alleles-not-in-resource 2.5e-06 

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM25_recalibrated.bam \
-tumor VM25 \
--germline-resource /home/references/hg38_bundle/gnomad.exomes.r2.1.1.AFonly.withChr.b37tohg38.vcf \
-L chr7:140753269-140753400 \
-O /home/rtm/vivek/navi/wes/braf_vc/VM25_BRAF_EXON15.vcf.gz \
--af-of-alleles-not-in-resource 2.5e-06 

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM26_recalibrated.bam \
-tumor VM26 \
--germline-resource /home/references/hg38_bundle/gnomad.exomes.r2.1.1.AFonly.withChr.b37tohg38.vcf \
-L chr7:140753269-140753400 \
-O /home/rtm/vivek/navi/wes/braf_vc/VM26_BRAF_EXON15.vcf.gz \
--af-of-alleles-not-in-resource 2.5e-06 

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM2_recalibrated.bam \
-tumor VM2 \
--germline-resource /home/references/hg38_bundle/gnomad.exomes.r2.1.1.AFonly.withChr.b37tohg38.vcf \
-L chr7:140753269-140753400 \
-O /home/rtm/vivek/navi/wes/braf_vc/VM2_BRAF_EXON15.vcf.gz \
--af-of-alleles-not-in-resource 2.5e-06 

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM31_recalibrated.bam \
-tumor VM31 \
--germline-resource /home/references/hg38_bundle/gnomad.exomes.r2.1.1.AFonly.withChr.b37tohg38.vcf \
-L chr7:140753269-140753400 \
-O /home/rtm/vivek/navi/wes/braf_vc/VM31_BRAF_EXON15.vcf.gz \
--af-of-alleles-not-in-resource 2.5e-06 

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM32_recalibrated.bam \
-tumor VM32 \
--germline-resource /home/references/hg38_bundle/gnomad.exomes.r2.1.1.AFonly.withChr.b37tohg38.vcf \
-L chr7:140753269-140753400 \
-O /home/rtm/vivek/navi/wes/braf_vc/VM32_BRAF_EXON15.vcf.gz \
--af-of-alleles-not-in-resource 2.5e-06 

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM33_recalibrated.bam \
-tumor VM33 \
--germline-resource /home/references/hg38_bundle/gnomad.exomes.r2.1.1.AFonly.withChr.b37tohg38.vcf \
-L chr7:140753269-140753400 \
-O /home/rtm/vivek/navi/wes/braf_vc/VM33_BRAF_EXON15.vcf.gz \
--af-of-alleles-not-in-resource 2.5e-06 

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM34_recalibrated.bam \
-tumor VM34 \
--germline-resource /home/references/hg38_bundle/gnomad.exomes.r2.1.1.AFonly.withChr.b37tohg38.vcf \
-L chr7:140753269-140753400 \
-O /home/rtm/vivek/navi/wes/braf_vc/VM34_BRAF_EXON15.vcf.gz \
--af-of-alleles-not-in-resource 2.5e-06

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM43_recalibrated.bam \
-tumor VM43 \
--germline-resource /home/references/hg38_bundle/gnomad.exomes.r2.1.1.AFonly.withChr.b37tohg38.vcf \
-L chr7:140753269-140753400 \
-O /home/rtm/vivek/navi/wes/braf_vc/VM43_BRAF_EXON15.vcf.gz \
--af-of-alleles-not-in-resource 2.5e-06 

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM44_recalibrated.bam \
-tumor VM44 \
--germline-resource /home/references/hg38_bundle/gnomad.exomes.r2.1.1.AFonly.withChr.b37tohg38.vcf \
-L chr7:140753269-140753400 \
-O /home/rtm/vivek/navi/wes/braf_vc/VM44_BRAF_EXON15.vcf.gz \
--af-of-alleles-not-in-resource 2.5e-06

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM7_recalibrated.bam \
-tumor VM7 \
--germline-resource /home/references/hg38_bundle/gnomad.exomes.r2.1.1.AFonly.withChr.b37tohg38.vcf \
-L chr7:140753269-140753400 \
-O /home/rtm/vivek/navi/wes/braf_vc/VM7_BRAF_EXON15.vcf.gz \
--af-of-alleles-not-in-resource 2.5e-06

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM8_recalibrated.bam \
-tumor VM8 \
--germline-resource /home/references/hg38_bundle/gnomad.exomes.r2.1.1.AFonly.withChr.b37tohg38.vcf \
-L chr7:140753269-140753400 \
-O /home/rtm/vivek/navi/wes/braf_vc/VM8_BRAF_EXON15.vcf.gz \
--af-of-alleles-not-in-resource 2.5e-06 
################
# EXON15 BRAF
for bamfile in /home/rtm/vivek/navi/wes/bam/*_recalibrated.bam;
do ls -lh $bamfile; 
name=${bamfile//\/home\/rtm\/vivek\/navi\/wes\/bam\/} ;
sample=${name//\_recalibrated\.bam} ;
java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I $bamfile \
-tumor $sample \
-L chr7:140730665-140924928 \
-O /home/rtm/vivek/navi/wes/braf_vc/BRAF_$sample.vcf.gz
done

zgrep -P "chr7\t" *vcf.gz
zgrep -P "chr7\t" BRAF_*.vcf.gz|cut -f1-7|perl -pe 's/\:/\t/g' > BRAF_summary_noFILTER.txt

# NRAS
for bamfile in /home/rtm/vivek/navi/wes/bam/*_recalibrated.bam;
do ls -lh $bamfile; 
name=${bamfile//\/home\/rtm\/vivek\/navi\/wes\/bam\/} ;
sample=${name//\_recalibrated\.bam} ;
java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I $bamfile \
-tumor $sample \
-L chr1:114704469-114716894 \
-O /home/rtm/vivek/navi/wes/braf_vc/NRAS_$sample.vcf.gz
done

zgrep -P "chr1\t" *vcf.gz
zgrep -P "chr1\t" *vcf.gz|cut -f1-7|perl -pe 's/\:/\t/g' > NRAS_summary_noFILTER.txt

#NF1
for bamfile in /home/rtm/vivek/navi/wes/bam/*_recalibrated.bam;
do ls -lh $bamfile; 
name=${bamfile//\/home\/rtm\/vivek\/navi\/wes\/bam\/} ;
sample=${name//\_recalibrated\.bam} ;
java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I $bamfile \
-tumor $sample \
-L chr17:31094927-31377677 \
-O /home/rtm/vivek/navi/wes/braf_vc/NF1_$sample.vcf.gz
done

zgrep -P "chr17\t" *vcf.gz
zgrep -P "chr17\t" *vcf.gz|cut -f1-7|perl -pe 's/\:/\t/g' > NF1_summary_noFILTER.txt


##################
#ALL Variant NO NORMAL
for bamfile in /home/rtm/vivek/navi/wes/bam/*_recalibrated.bam;
do ls -lh $bamfile; 
name=${bamfile//\/home\/rtm\/vivek\/navi\/wes\/bam\/} ;
sample=${name//\_recalibrated\.bam} ;
java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I $bamfile \
-tumor $sample \
-O /home/rtm/vivek/navi/wes/test_vcf/all_$sample.vcf.gz
done
##################
##################
#ALL Variant NO NORMAL; On the WES_normal directory
for bamfile in /home/rtm/vivek/navi/wes_normal/bam/VM*.recalibrated.bam;
do ls -lh $bamfile; 
name=${bamfile//\/home\/rtm\/vivek\/navi\/wes_normal\/bam\/} ;
sample=${name//\.recalibrated\.bam} ;
java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I $bamfile \
-tumor $sample \
-O /home/rtm/vivek/navi/wes/test_vcf/all_$sample.vcf.gz
done
############################################################################################################
############################################################################################################

all_VM10.vcf.gz
all_VM19.vcf.gz
all_VM1.vcf.gz
all_VM20.vcf.gz
all_VM25.vcf.gz
all_VM26.vcf.gz
all_VM2.vcf.gz
all_VM31.vcf.gz
all_VM32.vcf.gz

all_VM11.vcf.gz
all_VM12.vcf.gz
all_VM15.vcf.gz
all_VM17.vcf.gz
all_VM22.vcf.gz
all_VM33.vcf.gz
all_VM34.vcf.gz
all_VM43.vcf.gz
all_VM44.vcf.gz

############################################################################################################
############################################################################################################
all_VM7.vcf.gz
all_VM23.vcf.gz
all_VM23.vcf.gz
all_VM29.vcf.gz
all_VM45.vcf.gz
all_VM7.vcf.gz

############################################################################################################
############################################################################################################
java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Funcotator \
   -R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
   -V /home/rtm/vivek/navi/wes/test_vcf/all_VM10.vcf.gz \
   -O /home/rtm/vivek/navi/wes/test_funcotator/all_VM10.maf \
   --data-sources-path /home/rtm/myprograms/funcotator_data/funcotator_dataSources.v1.6.20190124s/ \
   --ref-version hg38 --output-file-format MAF
 
 java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Funcotator \
   -R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
   -V /home/rtm/vivek/navi/wes/test_vcf/all_VM19.vcf.gz \
   -O /home/rtm/vivek/navi/wes/test_funcotator/all_VM19.maf \
   --data-sources-path /home/rtm/myprograms/funcotator_data/funcotator_dataSources.v1.6.20190124s/ \
   --ref-version hg38 --output-file-format MAF
   
   java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Funcotator \
   -R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
   -V /home/rtm/vivek/navi/wes/test_vcf/all_VM1.vcf.gz \
   -O /home/rtm/vivek/navi/wes/test_funcotator/all_VM1.maf \
   --data-sources-path /home/rtm/myprograms/funcotator_data/funcotator_dataSources.v1.6.20190124s/ \
   --ref-version hg38 --output-file-format MAF
   
   java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Funcotator \
   -R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
   -V /home/rtm/vivek/navi/wes/test_vcf/all_VM20.vcf.gz \
   -O /home/rtm/vivek/navi/wes/test_funcotator/all_VM20.maf \
   --data-sources-path /home/rtm/myprograms/funcotator_data/funcotator_dataSources.v1.6.20190124s/ \
   --ref-version hg38 --output-file-format MAF

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Funcotator \
   -R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
   -V /home/rtm/vivek/navi/wes/test_vcf/all_VM25.vcf.gz \
   -O /home/rtm/vivek/navi/wes/test_funcotator/all_VM25.maf \
   --data-sources-path /home/rtm/myprograms/funcotator_data/funcotator_dataSources.v1.6.20190124s/ \
   --ref-version hg38 --output-file-format MAF

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Funcotator \
   -R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
   -V /home/rtm/vivek/navi/wes/test_vcf/all_VM26.vcf.gz \
   -O /home/rtm/vivek/navi/wes/test_funcotator/all_VM26.maf \
   --data-sources-path /home/rtm/myprograms/funcotator_data/funcotator_dataSources.v1.6.20190124s/ \
   --ref-version hg38 --output-file-format MAF
   
   java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Funcotator \
   -R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
   -V /home/rtm/vivek/navi/wes/test_vcf/all_VM2.vcf.gz \
   -O /home/rtm/vivek/navi/wes/test_funcotator/all_VM2.maf \
   --data-sources-path /home/rtm/myprograms/funcotator_data/funcotator_dataSources.v1.6.20190124s/ \
   --ref-version hg38 --output-file-format MAF
   
      java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Funcotator \
   -R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
   -V /home/rtm/vivek/navi/wes/test_vcf/all_VM31.vcf.gz \
   -O /home/rtm/vivek/navi/wes/test_funcotator/all_VM31.maf \
   --data-sources-path /home/rtm/myprograms/funcotator_data/funcotator_dataSources.v1.6.20190124s/ \
   --ref-version hg38 --output-file-format MAF
   
java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Funcotator \
   -R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
   -V /home/rtm/vivek/navi/wes/test_vcf/all_VM32.vcf.gz \
   -O /home/rtm/vivek/navi/wes/test_funcotator/all_VM32.maf \
   --data-sources-path /home/rtm/myprograms/funcotator_data/funcotator_dataSources.v1.6.20190124s/ \
   --ref-version hg38 --output-file-format MAF
 ###################################################

   
   java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Funcotator \
   -R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
   -V /home/rtm/vivek/navi/wes/test_vcf/all_VM11.vcf.gz \
   -O /home/rtm/vivek/navi/wes/test_funcotator/all_VM11.maf \
   --data-sources-path /home/rtm/myprograms/funcotator_data/funcotator_dataSources.v1.6.20190124s/ \
   --ref-version hg38 --output-file-format MAF
   
   java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Funcotator \
   -R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
   -V /home/rtm/vivek/navi/wes/test_vcf/all_VM12.vcf.gz \
   -O /home/rtm/vivek/navi/wes/test_funcotator/all_VM12.maf \
   --data-sources-path /home/rtm/myprograms/funcotator_data/funcotator_dataSources.v1.6.20190124s/ \
   --ref-version hg38 --output-file-format MAF
   
      java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Funcotator \
   -R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
   -V /home/rtm/vivek/navi/wes/test_vcf/all_VM15.vcf.gz \
   -O /home/rtm/vivek/navi/wes/test_funcotator/all_VM15.maf \
   --data-sources-path /home/rtm/myprograms/funcotator_data/funcotator_dataSources.v1.6.20190124s/ \
   --ref-version hg38 --output-file-format MAF
   
      java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Funcotator \
   -R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
   -V /home/rtm/vivek/navi/wes/test_vcf/all_VM17.vcf.gz \
   -O /home/rtm/vivek/navi/wes/test_funcotator/all_VM17.maf \
   --data-sources-path /home/rtm/myprograms/funcotator_data/funcotator_dataSources.v1.6.20190124s/ \
   --ref-version hg38 --output-file-format MAF
   
      java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Funcotator \
   -R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
   -V /home/rtm/vivek/navi/wes/test_vcf/all_VM22.vcf.gz \
   -O /home/rtm/vivek/navi/wes/test_funcotator/all_VM22.maf \
   --data-sources-path /home/rtm/myprograms/funcotator_data/funcotator_dataSources.v1.6.20190124s/ \
   --ref-version hg38 --output-file-format MAF
   
      java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Funcotator \
   -R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
   -V /home/rtm/vivek/navi/wes/test_vcf/all_VM33.vcf.gz \
   -O /home/rtm/vivek/navi/wes/test_funcotator/all_VM33.maf \
   --data-sources-path /home/rtm/myprograms/funcotator_data/funcotator_dataSources.v1.6.20190124s/ \
   --ref-version hg38 --output-file-format MAF
   
      java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Funcotator \
   -R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
   -V /home/rtm/vivek/navi/wes/test_vcf/all_VM34.vcf.gz \
   -O /home/rtm/vivek/navi/wes/test_funcotator/all_VM34.maf \
   --data-sources-path /home/rtm/myprograms/funcotator_data/funcotator_dataSources.v1.6.20190124s/ \
   --ref-version hg38 --output-file-format MAF
   
      java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Funcotator \
   -R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
   -V /home/rtm/vivek/navi/wes/test_vcf/all_VM43.vcf.gz \
   -O /home/rtm/vivek/navi/wes/test_funcotator/all_VM43.maf \
   --data-sources-path /home/rtm/myprograms/funcotator_data/funcotator_dataSources.v1.6.20190124s/ \
   --ref-version hg38 --output-file-format MAF
   
      java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Funcotator \
   -R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
   -V /home/rtm/vivek/navi/wes/test_vcf/all_VM44.vcf.gz \
   -O /home/rtm/vivek/navi/wes/test_funcotator/all_VM44.maf \
   --data-sources-path /home/rtm/myprograms/funcotator_data/funcotator_dataSources.v1.6.20190124s/ \
   --ref-version hg38 --output-file-format MAF
################################################################
################################################################

      java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Funcotator \
   -R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
   -V /home/rtm/vivek/navi/wes/test_vcf/all_VM7.vcf.gz \
   -O /home/rtm/vivek/navi/wes/test_funcotator/all_VM7.maf \
   --data-sources-path /home/rtm/myprograms/funcotator_data/funcotator_dataSources.v1.6.20190124s/ \
   --ref-version hg38 --output-file-format MAF
   
         java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Funcotator \
   -R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
   -V /home/rtm/vivek/navi/wes/test_vcf/all_VM23.vcf.gz \
   -O /home/rtm/vivek/navi/wes/test_funcotator/all_VM23.maf \
   --data-sources-path /home/rtm/myprograms/funcotator_data/funcotator_dataSources.v1.6.20190124s/ \
   --ref-version hg38 --output-file-format MAF
   
         java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Funcotator \
   -R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
   -V /home/rtm/vivek/navi/wes/test_vcf/all_VM29.vcf.gz \
   -O /home/rtm/vivek/navi/wes/test_funcotator/all_VM29.maf \
   --data-sources-path /home/rtm/myprograms/funcotator_data/funcotator_dataSources.v1.6.20190124s/ \
   --ref-version hg38 --output-file-format MAF
   
         java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Funcotator \
   -R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
   -V /home/rtm/vivek/navi/wes/test_vcf/all_VM45.vcf.gz \
   -O /home/rtm/vivek/navi/wes/test_funcotator/all_VM45.maf \
   --data-sources-path /home/rtm/myprograms/funcotator_data/funcotator_dataSources.v1.6.20190124s/ \
   --ref-version hg38 --output-file-format MAF
   
            java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Funcotator \
   -R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
   -V /home/rtm/vivek/navi/wes/test_vcf/all_VM8.vcf.gz \
   -O /home/rtm/vivek/navi/wes/test_funcotator/all_VM8.maf \
   --data-sources-path /home/rtm/myprograms/funcotator_data/funcotator_dataSources.v1.6.20190124s/ \
   --ref-version hg38 --output-file-format MAF &
   
            java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Funcotator \
   -R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
   -V /home/rtm/vivek/navi/wes/test_vcf/all_VM9.vcf.gz \
   -O /home/rtm/vivek/navi/wes/test_funcotator/all_VM9.maf \
   --data-sources-path /home/rtm/myprograms/funcotator_data/funcotator_dataSources.v1.6.20190124s/ \
   --ref-version hg38 --output-file-format MAF &
   
   
   ###
more all_VM10.maf |grep -v "#"|cut -f9|sort|uniq -c

 grep -w "BRAF" *.maf|cut -f 1,5-10,35,37,38,41,42|grep -P -i "Missense_Mutation|Nonsense_Mutation|Nonstop_Mutation|_Del|_Ins"
 grep -w "NRAS" *.maf|cut -f 1,5-10,35,37,38,41,42|grep -P -i "Missense_Mutation|Nonsense_Mutation|Nonstop_Mutation|_Del|_Ins"
 grep -w "NF1" *.maf|cut -f 1,5-10,35,37,38,41,42|grep -P -i "Missense_Mutation|Nonsense_Mutation|Nonstop_Mutation|_Del|_Ins"

######
grep -w "BRAF" *.maf|cut -f 1,5-10,35,37,38,41,42|cut -f1,6|sort|uniq|grep "BRAF"
grep -w "NRAS" *.maf|cut -f 1,5-10,35,37,38,41,42|cut -f1,6|sort|uniq|grep "NRAS"
grep -w "NF1" *.maf|cut -f 1,5-10,35,37,38,41,42|cut -f1,6|sort|uniq|grep "NF1"



################

more all_VM10.maf |grep -v "##"|cut -f 1,5,6,7,9,10,35,37,38,41,42|grep -P -i "Missense_Mutation|Nonsense_Mutation|Nonstop_Mutation|_Del|_Ins"

for maffile in *.maf;
do sample=${maffile//\.maff} ;
echo $sample;
grep -v "##" $maffile |cut -f 1,5,6,7,9,10,35,37,38,41,42|grep -P -i "Missense_Mutation|Nonsense_Mutation|Nonstop_Mutation|_Del|_Ins" > $maffile.tab
done

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I $bamfile \
-tumor $sample \
-O /home/rtm/vivek/navi/wes/test_vcf/all_$sample.vcf.gz
done
