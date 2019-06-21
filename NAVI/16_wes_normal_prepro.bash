unzip "*.zip"

ls -1 |perl -pe 's/\_L0/\t/g'|cut -f1|uniq|grep -v "zips"| \
perl -pe 's/(.+)\n/cat $1_L001_R1_001.fastq.gz $1_L002_R1_001.fastq.gz $1_L003_R1_001.fastq.gz $1_L004_R1_001.fastq.gz \> \/home\/rtm\/vivek\/navi\/wes\_normal\/fastq\/$1_R1.fastq.gz\n/g'
# 
ls -1 |perl -pe 's/\_L0/\t/g'|cut -f1|uniq|grep -v "zips"| \
perl -pe 's/(.+)\n/cat $1_L001_R2_001.fastq.gz $1_L002_R2_001.fastq.gz $1_L003_R2_001.fastq.gz $1_L004_R2_001.fastq.gz \> \/home\/rtm\/vivek\/navi\/wes\_normal\/fastq\/$1_R2.fastq.gz\n/g'
################
cat DLP-001_S65_L001_R1_001.fastq.gz DLP-001_S65_L002_R1_001.fastq.gz DLP-001_S65_L003_R1_001.fastq.gz DLP-001_S65_L004_R1_001.fastq.gz > /home/rtm/vivek/navi/wes_normal/fastq/DLP-001_S65_R1.fastq.gz
cat DLP-025_S66_L001_R1_001.fastq.gz DLP-025_S66_L002_R1_001.fastq.gz DLP-025_S66_L003_R1_001.fastq.gz DLP-025_S66_L004_R1_001.fastq.gz > /home/rtm/vivek/navi/wes_normal/fastq/DLP-025_S66_R1.fastq.gz
cat DLP-026_S57_L001_R1_001.fastq.gz DLP-026_S57_L002_R1_001.fastq.gz DLP-026_S57_L003_R1_001.fastq.gz DLP-026_S57_L004_R1_001.fastq.gz > /home/rtm/vivek/navi/wes_normal/fastq/DLP-026_S57_R1.fastq.gz
cat DLP-027_S58_L001_R1_001.fastq.gz DLP-027_S58_L002_R1_001.fastq.gz DLP-027_S58_L003_R1_001.fastq.gz DLP-027_S58_L004_R1_001.fastq.gz > /home/rtm/vivek/navi/wes_normal/fastq/DLP-027_S58_R1.fastq.gz
cat DLP-028_S67_L001_R1_001.fastq.gz DLP-028_S67_L002_R1_001.fastq.gz DLP-028_S67_L003_R1_001.fastq.gz DLP-028_S67_L004_R1_001.fastq.gz > /home/rtm/vivek/navi/wes_normal/fastq/DLP-028_S67_R1.fastq.gz
cat DLP-029_S59_L001_R1_001.fastq.gz DLP-029_S59_L002_R1_001.fastq.gz DLP-029_S59_L003_R1_001.fastq.gz DLP-029_S59_L004_R1_001.fastq.gz > /home/rtm/vivek/navi/wes_normal/fastq/DLP-029_S59_R1.fastq.gz
cat DLP-030_S74_L001_R1_001.fastq.gz DLP-030_S74_L002_R1_001.fastq.gz DLP-030_S74_L003_R1_001.fastq.gz DLP-030_S74_L004_R1_001.fastq.gz > /home/rtm/vivek/navi/wes_normal/fastq/DLP-030_S74_R1.fastq.gz
cat DLP-031_S62_L001_R1_001.fastq.gz DLP-031_S62_L002_R1_001.fastq.gz DLP-031_S62_L003_R1_001.fastq.gz DLP-031_S62_L004_R1_001.fastq.gz > /home/rtm/vivek/navi/wes_normal/fastq/DLP-031_S62_R1.fastq.gz
cat DLP-041_S68_L001_R1_001.fastq.gz DLP-041_S68_L002_R1_001.fastq.gz DLP-041_S68_L003_R1_001.fastq.gz DLP-041_S68_L004_R1_001.fastq.gz > /home/rtm/vivek/navi/wes_normal/fastq/DLP-041_S68_R1.fastq.gz
cat DLP-047_S75_L001_R1_001.fastq.gz DLP-047_S75_L002_R1_001.fastq.gz DLP-047_S75_L003_R1_001.fastq.gz DLP-047_S75_L004_R1_001.fastq.gz > /home/rtm/vivek/navi/wes_normal/fastq/DLP-047_S75_R1.fastq.gz
cat DLP-052_S69_L001_R1_001.fastq.gz DLP-052_S69_L002_R1_001.fastq.gz DLP-052_S69_L003_R1_001.fastq.gz DLP-052_S69_L004_R1_001.fastq.gz > /home/rtm/vivek/navi/wes_normal/fastq/DLP-052_S69_R1.fastq.gz
cat DLP-053_S76_L001_R1_001.fastq.gz DLP-053_S76_L002_R1_001.fastq.gz DLP-053_S76_L003_R1_001.fastq.gz DLP-053_S76_L004_R1_001.fastq.gz > /home/rtm/vivek/navi/wes_normal/fastq/DLP-053_S76_R1.fastq.gz
cat DLP-054_S77_L001_R1_001.fastq.gz DLP-054_S77_L002_R1_001.fastq.gz DLP-054_S77_L003_R1_001.fastq.gz DLP-054_S77_L004_R1_001.fastq.gz > /home/rtm/vivek/navi/wes_normal/fastq/DLP-054_S77_R1.fastq.gz
cat DLP-059_S70_L001_R1_001.fastq.gz DLP-059_S70_L002_R1_001.fastq.gz DLP-059_S70_L003_R1_001.fastq.gz DLP-059_S70_L004_R1_001.fastq.gz > /home/rtm/vivek/navi/wes_normal/fastq/DLP-059_S70_R1.fastq.gz
cat DLP-065_S60_L001_R1_001.fastq.gz DLP-065_S60_L002_R1_001.fastq.gz DLP-065_S60_L003_R1_001.fastq.gz DLP-065_S60_L004_R1_001.fastq.gz > /home/rtm/vivek/navi/wes_normal/fastq/DLP-065_S60_R1.fastq.gz
cat DLP-069_S61_L001_R1_001.fastq.gz DLP-069_S61_L002_R1_001.fastq.gz DLP-069_S61_L003_R1_001.fastq.gz DLP-069_S61_L004_R1_001.fastq.gz > /home/rtm/vivek/navi/wes_normal/fastq/DLP-069_S61_R1.fastq.gz
cat DLP-070_S71_L001_R1_001.fastq.gz DLP-070_S71_L002_R1_001.fastq.gz DLP-070_S71_L003_R1_001.fastq.gz DLP-070_S71_L004_R1_001.fastq.gz > /home/rtm/vivek/navi/wes_normal/fastq/DLP-070_S71_R1.fastq.gz
cat DLP-071_S72_L001_R1_001.fastq.gz DLP-071_S72_L002_R1_001.fastq.gz DLP-071_S72_L003_R1_001.fastq.gz DLP-071_S72_L004_R1_001.fastq.gz > /home/rtm/vivek/navi/wes_normal/fastq/DLP-071_S72_R1.fastq.gz
cat DLP-073_S73_L001_R1_001.fastq.gz DLP-073_S73_L002_R1_001.fastq.gz DLP-073_S73_L003_R1_001.fastq.gz DLP-073_S73_L004_R1_001.fastq.gz > /home/rtm/vivek/navi/wes_normal/fastq/DLP-073_S73_R1.fastq.gz

