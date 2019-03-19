/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 --fastqc -o /home/rtm/vivek/navi/wes/fastq_trim/ \
/home/rtm/vivek/navi/wes/fastq_cat/VM19_R1.fastq.gz \
/home/rtm/vivek/navi/wes/fastq_cat/VM19_R2.fastq.gz &

/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 --fastqc -o /home/rtm/vivek/navi/wes/fastq_trim/ \
/home/rtm/vivek/navi/wes/fastq_cat/VM1_R1.fastq.gz \
/home/rtm/vivek/navi/wes/fastq_cat/VM1_R2.fastq.gz &

/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 --fastqc -o /home/rtm/vivek/navi/wes/fastq_trim/ \
/home/rtm/vivek/navi/wes/fastq_cat/VM20_R1.fastq.gz \
/home/rtm/vivek/navi/wes/fastq_cat/VM20_R2.fastq.gz &

/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 --fastqc -o /home/rtm/vivek/navi/wes/fastq_trim/ \
/home/rtm/vivek/navi/wes/fastq_cat/VM25_R1.fastq.gz \
/home/rtm/vivek/navi/wes/fastq_cat/VM25_R2.fastq.gz &

/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 --fastqc -o /home/rtm/vivek/navi/wes/fastq_trim/ \
/home/rtm/vivek/navi/wes/fastq_cat/VM26_R1.fastq.gz \
/home/rtm/vivek/navi/wes/fastq_cat/VM26_R2.fastq.gz &

/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 --fastqc -o /home/rtm/vivek/navi/wes/fastq_trim/ \
/home/rtm/vivek/navi/wes/fastq_cat/VM2_R1.fastq.gz \
/home/rtm/vivek/navi/wes/fastq_cat/VM2_R2.fastq.gz &

/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 --fastqc -o /home/rtm/vivek/navi/wes/fastq_trim/ \
/home/rtm/vivek/navi/wes/fastq_cat/VM31_R1.fastq.gz \
/home/rtm/vivek/navi/wes/fastq_cat/VM31_R2.fastq.gz &

/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 --fastqc -o /home/rtm/vivek/navi/wes/fastq_trim/ \
/home/rtm/vivek/navi/wes/fastq_cat/VM32_R1.fastq.gz \
/home/rtm/vivek/navi/wes/fastq_cat/VM32_R2.fastq.gz &

/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 --fastqc -o /home/rtm/vivek/navi/wes/fastq_trim/ \
/home/rtm/vivek/navi/wes/fastq_cat/VM33_R1.fastq.gz \
/home/rtm/vivek/navi/wes/fastq_cat/VM33_R2.fastq.gz &

/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 --fastqc -o /home/rtm/vivek/navi/wes/fastq_trim/ \
/home/rtm/vivek/navi/wes/fastq_cat/VM34_R1.fastq.gz \
/home/rtm/vivek/navi/wes/fastq_cat/VM34_R2.fastq.gz &

/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 --fastqc -o /home/rtm/vivek/navi/wes/fastq_trim/ \
/home/rtm/vivek/navi/wes/fastq_cat/VM3_R1.fastq.gz \
/home/rtm/vivek/navi/wes/fastq_cat/VM3_R2.fastq.gz &

/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 --fastqc -o /home/rtm/vivek/navi/wes/fastq_trim/ \
/home/rtm/vivek/navi/wes/fastq_cat/VM43_R1.fastq.gz \
/home/rtm/vivek/navi/wes/fastq_cat/VM43_R2.fastq.gz &

/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 --fastqc -o /home/rtm/vivek/navi/wes/fastq_trim/ \
/home/rtm/vivek/navi/wes/fastq_cat/VM44_R1.fastq.gz \
/home/rtm/vivek/navi/wes/fastq_cat/VM44_R2.fastq.gz &

/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 --fastqc -o /home/rtm/vivek/navi/wes/fastq_trim/ \
/home/rtm/vivek/navi/wes/fastq_cat/VM4_R1.fastq.gz \
/home/rtm/vivek/navi/wes/fastq_cat/VM4_R2.fastq.gz &

/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 --fastqc -o /home/rtm/vivek/navi/wes/fastq_trim/ \
/home/rtm/vivek/navi/wes/fastq_cat/VM7_R1.fastq.gz \
/home/rtm/vivek/navi/wes/fastq_cat/VM7_R2.fastq.gz &

/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 --fastqc -o /home/rtm/vivek/navi/wes/fastq_trim/ \
/home/rtm/vivek/navi/wes/fastq_cat/VM8_R1.fastq.gz \
/home/rtm/vivek/navi/wes/fastq_cat/VM8_R2.fastq.gz &

#########################
# BWA index 
# bwtsw is for large genomes
bwa index -a bwtsw ~/resources/hg38/star/genome.fa

