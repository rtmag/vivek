
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

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes_normal/bam/VM12.recalibrated.bam \
-I /home/rtm/vivek/navi/wes_normal/bam/NORMAL_VM11_VM12.recalibrated.bam \
-tumor DLP-030_S74 \
-normal DLP-029_S59 \
--germline-resource /home/references/hg38_bundle/best_practice/af-only-gnomad.hg38_july_2019.vcf.gz \
--af-of-alleles-not-in-resource 2.5e-06 \
-O /home/rtm/vivek/navi/mutect2/VM12.uf.vcf.gz
####################################################################################################
java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM19_recalibrated.bam \
-I /home/rtm/vivek/navi/wes_normal/bam/NORMAL_VM19_VM20.recalibrated.bam \
-tumor VM19 \
-normal DLP-069_S61 \
--germline-resource /home/references/hg38_bundle/best_practice/af-only-gnomad.hg38_july_2019.vcf.gz \
--af-of-alleles-not-in-resource 2.5e-06 \
-O /home/rtm/vivek/navi/mutect2/VM19.uf.vcf.gz

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM20_recalibrated.bam \
-I /home/rtm/vivek/navi/wes_normal/bam/NORMAL_VM19_VM20.recalibrated.bam \
-tumor VM20 \
-normal DLP-069_S61 \
--germline-resource /home/references/hg38_bundle/best_practice/af-only-gnomad.hg38_july_2019.vcf.gz \
--af-of-alleles-not-in-resource 2.5e-06 \
-O /home/rtm/vivek/navi/mutect2/VM20.uf.vcf.gz
####################################################################################################
java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM1_recalibrated.bam \
-I /home/rtm/vivek/navi/wes_normal/bam/NORMAL_VM1_VM2.recalibrated.bam \
-tumor VM1 \
-normal DLP-025_S66 \
--germline-resource /home/references/hg38_bundle/best_practice/af-only-gnomad.hg38_july_2019.vcf.gz \
--af-of-alleles-not-in-resource 2.5e-06 \
-O /home/rtm/vivek/navi/mutect2/VM1.uf.vcf.gz

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM2_recalibrated.bam \
-I /home/rtm/vivek/navi/wes_normal/bam/NORMAL_VM1_VM2.recalibrated.bam \
-tumor VM2 \
-normal DLP-025_S66 \
--germline-resource /home/references/hg38_bundle/best_practice/af-only-gnomad.hg38_july_2019.vcf.gz \
--af-of-alleles-not-in-resource 2.5e-06 \
-O /home/rtm/vivek/navi/mutect2/VM2.uf.vcf.gz
####################################################################################################
FOR NORMAL_VM21_VM22 - NO VM21; ONLY VM22
####################################################################################################
java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes_normal/bam/VM23.recalibrated.bam \
-I /home/rtm/vivek/navi/wes_normal/bam/NORMAL_VM23_VM24.recalibrated.bam \
-tumor DLP-053_S76 \
-normal DLP-071_S72 \
--germline-resource /home/references/hg38_bundle/best_practice/af-only-gnomad.hg38_july_2019.vcf.gz \
--af-of-alleles-not-in-resource 2.5e-06 \
-O /home/rtm/vivek/navi/mutect2/VM23.uf.vcf.gz