cat DLP-001_S65_L001_R2_001.fastq.gz DLP-001_S65_L002_R2_001.fastq.gz DLP-001_S65_L003_R2_001.fastq.gz DLP-001_S65_L004_R2_001.fastq.gz > /home/rtm/vivek/navi/wes_normal/fastq/DLP-001_S65_R2.fastq.gz
cat DLP-025_S66_L001_R2_001.fastq.gz DLP-025_S66_L002_R2_001.fastq.gz DLP-025_S66_L003_R2_001.fastq.gz DLP-025_S66_L004_R2_001.fastq.gz > /home/rtm/vivek/navi/wes_normal/fastq/DLP-025_S66_R2.fastq.gz
cat DLP-026_S57_L001_R2_001.fastq.gz DLP-026_S57_L002_R2_001.fastq.gz DLP-026_S57_L003_R2_001.fastq.gz DLP-026_S57_L004_R2_001.fastq.gz > /home/rtm/vivek/navi/wes_normal/fastq/DLP-026_S57_R2.fastq.gz
cat DLP-027_S58_L001_R2_001.fastq.gz DLP-027_S58_L002_R2_001.fastq.gz DLP-027_S58_L003_R2_001.fastq.gz DLP-027_S58_L004_R2_001.fastq.gz > /home/rtm/vivek/navi/wes_normal/fastq/DLP-027_S58_R2.fastq.gz
cat DLP-028_S67_L001_R2_001.fastq.gz DLP-028_S67_L002_R2_001.fastq.gz DLP-028_S67_L003_R2_001.fastq.gz DLP-028_S67_L004_R2_001.fastq.gz > /home/rtm/vivek/navi/wes_normal/fastq/DLP-028_S67_R2.fastq.gz
cat DLP-029_S59_L001_R2_001.fastq.gz DLP-029_S59_L002_R2_001.fastq.gz DLP-029_S59_L003_R2_001.fastq.gz DLP-029_S59_L004_R2_001.fastq.gz > /home/rtm/vivek/navi/wes_normal/fastq/DLP-029_S59_R2.fastq.gz
cat DLP-030_S74_L001_R2_001.fastq.gz DLP-030_S74_L002_R2_001.fastq.gz DLP-030_S74_L003_R2_001.fastq.gz DLP-030_S74_L004_R2_001.fastq.gz > /home/rtm/vivek/navi/wes_normal/fastq/DLP-030_S74_R2.fastq.gz
cat DLP-031_S62_L001_R2_001.fastq.gz DLP-031_S62_L002_R2_001.fastq.gz DLP-031_S62_L003_R2_001.fastq.gz DLP-031_S62_L004_R2_001.fastq.gz > /home/rtm/vivek/navi/wes_normal/fastq/DLP-031_S62_R2.fastq.gz
cat DLP-041_S68_L001_R2_001.fastq.gz DLP-041_S68_L002_R2_001.fastq.gz DLP-041_S68_L003_R2_001.fastq.gz DLP-041_S68_L004_R2_001.fastq.gz > /home/rtm/vivek/navi/wes_normal/fastq/DLP-041_S68_R2.fastq.gz
cat DLP-047_S75_L001_R2_001.fastq.gz DLP-047_S75_L002_R2_001.fastq.gz DLP-047_S75_L003_R2_001.fastq.gz DLP-047_S75_L004_R2_001.fastq.gz > /home/rtm/vivek/navi/wes_normal/fastq/DLP-047_S75_R2.fastq.gz
cat DLP-052_S69_L001_R2_001.fastq.gz DLP-052_S69_L002_R2_001.fastq.gz DLP-052_S69_L003_R2_001.fastq.gz DLP-052_S69_L004_R2_001.fastq.gz > /home/rtm/vivek/navi/wes_normal/fastq/DLP-052_S69_R2.fastq.gz
cat DLP-053_S76_L001_R2_001.fastq.gz DLP-053_S76_L002_R2_001.fastq.gz DLP-053_S76_L003_R2_001.fastq.gz DLP-053_S76_L004_R2_001.fastq.gz > /home/rtm/vivek/navi/wes_normal/fastq/DLP-053_S76_R2.fastq.gz
cat DLP-054_S77_L001_R2_001.fastq.gz DLP-054_S77_L002_R2_001.fastq.gz DLP-054_S77_L003_R2_001.fastq.gz DLP-054_S77_L004_R2_001.fastq.gz > /home/rtm/vivek/navi/wes_normal/fastq/DLP-054_S77_R2.fastq.gz
cat DLP-059_S70_L001_R2_001.fastq.gz DLP-059_S70_L002_R2_001.fastq.gz DLP-059_S70_L003_R2_001.fastq.gz DLP-059_S70_L004_R2_001.fastq.gz > /home/rtm/vivek/navi/wes_normal/fastq/DLP-059_S70_R2.fastq.gz
cat DLP-065_S60_L001_R2_001.fastq.gz DLP-065_S60_L002_R2_001.fastq.gz DLP-065_S60_L003_R2_001.fastq.gz DLP-065_S60_L004_R2_001.fastq.gz > /home/rtm/vivek/navi/wes_normal/fastq/DLP-065_S60_R2.fastq.gz
cat DLP-069_S61_L001_R2_001.fastq.gz DLP-069_S61_L002_R2_001.fastq.gz DLP-069_S61_L003_R2_001.fastq.gz DLP-069_S61_L004_R2_001.fastq.gz > /home/rtm/vivek/navi/wes_normal/fastq/DLP-069_S61_R2.fastq.gz
cat DLP-070_S71_L001_R2_001.fastq.gz DLP-070_S71_L002_R2_001.fastq.gz DLP-070_S71_L003_R2_001.fastq.gz DLP-070_S71_L004_R2_001.fastq.gz > /home/rtm/vivek/navi/wes_normal/fastq/DLP-070_S71_R2.fastq.gz
cat DLP-071_S72_L001_R2_001.fastq.gz DLP-071_S72_L002_R2_001.fastq.gz DLP-071_S72_L003_R2_001.fastq.gz DLP-071_S72_L004_R2_001.fastq.gz > /home/rtm/vivek/navi/wes_normal/fastq/DLP-071_S72_R2.fastq.gz
cat DLP-073_S73_L001_R2_001.fastq.gz DLP-073_S73_L002_R2_001.fastq.gz DLP-073_S73_L003_R2_001.fastq.gz DLP-073_S73_L004_R2_001.fastq.gz > /home/rtm/vivek/navi/wes_normal/fastq/DLP-073_S73_R2.fastq.gz
##
/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 --fastqc -o /home/rtm/vivek/navi/wes_normal/fastq_trim \
/home/rtm/vivek/navi/wes_normal/fastq/DLP-001_S65_R1.fastq.gz \
/home/rtm/vivek/navi/wes_normal/fastq/DLP-001_S65_R2.fastq.gz &

