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


--dbsnp /home/references/broadhg38/broad_hg38/dbsnp_146.hg38.vcf
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
