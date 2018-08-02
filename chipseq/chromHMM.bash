java -mx22000M -jar /root/myPrograms/ChromHMM/ChromHMM.jar BinarizeBam \
/root/resources/hg38.chrom.sizes \
/root/vivek/chip-seq/bam/ \
vivek_nhm_input_matrix.txt \
binarizedBAM

java -mx22000M -jar /root/myPrograms/ChromHMM/ChromHMM.jar LearnModel -p 22 \
/root/vivek/chip-seq/chromHMM/binarizedBAM \
/root/vivek/chip-seq/chromHMM/LearnModel \
14 \
hg38