/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 --fastqc -o /home/rtm/vivek/navi/wes_normal/fastq_trim \
/home/rtm/vivek/navi/wes_normal/fastq/DLP-025_S66_R1.fastq.gz \
/home/rtm/vivek/navi/wes_normal/fastq/DLP-025_S66_R2.fastq.gz &

/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 --fastqc -o /home/rtm/vivek/navi/wes_normal/fastq_trim \
/home/rtm/vivek/navi/wes_normal/fastq/DLP-026_S57_R1.fastq.gz \
/home/rtm/vivek/navi/wes_normal/fastq/DLP-026_S57_R2.fastq.gz &

/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 --fastqc -o /home/rtm/vivek/navi/wes_normal/fastq_trim \
/home/rtm/vivek/navi/wes_normal/fastq/DLP-027_S58_R1.fastq.gz \
/home/rtm/vivek/navi/wes_normal/fastq/DLP-027_S58_R2.fastq.gz &

/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 --fastqc -o /home/rtm/vivek/navi/wes_normal/fastq_trim \
/home/rtm/vivek/navi/wes_normal/fastq/DLP-028_S67_R1.fastq.gz \
/home/rtm/vivek/navi/wes_normal/fastq/DLP-028_S67_R2.fastq.gz &

/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 --fastqc -o /home/rtm/vivek/navi/wes_normal/fastq_trim \
/home/rtm/vivek/navi/wes_normal/fastq/DLP-029_S59_R1.fastq.gz \
/home/rtm/vivek/navi/wes_normal/fastq/DLP-029_S59_R2.fastq.gz &