# NO VM24 recalibrated; please re-run
#java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar Mutect2 \
#-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
#-I /home/rtm/vivek/navi/wes_normal/bam/VM24.recalibrated.bam \
#-I /home/rtm/vivek/navi/wes_normal/bam/NORMAL_VM23_VM24.recalibrated.bam \
#-tumor DLP-054_S77 \
#-normal DLP-071_S72 \
#--germline-resource /home/references/hg38_bundle/best_practice/af-only-gnomad.hg38_july_2019.vcf.gz \
#--af-of-alleles-not-in-resource 2.5e-06 \
#-O /home/rtm/vivek/navi/mutect2/VM24.uf.vcf.gz
####################################################################################################
FOR NORMAL_VM35_VM36 - NO VM35; ONLY VM36
####################################################################################################
java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM43_recalibrated.bam \
-I /home/rtm/vivek/navi/wes_normal/bam/NORMAL_VM43_VM44.recalibrated.bam \
-tumor VM43 \
-normal DLP-073_S73 \
--germline-resource /home/references/hg38_bundle/best_practice/af-only-gnomad.hg38_july_2019.vcf.gz \
--af-of-alleles-not-in-resource 2.5e-06 \
-O /home/rtm/vivek/navi/mutect2/VM43.uf.vcf.gz

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes/bam/VM44_recalibrated.bam \
-I /home/rtm/vivek/navi/wes_normal/bam/NORMAL_VM43_VM44.recalibrated.bam \
-tumor VM44 \
-normal DLP-073_S73 \
--germline-resource /home/references/hg38_bundle/best_practice/af-only-gnomad.hg38_july_2019.vcf.gz \
--af-of-alleles-not-in-resource 2.5e-06 \
-O /home/rtm/vivek/navi/mutect2/VM44.uf.vcf.gz
####################################################################################################
java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes_normal/bam/VM9.recalibrated.bam \
-I /home/rtm/vivek/navi/wes_normal/bam/NORMAL_VM9_VM10.recalibrated.bam \
-tumor DLP-027_S58 \
-normal DLP-026_S57 \
--germline-resource /home/references/hg38_bundle/best_practice/af-only-gnomad.hg38_july_2019.vcf.gz \
--af-of-alleles-not-in-resource 2.5e-06 \
-O /home/rtm/vivek/navi/mutect2/VM9.uf.vcf.gz

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar Mutect2 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I /home/rtm/vivek/navi/wes_normal/bam/VM10.recalibrated.bam \
-I /home/rtm/vivek/navi/wes_normal/bam/NORMAL_VM9_VM10.recalibrated.bam \
-tumor DLP-028_S67 \
-normal DLP-026_S57 \
--germline-resource /home/references/hg38_bundle/best_practice/af-only-gnomad.hg38_july_2019.vcf.gz \
--af-of-alleles-not-in-resource 2.5e-06 \
-O /home/rtm/vivek/navi/mutect2/VM10.uf.vcf.gz

####################################################################################################
####################################################################################################
####################################################################################################
####################################################################################################

java -Xmx50G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar FilterMutectCalls \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-V /home/rtm/vivek/navi/mutect2/VM10.uf.vcf.gz \
-O /home/rtm/vivek/navi/mutect2/VM10.filtered.vcf.gz
   
java -Xmx50G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar SelectVariants \
   -R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
   -V /home/rtm/vivek/navi/mutect2/VM10.filtered.vcf.gz \
   -O /home/rtm/vivek/navi/mutect2/VM10.filtered.PASS.vcf.gz \
   --exclude-filtered

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Funcotator \
   -R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
   -V /home/rtm/vivek/navi/mutect2/VM10.filtered.PASS.vcf.gz \
   -O /home/rtm/vivek/navi/funcotator/VM10.maf \
   --data-sources-path /home/rtm/myprograms/funcotator_data/funcotator_dataSources.v1.6.20190124s/ \
   --ref-version hg38 --output-file-format MAF
####################################################################################################
java -Xmx50G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar FilterMutectCalls \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-V /home/rtm/vivek/navi/mutect2/VM11.uf.vcf.gz \
-O /home/rtm/vivek/navi/mutect2/VM11.filtered.vcf.gz

java -Xmx50G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar SelectVariants \
   -R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
   -V /home/rtm/vivek/navi/mutect2/VM11.filtered.vcf.gz \
   -O /home/rtm/vivek/navi/mutect2/VM11.filtered.PASS.vcf.gz \
   --exclude-filtered

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Funcotator \
   -R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
   -V /home/rtm/vivek/navi/mutect2/VM11.filtered.PASS.vcf.gz \
   -O /home/rtm/vivek/navi/funcotator/VM11.maf \
   --data-sources-path /home/rtm/myprograms/funcotator_data/funcotator_dataSources.v1.6.20190124s/ \
   --ref-version hg38 --output-file-format MAF
