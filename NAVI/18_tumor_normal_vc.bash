
java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar IndexFeatureFile \
-F /home/references/hg38_bundle/best_practice/af-only-gnomad.hg38_july_2019.vcf.gz

####################################################################################################
java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes_normal/bam/VM11.recalibrated.bam \
-I /home/rtm/vivek/navi/wes_normal/bam/NORMAL_VM11_VM12.recalibrated.bam \
-tumor DLP-031_S62 \
-normal DLP-029_S59 \
--germline-resource /home/references/hg38_bundle/best_practice/af-only-gnomad.hg38_july_2019.vcf.gz \
--af-of-alleles-not-in-resource 2.5e-06 \
-O /home/rtm/vivek/navi/mutect2/VM11.uf.vcf.gz