/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 --fastqc -o /home/rtm/vivek/navi/wes_normal/fastq_trim \
/home/rtm/vivek/navi/wes_normal/fastq/DLP-030_S74_R1.fastq.gz \
/home/rtm/vivek/navi/wes_normal/fastq/DLP-030_S74_R2.fastq.gz &

/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 --fastqc -o /home/rtm/vivek/navi/wes_normal/fastq_trim \
/home/rtm/vivek/navi/wes_normal/fastq/DLP-031_S62_R1.fastq.gz \
/home/rtm/vivek/navi/wes_normal/fastq/DLP-031_S62_R2.fastq.gz &

/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 --fastqc -o /home/rtm/vivek/navi/wes_normal/fastq_trim \
/home/rtm/vivek/navi/wes_normal/fastq/DLP-041_S68_R1.fastq.gz \
/home/rtm/vivek/navi/wes_normal/fastq/DLP-041_S68_R2.fastq.gz &

/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 --fastqc -o /home/rtm/vivek/navi/wes_normal/fastq_trim \
/home/rtm/vivek/navi/wes_normal/fastq/DLP-047_S75_R1.fastq.gz \
/home/rtm/vivek/navi/wes_normal/fastq/DLP-047_S75_R2.fastq.gz &

/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 --fastqc -o /home/rtm/vivek/navi/wes_normal/fastq_trim \
/home/rtm/vivek/navi/wes_normal/fastq/DLP-052_S69_R1.fastq.gz \
/home/rtm/vivek/navi/wes_normal/fastq/DLP-052_S69_R2.fastq.gz &