####################################################################################################
java -Xmx50G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar FilterMutectCalls \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-V /home/rtm/vivek/navi/mutect2/VM12.uf.vcf.gz \
-O /home/rtm/vivek/navi/mutect2/VM12.filtered.vcf.gz

java -Xmx50G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar SelectVariants \
   -R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
   -V /home/rtm/vivek/navi/mutect2/VM12.filtered.vcf.gz \
   -O /home/rtm/vivek/navi/mutect2/VM12.filtered.PASS.vcf.gz \
   --exclude-filtered

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Funcotator \
   -R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
   -V /home/rtm/vivek/navi/mutect2/VM12.filtered.PASS.vcf.gz \
   -O /home/rtm/vivek/navi/funcotator/VM12.maf \
   --data-sources-path /home/rtm/myprograms/funcotator_data/funcotator_dataSources.v1.6.20190124s/ \
   --ref-version hg38 --output-file-format MAF
####################################################################################################
java -Xmx50G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar FilterMutectCalls \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-V /home/rtm/vivek/navi/mutect2/VM19.uf.vcf.gz \
-O /home/rtm/vivek/navi/mutect2/VM19.filtered.vcf.gz

java -Xmx50G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar SelectVariants \
   -R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
   -V /home/rtm/vivek/navi/mutect2/VM19.filtered.vcf.gz \
   -O /home/rtm/vivek/navi/mutect2/VM19.filtered.PASS.vcf.gz \
   --exclude-filtered

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Funcotator \
   -R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
   -V /home/rtm/vivek/navi/mutect2/VM19.filtered.PASS.vcf.gz \
   -O /home/rtm/vivek/navi/funcotator/VM19.maf \
   --data-sources-path /home/rtm/myprograms/funcotator_data/funcotator_dataSources.v1.6.20190124s/ \
   --ref-version hg38 --output-file-format MAF
####################################################################################################
java -Xmx50G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar FilterMutectCalls \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-V /home/rtm/vivek/navi/mutect2/VM1.uf.vcf.gz \
-O /home/rtm/vivek/navi/mutect2/VM1.filtered.vcf.gz

java -Xmx50G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar SelectVariants \
   -R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
   -V /home/rtm/vivek/navi/mutect2/VM1.filtered.vcf.gz \
   -O /home/rtm/vivek/navi/mutect2/VM1.filtered.PASS.vcf.gz \
   --exclude-filtered

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Funcotator \
   -R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
   -V /home/rtm/vivek/navi/mutect2/VM1.filtered.PASS.vcf.gz \
   -O /home/rtm/vivek/navi/funcotator/VM1.maf \
   --data-sources-path /home/rtm/myprograms/funcotator_data/funcotator_dataSources.v1.6.20190124s/ \
   --ref-version hg38 --output-file-format MAF
####################################################################################################
java -Xmx50G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar FilterMutectCalls \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-V /home/rtm/vivek/navi/mutect2/VM20.uf.vcf.gz \
-O /home/rtm/vivek/navi/mutect2/VM20.filtered.vcf.gz

java -Xmx50G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar SelectVariants \
   -R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
   -V /home/rtm/vivek/navi/mutect2/VM20.filtered.vcf.gz \
   -O /home/rtm/vivek/navi/mutect2/VM20.filtered.PASS.vcf.gz \
   --exclude-filtered

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Funcotator \
   -R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
   -V /home/rtm/vivek/navi/mutect2/VM20.filtered.PASS.vcf.gz \
   -O /home/rtm/vivek/navi/funcotator/VM20.maf \
   --data-sources-path /home/rtm/myprograms/funcotator_data/funcotator_dataSources.v1.6.20190124s/ \
   --ref-version hg38 --output-file-format MAF
