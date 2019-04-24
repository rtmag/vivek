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
--af-of-alleles-not-in-resource 2.5e-06 \
--dbsnp /home/references/broadhg38/broad_hg38/dbsnp_146.hg38.vcf

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM1_recalibrated.bam \
-tumor VM1 \
--germline-resource /home/references/hg38_bundle/gnomad.exomes.r2.1.1.AFonly.withChr.b37tohg38.vcf \
-L chr7:140753269-140753400 \
-O /home/rtm/vivek/navi/wes/braf_vc/VM1_BRAF_EXON15.vcf.gz \
--af-of-alleles-not-in-resource 2.5e-06 \
--dbsnp /home/references/broadhg38/broad_hg38/dbsnp_146.hg38.vcf

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM20_recalibrated.bam \
-tumor VM20 \
--germline-resource /home/references/hg38_bundle/gnomad.exomes.r2.1.1.AFonly.withChr.b37tohg38.vcf \
-L chr7:140753269-140753400 \
-O /home/rtm/vivek/navi/wes/braf_vc/VM20_BRAF_EXON15.vcf.gz \
--af-of-alleles-not-in-resource 2.5e-06 \
--dbsnp /home/references/broadhg38/broad_hg38/dbsnp_146.hg38.vcf

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM25_recalibrated.bam \
-tumor VM25 \
--germline-resource /home/references/hg38_bundle/gnomad.exomes.r2.1.1.AFonly.withChr.b37tohg38.vcf \
-L chr7:140753269-140753400 \
-O /home/rtm/vivek/navi/wes/braf_vc/VM25_BRAF_EXON15.vcf.gz \
--af-of-alleles-not-in-resource 2.5e-06 \
--dbsnp /home/references/broadhg38/broad_hg38/dbsnp_146.hg38.vcf

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM26_recalibrated.bam \
-tumor VM26 \
--germline-resource /home/references/hg38_bundle/gnomad.exomes.r2.1.1.AFonly.withChr.b37tohg38.vcf \
-L chr7:140753269-140753400 \
-O /home/rtm/vivek/navi/wes/braf_vc/VM26_BRAF_EXON15.vcf.gz \
--af-of-alleles-not-in-resource 2.5e-06 \
--dbsnp /home/references/broadhg38/broad_hg38/dbsnp_146.hg38.vcf

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM2_recalibrated.bam \
-tumor VM2 \
--germline-resource /home/references/hg38_bundle/gnomad.exomes.r2.1.1.AFonly.withChr.b37tohg38.vcf \
-L chr7:140753269-140753400 \
-O /home/rtm/vivek/navi/wes/braf_vc/VM2_BRAF_EXON15.vcf.gz \
--af-of-alleles-not-in-resource 2.5e-06 \
--dbsnp /home/references/broadhg38/broad_hg38/dbsnp_146.hg38.vcf

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM31_recalibrated.bam \
-tumor VM31 \
--germline-resource /home/references/hg38_bundle/gnomad.exomes.r2.1.1.AFonly.withChr.b37tohg38.vcf \
-L chr7:140753269-140753400 \
-O /home/rtm/vivek/navi/wes/braf_vc/VM31_BRAF_EXON15.vcf.gz \
--af-of-alleles-not-in-resource 2.5e-06 \
--dbsnp /home/references/broadhg38/broad_hg38/dbsnp_146.hg38.vcf

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM32_recalibrated.bam \
-tumor VM32 \
--germline-resource /home/references/hg38_bundle/gnomad.exomes.r2.1.1.AFonly.withChr.b37tohg38.vcf \
-L chr7:140753269-140753400 \
-O /home/rtm/vivek/navi/wes/braf_vc/VM32_BRAF_EXON15.vcf.gz \
--af-of-alleles-not-in-resource 2.5e-06 \
--dbsnp /home/references/broadhg38/broad_hg38/dbsnp_146.hg38.vcf

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM33_recalibrated.bam \
-tumor VM33 \
--germline-resource /home/references/hg38_bundle/gnomad.exomes.r2.1.1.AFonly.withChr.b37tohg38.vcf \
-L chr7:140753269-140753400 \
-O /home/rtm/vivek/navi/wes/braf_vc/VM33_BRAF_EXON15.vcf.gz \
--af-of-alleles-not-in-resource 2.5e-06 \
--dbsnp /home/references/broadhg38/broad_hg38/dbsnp_146.hg38.vcf

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM34_recalibrated.bam \
-tumor VM34 \
--germline-resource /home/references/hg38_bundle/gnomad.exomes.r2.1.1.AFonly.withChr.b37tohg38.vcf \
-L chr7:140753269-140753400 \
-O /home/rtm/vivek/navi/wes/braf_vc/VM34_BRAF_EXON15.vcf.gz \
--af-of-alleles-not-in-resource 2.5e-06 \
--dbsnp /home/references/broadhg38/broad_hg38/dbsnp_146.hg38.vcf

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM43_recalibrated.bam \
-tumor VM43 \
--germline-resource /home/references/hg38_bundle/gnomad.exomes.r2.1.1.AFonly.withChr.b37tohg38.vcf \
-L chr7:140753269-140753400 \
-O /home/rtm/vivek/navi/wes/braf_vc/VM43_BRAF_EXON15.vcf.gz \
--af-of-alleles-not-in-resource 2.5e-06 \
--dbsnp /home/references/broadhg38/broad_hg38/dbsnp_146.hg38.vcf

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM44_recalibrated.bam \
-tumor VM44 \
--germline-resource /home/references/hg38_bundle/gnomad.exomes.r2.1.1.AFonly.withChr.b37tohg38.vcf \
-L chr7:140753269-140753400 \
-O /home/rtm/vivek/navi/wes/braf_vc/VM44_BRAF_EXON15.vcf.gz \
--af-of-alleles-not-in-resource 2.5e-06 \
--dbsnp /home/references/broadhg38/broad_hg38/dbsnp_146.hg38.vcf

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM7_recalibrated.bam \
-tumor VM7 \
--germline-resource /home/references/hg38_bundle/gnomad.exomes.r2.1.1.AFonly.withChr.b37tohg38.vcf \
-L chr7:140753269-140753400 \
-O /home/rtm/vivek/navi/wes/braf_vc/VM7_BRAF_EXON15.vcf.gz \
--af-of-alleles-not-in-resource 2.5e-06 \
--dbsnp /home/references/broadhg38/broad_hg38/dbsnp_146.hg38.vcf

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM8_recalibrated.bam \
-tumor VM8 \
--germline-resource /home/references/hg38_bundle/gnomad.exomes.r2.1.1.AFonly.withChr.b37tohg38.vcf \
-L chr7:140753269-140753400 \
-O /home/rtm/vivek/navi/wes/braf_vc/VM8_BRAF_EXON15.vcf.gz \
--af-of-alleles-not-in-resource 2.5e-06 \
--dbsnp /home/references/broadhg38/broad_hg38/dbsnp_146.hg38.vcf
################