/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 --fastqc -o /home/rtm/vivek/navi/wes_normal/fastq_trim \
/home/rtm/vivek/navi/wes_normal/fastq/DLP-053_S76_R1.fastq.gz \
/home/rtm/vivek/navi/wes_normal/fastq/DLP-053_S76_R2.fastq.gz &

/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 --fastqc -o /home/rtm/vivek/navi/wes_normal/fastq_trim \
/home/rtm/vivek/navi/wes_normal/fastq/DLP-054_S77_R1.fastq.gz \
/home/rtm/vivek/navi/wes_normal/fastq/DLP-054_S77_R2.fastq.gz &

/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 --fastqc -o /home/rtm/vivek/navi/wes_normal/fastq_trim \
/home/rtm/vivek/navi/wes_normal/fastq/DLP-059_S70_R1.fastq.gz \
/home/rtm/vivek/navi/wes_normal/fastq/DLP-059_S70_R2.fastq.gz &

/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 --fastqc -o /home/rtm/vivek/navi/wes_normal/fastq_trim \
/home/rtm/vivek/navi/wes_normal/fastq/DLP-065_S60_R1.fastq.gz \
/home/rtm/vivek/navi/wes_normal/fastq/DLP-065_S60_R2.fastq.gz &

/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 --fastqc -o /home/rtm/vivek/navi/wes_normal/fastq_trim \
/home/rtm/vivek/navi/wes_normal/fastq/DLP-069_S61_R1.fastq.gz \
/home/rtm/vivek/navi/wes_normal/fastq/DLP-069_S61_R2.fastq.gz &

/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 --fastqc -o /home/rtm/vivek/navi/wes_normal/fastq_trim \
/home/rtm/vivek/navi/wes_normal/fastq/DLP-070_S71_R1.fastq.gz \
/home/rtm/vivek/navi/wes_normal/fastq/DLP-070_S71_R2.fastq.gz &

/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 --fastqc -o /home/rtm/vivek/navi/wes_normal/fastq_trim \
/home/rtm/vivek/navi/wes_normal/fastq/DLP-071_S72_R1.fastq.gz \
/home/rtm/vivek/navi/wes_normal/fastq/DLP-071_S72_R2.fastq.gz &

/home/rtm/myprograms/TrimGalore/trim_galore --paired --illumina -q 20 --fastqc -o /home/rtm/vivek/navi/wes_normal/fastq_trim \
/home/rtm/vivek/navi/wes_normal/fastq/DLP-073_S73_R1.fastq.gz \
/home/rtm/vivek/navi/wes_normal/fastq/DLP-073_S73_R2.fastq.gz &
######

bwa mem -t 23 -T 0 \
-R '@RG\tID:DLP-001_S65\tLB:WES\tPL:illumina\tPU:NULL\SM:DLP-001_S65' \
/home/references/broadhg38/bwa/Homo_sapiens_assembly38.fasta.gz \
/home/rtm/vivek/navi/wes_normal/fastq_trim/DLP-001_S65_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes_normal/fastq_trim/DLP-001_S65_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes_normal/bam/DLP-001_S65.bam -

bwa mem -t 23 -T 0 \
-R '@RG\tID:DLP-025_S66\tLB:WES\tPL:illumina\tPU:NULL\SM:DLP-025_S66' \
/home/references/broadhg38/bwa/Homo_sapiens_assembly38.fasta.gz \
/home/rtm/vivek/navi/wes_normal/fastq_trim/DLP-025_S66_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes_normal/fastq_trim/DLP-025_S66_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes_normal/bam/DLP-025_S66.bam -