####################################################################################################
java -Xmx50G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar FilterMutectCalls \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-V /home/rtm/vivek/navi/mutect2/VM2.uf.vcf.gz \
-O /home/rtm/vivek/navi/mutect2/VM2.filtered.vcf.gz

java -Xmx50G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar SelectVariants \
   -R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
   -V /home/rtm/vivek/navi/mutect2/VM2.filtered.vcf.gz \
   -O /home/rtm/vivek/navi/mutect2/VM2.filtered.PASS.vcf.gz \
   --exclude-filtered

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Funcotator \
   -R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
   -V /home/rtm/vivek/navi/mutect2/VM2.filtered.PASS.vcf.gz \
   -O /home/rtm/vivek/navi/funcotator/VM2.maf \
   --data-sources-path /home/rtm/myprograms/funcotator_data/funcotator_dataSources.v1.6.20190124s/ \
   --ref-version hg38 --output-file-format MAF
####################################################################################################
java -Xmx50G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar FilterMutectCalls \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-V /home/rtm/vivek/navi/mutect2/VM43.uf.vcf.gz \
-O /home/rtm/vivek/navi/mutect2/VM43.filtered.vcf.gz

java -Xmx50G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar SelectVariants \
   -R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
   -V /home/rtm/vivek/navi/mutect2/VM43.filtered.vcf.gz \
   -O /home/rtm/vivek/navi/mutect2/VM43.filtered.PASS.vcf.gz \
   --exclude-filtered

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Funcotator \
   -R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
   -V /home/rtm/vivek/navi/mutect2/VM43.filtered.PASS.vcf.gz \
   -O /home/rtm/vivek/navi/funcotator/VM43.maf \
   --data-sources-path /home/rtm/myprograms/funcotator_data/funcotator_dataSources.v1.6.20190124s/ \
   --ref-version hg38 --output-file-format MAF
####################################################################################################
java -Xmx50G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar FilterMutectCalls \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-V /home/rtm/vivek/navi/mutect2/VM44.uf.vcf.gz \
-O /home/rtm/vivek/navi/mutect2/VM44.filtered.vcf.gz

java -Xmx50G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar SelectVariants \
   -R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
   -V /home/rtm/vivek/navi/mutect2/VM44.filtered.vcf.gz \
   -O /home/rtm/vivek/navi/mutect2/VM44.filtered.PASS.vcf.gz \
   --exclude-filtered

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Funcotator \
   -R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
   -V /home/rtm/vivek/navi/mutect2/VM44.filtered.PASS.vcf.gz \
   -O /home/rtm/vivek/navi/funcotator/VM44.maf \
   --data-sources-path /home/rtm/myprograms/funcotator_data/funcotator_dataSources.v1.6.20190124s/ \
   --ref-version hg38 --output-file-format MAF
####################################################################################################
java -Xmx50G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar FilterMutectCalls \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-V /home/rtm/vivek/navi/mutect2/VM9.uf.vcf.gz \
-O /home/rtm/vivek/navi/mutect2/VM9.filtered.vcf.gz

java -Xmx50G -jar /home/rtm/myprograms/gatk-4.1.2.0/gatk-package-4.1.2.0-local.jar SelectVariants \
   -R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
   -V /home/rtm/vivek/navi/mutect2/VM9.filtered.vcf.gz \
   -O /home/rtm/vivek/navi/mutect2/VM9.filtered.PASS.vcf.gz \
   --exclude-filtered

java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar Funcotator \
   -R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
   -V /home/rtm/vivek/navi/mutect2/VM9.filtered.PASS.vcf.gz \
   -O /home/rtm/vivek/navi/funcotator/VM9.maf \
   --data-sources-path /home/rtm/myprograms/funcotator_data/funcotator_dataSources.v1.6.20190124s/ \
   --ref-version hg38 --output-file-format MAF
