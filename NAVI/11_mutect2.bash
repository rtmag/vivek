########
# Select gnomad biallelic
java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar SelectVariants -h

--restrict-alleles-to BIALLELIC

        # Save off the header for later:
        grep '^#' ${input_vcf} > header &

        # Get all lines in the file except the header:
        # Preserve all fields before INFO, Grab only the AF annotation from the INFO Field
        # replace ID (3rd) and QUAL (6th) columns with '.' (empty):
        grep -v "^#" ${input_vcf} | sed -e 's#\(.*\)\t\(.*\)\t\(.*\)\t\(.*\)\t\(.*\)\t\(.*\)\t\(.*\)\t.*;AF=\([0-9]*\.[e0-9+-]*\).*#\1\t\2\t.\t\4\t\5\t.\t\7\tAF=\8#g' > simplified_body &

        # Wait for background processes to finish:
        wait

        # Consolidate files:
        cat header simplified_body > simplified.vcf

        # Zip the VCF:
        bgzip simplified.vcf -O ${output_name}.vcf.gz

        # Index output file:
        gatk --java-options "-Xmx${command_mem}g" IndexFeatureFile -F ${output_name}.vcf.gz

        # Cleanup:
        rm -f header body simplified_info simplified_body simplified.vcf simplified.vcf.idx

########
java -Xmx200G -jar /home/rtm/myprograms/gatk-4.1.0.0/gatk-package-4.1.0.0-local.jar CollectSequencingArtifactMetrics \
-I /home/rtm/vivek/navi/wes/bam/VM8_recalibrated.bam \
-O /home/rtm/vivek/navi/wes/test_mutect/VM1_artifact \
–-FILE_EXTENSION ".txt" \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta



gatk GetPileupSummaries \
-I tumor.bam \
-V resources/chr17_small_exac_common_3_grch38.vcf.gz \
-O 7_tumor_getpileupsummaries.table

java -d64 -XX:+UseSerialGC -Xmx3G -jar /gatk/gatk.jar \
GetPileupSummaries
-I Tumor_Sample_Alignment.bam \
-O <job_identifier>.targeted_sequencing.table \
-V af-only-gnomad-common-biallelic.grch38.main.vcf.gz \ # Germline reference from gnomad
-L intervals.bed \ ## Only chr1-22 + XYM
-R GRCh38.d1.vd1.fa