bwa mem -t 23 -T 0 \
-R '@RG\tID:DLP-026_S57\tLB:WES\tPL:illumina\tPU:NULL\SM:DLP-026_S57' \
/home/references/broadhg38/bwa/Homo_sapiens_assembly38.fasta.gz \
/home/rtm/vivek/navi/wes_normal/fastq_trim/DLP-026_S57_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes_normal/fastq_trim/DLP-026_S57_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes_normal/bam/DLP-026_S57.bam -

bwa mem -t 23 -T 0 \
-R '@RG\tID:DLP-027_S58\tLB:WES\tPL:illumina\tPU:NULL\SM:DLP-027_S58' \
/home/references/broadhg38/bwa/Homo_sapiens_assembly38.fasta.gz \
/home/rtm/vivek/navi/wes_normal/fastq_trim/DLP-027_S58_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes_normal/fastq_trim/DLP-027_S58_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes_normal/bam/DLP-027_S58.bam -

bwa mem -t 23 -T 0 \
-R '@RG\tID:DLP-028_S67\tLB:WES\tPL:illumina\tPU:NULL\SM:DLP-028_S67' \
/home/references/broadhg38/bwa/Homo_sapiens_assembly38.fasta.gz \
/home/rtm/vivek/navi/wes_normal/fastq_trim/DLP-028_S67_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes_normal/fastq_trim/DLP-028_S67_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes_normal/bam/DLP-028_S67.bam -

bwa mem -t 23 -T 0 \
-R '@RG\tID:DLP-029_S59\tLB:WES\tPL:illumina\tPU:NULL\SM:DLP-029_S59' \
/home/references/broadhg38/bwa/Homo_sapiens_assembly38.fasta.gz \
/home/rtm/vivek/navi/wes_normal/fastq_trim/DLP-029_S59_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes_normal/fastq_trim/DLP-029_S59_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes_normal/bam/DLP-029_S59.bam -

bwa mem -t 23 -T 0 \
-R '@RG\tID:DLP-030_S74\tLB:WES\tPL:illumina\tPU:NULL\SM:DLP-030_S74' \
/home/references/broadhg38/bwa/Homo_sapiens_assembly38.fasta.gz \
/home/rtm/vivek/navi/wes_normal/fastq_trim/DLP-030_S74_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes_normal/fastq_trim/DLP-030_S74_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes_normal/bam/DLP-030_S74.bam -

bwa mem -t 23 -T 0 \
-R '@RG\tID:DLP-031_S62\tLB:WES\tPL:illumina\tPU:NULL\SM:DLP-031_S62' \
/home/references/broadhg38/bwa/Homo_sapiens_assembly38.fasta.gz \
/home/rtm/vivek/navi/wes_normal/fastq_trim/DLP-031_S62_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes_normal/fastq_trim/DLP-031_S62_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes_normal/bam/DLP-031_S62.bam -

bwa mem -t 23 -T 0 \
-R '@RG\tID:DLP-041_S68\tLB:WES\tPL:illumina\tPU:NULL\SM:DLP-041_S68' \
/home/references/broadhg38/bwa/Homo_sapiens_assembly38.fasta.gz \
/home/rtm/vivek/navi/wes_normal/fastq_trim/DLP-041_S68_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes_normal/fastq_trim/DLP-041_S68_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes_normal/bam/DLP-041_S68.bam -

bwa mem -t 23 -T 0 \
-R '@RG\tID:DLP-047_S75\tLB:WES\tPL:illumina\tPU:NULL\SM:DLP-047_S75' \
/home/references/broadhg38/bwa/Homo_sapiens_assembly38.fasta.gz \
/home/rtm/vivek/navi/wes_normal/fastq_trim/DLP-047_S75_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes_normal/fastq_trim/DLP-047_S75_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes_normal/bam/DLP-047_S75.bam -

bwa mem -t 23 -T 0 \
-R '@RG\tID:DLP-052_S69\tLB:WES\tPL:illumina\tPU:NULL\SM:DLP-052_S69' \
/home/references/broadhg38/bwa/Homo_sapiens_assembly38.fasta.gz \
/home/rtm/vivek/navi/wes_normal/fastq_trim/DLP-052_S69_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes_normal/fastq_trim/DLP-052_S69_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes_normal/bam/DLP-052_S69.bam -

