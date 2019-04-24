# https://gatkforums.broadinstitute.org/gatk/discussion/11136/how-to-call-somatic-mutations-using-gatk4-mutect2
# region chr7:140753269-140753400

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I tumor.bam \
-tumor HCC1143_tumor \
--germline-resource resources/chr17_af-only-gnomad_grch38.vcf.gz \
-L chr7:140753269-140753400 \
-O 1_somatic_m2.vcf.gz \
--af-of-alleles-not-in-resource 2.5e-06 \
--dbsnp dbsnp.vcf


