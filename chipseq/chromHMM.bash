java -mx22000M -jar /root/myPrograms/ChromHMM/ChromHMM.jar BinarizeBam \
/root/resources/hg38.chrom.sizes \
/root/vivek/chip-seq/bam/ \
vivek_nhm_input_matrix.txt \
binarizedBAM

java -mx22000M -jar /root/myPrograms/ChromHMM/ChromHMM.jar LearnModel -p 0 
/root/vivek/chip-seq/chromHMM/binarizedBAM \
/root/vivek/chip-seq/chromHMM/LearnModel2 \
14 \
hg38

java -mx52000M -jar /root/myPrograms/ChromHMM/ChromHMM.jar LearnModel -p 0 binarizedBAM LearnModel2 14 hg38
####################################################################################################################################

java -mx92000M -jar /root/myPrograms/ChromHMM/ChromHMM.jar BinarizeBam \
/root/resources/hg38.chrom.sizes \
/root/vivek/chip-seq/bam/ \
vivek_nhm_input_matrix2.txt \
binarizedBAM2

java -mx52000M -jar /root/myPrograms/ChromHMM/ChromHMM.jar LearnModel -p 0 binarizedBAM LearnModel2 10 hg38