bwa mem -t 23 -T 0 \
-R '@RG\tID:DLP-053_S76\tLB:WES\tPL:illumina\tPU:NULL\SM:DLP-053_S76' \
/home/references/broadhg38/bwa/Homo_sapiens_assembly38.fasta.gz \
/home/rtm/vivek/navi/wes_normal/fastq_trim/DLP-053_S76_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes_normal/fastq_trim/DLP-053_S76_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes_normal/bam/DLP-053_S76.bam -

bwa mem -t 23 -T 0 \
-R '@RG\tID:DLP-054_S77\tLB:WES\tPL:illumina\tPU:NULL\SM:DLP-054_S77' \
/home/references/broadhg38/bwa/Homo_sapiens_assembly38.fasta.gz \
/home/rtm/vivek/navi/wes_normal/fastq_trim/DLP-054_S77_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes_normal/fastq_trim/DLP-054_S77_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes_normal/bam/DLP-054_S77.bam -

bwa mem -t 23 -T 0 \
-R '@RG\tID:DLP-059_S70\tLB:WES\tPL:illumina\tPU:NULL\SM:DLP-059_S70' \
/home/references/broadhg38/bwa/Homo_sapiens_assembly38.fasta.gz \
/home/rtm/vivek/navi/wes_normal/fastq_trim/DLP-059_S70_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes_normal/fastq_trim/DLP-059_S70_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes_normal/bam/DLP-059_S70.bam -

bwa mem -t 23 -T 0 \
-R '@RG\tID:DLP-065_S60\tLB:WES\tPL:illumina\tPU:NULL\SM:DLP-065_S60' \
/home/references/broadhg38/bwa/Homo_sapiens_assembly38.fasta.gz \
/home/rtm/vivek/navi/wes_normal/fastq_trim/DLP-065_S60_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes_normal/fastq_trim/DLP-065_S60_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes_normal/bam/DLP-065_S60.bam -

bwa mem -t 23 -T 0 \
-R '@RG\tID:DLP-069_S61\tLB:WES\tPL:illumina\tPU:NULL\SM:DLP-069_S61' \
/home/references/broadhg38/bwa/Homo_sapiens_assembly38.fasta.gz \
/home/rtm/vivek/navi/wes_normal/fastq_trim/DLP-069_S61_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes_normal/fastq_trim/DLP-069_S61_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes_normal/bam/DLP-069_S61.bam -

bwa mem -t 23 -T 0 \
-R '@RG\tID:DLP-070_S71\tLB:WES\tPL:illumina\tPU:NULL\SM:DLP-070_S71' \
/home/references/broadhg38/bwa/Homo_sapiens_assembly38.fasta.gz \
/home/rtm/vivek/navi/wes_normal/fastq_trim/DLP-070_S71_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes_normal/fastq_trim/DLP-070_S71_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes_normal/bam/DLP-070_S71.bam -

bwa mem -t 23 -T 0 \
-R '@RG\tID:DLP-071_S72\tLB:WES\tPL:illumina\tPU:NULL\SM:DLP-071_S72' \
/home/references/broadhg38/bwa/Homo_sapiens_assembly38.fasta.gz \
/home/rtm/vivek/navi/wes_normal/fastq_trim/DLP-071_S72_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes_normal/fastq_trim/DLP-071_S72_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes_normal/bam/DLP-071_S72.bam -

bwa mem -t 23 -T 0 \
-R '@RG\tID:DLP-073_S73\tLB:WES\tPL:illumina\tPU:NULL\SM:DLP-073_S73' \
/home/references/broadhg38/bwa/Homo_sapiens_assembly38.fasta.gz \
/home/rtm/vivek/navi/wes_normal/fastq_trim/DLP-073_S73_R1_val_1.fq.gz \
/home/rtm/vivek/navi/wes_normal/fastq_trim/DLP-073_S73_R2_val_2.fq.gz | \
samtools view -Shb -o /home/rtm/vivek/navi/wes_normal/bam/DLP-073_S73.bam -

