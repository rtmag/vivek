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

##############################################################
java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=DLP-001_S65.bam \
OUTPUT=NORMAL_VM35_VM36_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=DLP-025_S66.bam \
OUTPUT=NORMAL_VM1_VM2_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=DLP-026_S57.bam \
OUTPUT=NORMAL_VM9_VM10_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=DLP-027_S58.bam \
OUTPUT=VM9_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=DLP-028_S67.bam \
OUTPUT=VM10_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=DLP-029_S59.bam \
OUTPUT=NORMAL_VM11_VM12_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=DLP-030_S74.bam \
OUTPUT=VM12_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=DLP-031_S62.bam \
OUTPUT=VM11_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=DLP-041_S68.bam \
OUTPUT=VM15_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=DLP-047_S75.bam \
OUTPUT=VM17_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=DLP-052_S69.bam \
OUTPUT=VM22_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=DLP-053_S76.bam \
OUTPUT=VM23_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=DLP-054_S77.bam \
OUTPUT=VM24_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=DLP-059_S70.bam \
OUTPUT=VM29_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=DLP-065_S60.bam \
OUTPUT=VM45_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=DLP-069_S61.bam \
OUTPUT=NORMAL_VM19_VM20_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=DLP-070_S71.bam \
OUTPUT=NORMAL_VM21_VM22_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=DLP-071_S72.bam \
OUTPUT=NORMAL_VM23_VM24_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar SortSam \
CREATE_INDEX=true \
INPUT=DLP-073_S73.bam \
OUTPUT=NORMAL_VM43_VM44_sort.bam \
SORT_ORDER=coordinate \
VALIDATION_STRINGENCY=STRICT


##########################################################################
/home/rtm/myprograms/qualimap_v2.2.1/qualimap bamqc -bam VM19_sort.bam -outfile VM19_sort.pdf --java-mem-size=200G
/home/rtm/myprograms/qualimap_v2.2.1/qualimap bamqc -bam VM1_sort.bam -outfile VM1_sort.pdf --java-mem-size=200G
/home/rtm/myprograms/qualimap_v2.2.1/qualimap bamqc -bam VM20_sort.bam -outfile VM20_sort.pdf --java-mem-size=200G
/home/rtm/myprograms/qualimap_v2.2.1/qualimap bamqc -bam VM25_sort.bam -outfile VM25_sort.pdf --java-mem-size=200G
/home/rtm/myprograms/qualimap_v2.2.1/qualimap bamqc -bam VM26_sort.bam -outfile VM26_sort.pdf --java-mem-size=200G
/home/rtm/myprograms/qualimap_v2.2.1/qualimap bamqc -bam VM2_sort.bam -outfile VM2_sort.pdf --java-mem-size=200G
/home/rtm/myprograms/qualimap_v2.2.1/qualimap bamqc -bam VM31_sort.bam -outfile VM31_sort.pdf --java-mem-size=200G
/home/rtm/myprograms/qualimap_v2.2.1/qualimap bamqc -bam VM32_sort.bam -outfile VM32_sort.pdf --java-mem-size=200G
/home/rtm/myprograms/qualimap_v2.2.1/qualimap bamqc -bam VM33_sort.bam -outfile VM33_sort.pdf --java-mem-size=200G
/home/rtm/myprograms/qualimap_v2.2.1/qualimap bamqc -bam VM34_sort.bam -outfile VM34_sort.pdf --java-mem-size=200G
/home/rtm/myprograms/qualimap_v2.2.1/qualimap bamqc -bam VM3_sort.bam -outfile VM3_sort.pdf --java-mem-size=200G
/home/rtm/myprograms/qualimap_v2.2.1/qualimap bamqc -bam VM43_sort.bam -outfile VM43_sort.pdf --java-mem-size=200G
/home/rtm/myprograms/qualimap_v2.2.1/qualimap bamqc -bam VM44_sort.bam -outfile VM44_sort.pdf --java-mem-size=200G 
/home/rtm/myprograms/qualimap_v2.2.1/qualimap bamqc -bam VM7_sort.bam -outfile VM7_sort.pdf --java-mem-size=200G
/home/rtm/myprograms/qualimap_v2.2.1/qualimap bamqc -bam VM8_sort.bam -outfile VM8_sort.pdf --java-mem-size=200G
##########################################################################

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar MarkDuplicates \
VALIDATION_STRINGENCY=STRICT \
CREATE_INDEX=true \
M=NORMAL_VM11_VM12_sort.MFILE.txt \
INPUT=NORMAL_VM11_VM12_sort.bam \
OUTPUT=NORMAL_VM11_VM12_sort.rmdup.bam 

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar MarkDuplicates \
VALIDATION_STRINGENCY=STRICT \
CREATE_INDEX=true \
M=NORMAL_VM19_VM20_sort.MFILE.txt \
INPUT=NORMAL_VM19_VM20_sort.bam \
OUTPUT=NORMAL_VM19_VM20_sort.rmdup.bam 

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar MarkDuplicates \
VALIDATION_STRINGENCY=STRICT \
CREATE_INDEX=true \
M=NORMAL_VM1_VM2_sort.MFILE.txt \
INPUT=NORMAL_VM1_VM2_sort.bam \
OUTPUT=NORMAL_VM1_VM2_sort.rmdup.bam 

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar MarkDuplicates \
VALIDATION_STRINGENCY=STRICT \
CREATE_INDEX=true \
M=NORMAL_VM21_VM22_sort.MFILE.txt \
INPUT=NORMAL_VM21_VM22_sort.bam \
OUTPUT=NORMAL_VM21_VM22_sort.rmdup.bam 

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar MarkDuplicates \
VALIDATION_STRINGENCY=STRICT \
CREATE_INDEX=true \
M=NORMAL_VM23_VM24_sort.MFILE.txt \
INPUT=NORMAL_VM23_VM24_sort.bam \
OUTPUT=NORMAL_VM23_VM24_sort.rmdup.bam 

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar MarkDuplicates \
VALIDATION_STRINGENCY=STRICT \
CREATE_INDEX=true \
M=NORMAL_VM35_VM36_sort.MFILE.txt \
INPUT=NORMAL_VM35_VM36_sort.bam \
OUTPUT=NORMAL_VM35_VM36_sort.rmdup.bam 

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar MarkDuplicates \
VALIDATION_STRINGENCY=STRICT \
CREATE_INDEX=true \
M=NORMAL_VM43_VM44_sort.MFILE.txt \
INPUT=NORMAL_VM43_VM44_sort.bam \
OUTPUT=NORMAL_VM43_VM44_sort.rmdup.bam 

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar MarkDuplicates \
VALIDATION_STRINGENCY=STRICT \
CREATE_INDEX=true \
M=NORMAL_VM9_VM10_sort.MFILE.txt \
INPUT=NORMAL_VM9_VM10_sort.bam \
OUTPUT=NORMAL_VM9_VM10_sort.rmdup.bam

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar MarkDuplicates \
VALIDATION_STRINGENCY=STRICT \
CREATE_INDEX=true \
M=VM10_sort.MFILE.txt \
INPUT=VM10_sort.bam \
OUTPUT=VM10_sort.rmdup.bam 

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar MarkDuplicates \
VALIDATION_STRINGENCY=STRICT \
CREATE_INDEX=true \
M=VM11_sort.MFILE.txt \
INPUT=VM11_sort.bam \
OUTPUT=VM11_sort.rmdup.bam 

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar MarkDuplicates \
VALIDATION_STRINGENCY=STRICT \
CREATE_INDEX=true \
M=VM12_sort.MFILE.txt \
INPUT=VM12_sort.bam \
OUTPUT=VM12_sort.rmdup.bam 

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar MarkDuplicates \
VALIDATION_STRINGENCY=STRICT \
CREATE_INDEX=true \
M=VM15_sort.MFILE.txt \
INPUT=VM15_sort.bam \
OUTPUT=VM15_sort.rmdup.bam 

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar MarkDuplicates \
VALIDATION_STRINGENCY=STRICT \
CREATE_INDEX=true \
M=VM17_sort.MFILE.txt \
INPUT=VM17_sort.bam \
OUTPUT=VM17_sort.rmdup.bam 

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar MarkDuplicates \
VALIDATION_STRINGENCY=STRICT \
CREATE_INDEX=true \
M=VM22_sort.MFILE.txt \
INPUT=VM22_sort.bam \
OUTPUT=VM22_sort.rmdup.bam 

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar MarkDuplicates \
VALIDATION_STRINGENCY=STRICT \
CREATE_INDEX=true \
M=VM23_sort.MFILE.txt \
INPUT=VM23_sort.bam \
OUTPUT=VM23_sort.rmdup.bam 

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar MarkDuplicates \
VALIDATION_STRINGENCY=STRICT \
CREATE_INDEX=true \
M=VM24_sort.MFILE.txt \
INPUT=VM24_sort.bam \
OUTPUT=VM24_sort.rmdup.bam 

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar MarkDuplicates \
VALIDATION_STRINGENCY=STRICT \
CREATE_INDEX=true \
M=VM29_sort.MFILE.txt \
INPUT=VM29_sort.bam \
OUTPUT=VM29_sort.rmdup.bam 

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar MarkDuplicates \
VALIDATION_STRINGENCY=STRICT \
CREATE_INDEX=true \
M=VM45_sort.MFILE.txt \
INPUT=VM45_sort.bam \
OUTPUT=VM45_sort.rmdup.bam 

java -Xmx250g -jar /home/rtm/myprograms/picard/build/libs/picard.jar MarkDuplicates \
VALIDATION_STRINGENCY=STRICT \
CREATE_INDEX=true \
M=VM9_sort.MFILE.txt \
INPUT=VM9_sort.bam \
OUTPUT=VM9_sort.rmdup.bam 
############################################################################################################
############################################################################################################
############################################################################################################


java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T RealignerTargetCreator \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-nt 20 \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-I NORMAL_VM11_VM12_sort.rmdup.bam \
-o NORMAL_VM11_VM12_sort.realign_target.intervals

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T RealignerTargetCreator \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-nt 20 \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-I NORMAL_VM19_VM20_sort.rmdup.bam \
-o NORMAL_VM19_VM20_sort.realign_target.intervals

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T RealignerTargetCreator \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-nt 20 \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-I NORMAL_VM1_VM2_sort.rmdup.bam \
-o NORMAL_VM1_VM2_sort.realign_target.intervals

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T RealignerTargetCreator \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-nt 20 \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-I NORMAL_VM21_VM22_sort.rmdup.bam \
-o NORMAL_VM21_VM22_sort.realign_target.intervals

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T RealignerTargetCreator \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-nt 20 \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-I NORMAL_VM23_VM24_sort.rmdup.bam \
-o NORMAL_VM23_VM24_sort.realign_target.intervals

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T RealignerTargetCreator \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-nt 20 \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-I NORMAL_VM35_VM36_sort.rmdup.bam \
-o NORMAL_VM35_VM36_sort.realign_target.intervals

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T RealignerTargetCreator \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-nt 20 \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-I NORMAL_VM43_VM44_sort.rmdup.bam \
-o NORMAL_VM43_VM44_sort.realign_target.intervals

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T RealignerTargetCreator \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-nt 20 \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-I NORMAL_VM9_VM10_sort.rmdup.bam \
-o NORMAL_VM9_VM10_sort.realign_target.intervals

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T RealignerTargetCreator \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-nt 20 \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-I VM10_sort.rmdup.bam \
-o VM10_sort.realign_target.intervals

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T RealignerTargetCreator \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-nt 20 \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-I VM11_sort.rmdup.bam \
-o VM11_sort.realign_target.intervals

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T RealignerTargetCreator \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-nt 20 \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-I VM12_sort.rmdup.bam \
-o VM12_sort.realign_target.intervals

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T RealignerTargetCreator \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-nt 20 \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-I VM15_sort.rmdup.bam \
-o VM15_sort.realign_target.intervals

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T RealignerTargetCreator \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-nt 20 \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-I VM17_sort.rmdup.bam \
-o VM17_sort.realign_target.intervals

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T RealignerTargetCreator \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-nt 20 \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-I VM22_sort.rmdup.bam \
-o VM22_sort.realign_target.intervals

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T RealignerTargetCreator \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-nt 20 \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-I VM23_sort.rmdup.bam \
-o VM23_sort.realign_target.intervals

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T RealignerTargetCreator \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-nt 20 \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-I VM24_sort.rmdup.bam \
-o VM24_sort.realign_target.intervals

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T RealignerTargetCreator \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-nt 20 \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-I VM29_sort.rmdup.bam \
-o VM29_sort.realign_target.intervals

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T RealignerTargetCreator \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-nt 20 \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-I VM45_sort.rmdup.bam \
-o VM45_sort.realign_target.intervals

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T RealignerTargetCreator \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-nt 20 \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-I VM9_sort.rmdup.bam \
-o VM9_sort.realign_target.intervals
############################################################################################################
############################################################################################################
############################################################################################################

java -Xmx200g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T IndelRealigner \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-targetIntervals NORMAL_VM11_VM12_sort.realign_target.intervals \
--noOriginalAlignmentTags \
-I NORMAL_VM11_VM12_sort.rmdup.bam \
--out NORMAL_VM11_VM12_sort.realigned.bam

java -Xmx200g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T IndelRealigner \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-targetIntervals NORMAL_VM19_VM20_sort.realign_target.intervals \
--noOriginalAlignmentTags \
-I NORMAL_VM19_VM20_sort.rmdup.bam \
--out NORMAL_VM19_VM20_sort.realigned.bam

java -Xmx200g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T IndelRealigner \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-targetIntervals NORMAL_VM1_VM2_sort.realign_target.intervals \
--noOriginalAlignmentTags \
-I NORMAL_VM1_VM2_sort.rmdup.bam \
--out NORMAL_VM1_VM2_sort.realigned.bam

java -Xmx200g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T IndelRealigner \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-targetIntervals NORMAL_VM21_VM22_sort.realign_target.intervals \
--noOriginalAlignmentTags \
-I NORMAL_VM21_VM22_sort.rmdup.bam \
--out NORMAL_VM21_VM22_sort.realigned.bam

java -Xmx200g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T IndelRealigner \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-targetIntervals NORMAL_VM23_VM24_sort.realign_target.intervals \
--noOriginalAlignmentTags \
-I NORMAL_VM23_VM24_sort.rmdup.bam \
--out NORMAL_VM23_VM24_sort.realigned.bam

java -Xmx200g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T IndelRealigner \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-targetIntervals NORMAL_VM35_VM36_sort.realign_target.intervals \
--noOriginalAlignmentTags \
-I NORMAL_VM35_VM36_sort.rmdup.bam \
--out NORMAL_VM35_VM36_sort.realigned.bam

java -Xmx200g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T IndelRealigner \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-targetIntervals NORMAL_VM43_VM44_sort.realign_target.intervals \
--noOriginalAlignmentTags \
-I NORMAL_VM43_VM44_sort.rmdup.bam \
--out NORMAL_VM43_VM44_sort.realigned.bam

java -Xmx200g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T IndelRealigner \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-targetIntervals NORMAL_VM9_VM10_sort.realign_target.intervals \
--noOriginalAlignmentTags \
-I NORMAL_VM9_VM10_sort.rmdup.bam \
--out NORMAL_VM9_VM10_sort.realigned.bam

java -Xmx200g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T IndelRealigner \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-targetIntervals VM10_sort.realign_target.intervals \
--noOriginalAlignmentTags \
-I VM10_sort.rmdup.bam \
--out VM10_sort.realigned.bam

java -Xmx200g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T IndelRealigner \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-targetIntervals VM11_sort.realign_target.intervals \
--noOriginalAlignmentTags \
-I VM11_sort.rmdup.bam \
--out VM11_sort.realigned.bam

java -Xmx200g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T IndelRealigner \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-targetIntervals VM12_sort.realign_target.intervals \
--noOriginalAlignmentTags \
-I VM12_sort.rmdup.bam \
--out VM12_sort.realigned.bam

java -Xmx200g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T IndelRealigner \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-targetIntervals VM15_sort.realign_target.intervals \
--noOriginalAlignmentTags \
-I VM15_sort.rmdup.bam \
--out VM15_sort.realigned.bam

java -Xmx200g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T IndelRealigner \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-targetIntervals VM17_sort.realign_target.intervals \
--noOriginalAlignmentTags \
-I VM17_sort.rmdup.bam \
--out VM17_sort.realigned.bam

java -Xmx200g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T IndelRealigner \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-targetIntervals VM22_sort.realign_target.intervals \
--noOriginalAlignmentTags \
-I VM22_sort.rmdup.bam \
--out VM22_sort.realigned.bam

java -Xmx200g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T IndelRealigner \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-targetIntervals VM23_sort.realign_target.intervals \
--noOriginalAlignmentTags \
-I VM23_sort.rmdup.bam \
--out VM23_sort.realigned.bam

java -Xmx200g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T IndelRealigner \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-targetIntervals VM24_sort.realign_target.intervals \
--noOriginalAlignmentTags \
-I VM24_sort.rmdup.bam \
--out VM24_sort.realigned.bam

java -Xmx200g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T IndelRealigner \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-targetIntervals VM29_sort.realign_target.intervals \
--noOriginalAlignmentTags \
-I VM29_sort.rmdup.bam \
--out VM29_sort.realigned.bam

java -Xmx200g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T IndelRealigner \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-targetIntervals VM45_sort.realign_target.intervals \
--noOriginalAlignmentTags \
-I VM45_sort.rmdup.bam \
--out VM45_sort.realigned.bam

java -Xmx200g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T IndelRealigner \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-known /home/references/broadhg38/broad_hg38/Mills_and_1000G_gold_standard.indels.hg38.vcf \
-targetIntervals VM9_sort.realign_target.intervals \
--noOriginalAlignmentTags \
-I VM9_sort.rmdup.bam \
--out VM9_sort.realigned.bam
############################################################################################################
############################################################################################################
############################################################################################################

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T BaseRecalibrator \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-knownSites /home/references/broadhg38/broad_hg38/dbsnp_146.hg38.vcf \
-I NORMAL_VM11_VM12_sort.realigned.bam \
-o NORMAL_VM11_VM12_sort.bqsr.grp

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T BaseRecalibrator \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-knownSites /home/references/broadhg38/broad_hg38/dbsnp_146.hg38.vcf \
-I NORMAL_VM19_VM20_sort.realigned.bam \
-o NORMAL_VM19_VM20_sort.bqsr.grp

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T BaseRecalibrator \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-knownSites /home/references/broadhg38/broad_hg38/dbsnp_146.hg38.vcf \
-I NORMAL_VM1_VM2_sort.realigned.bam \
-o NORMAL_VM1_VM2_sort.bqsr.grp

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T BaseRecalibrator \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-knownSites /home/references/broadhg38/broad_hg38/dbsnp_146.hg38.vcf \
-I NORMAL_VM21_VM22_sort.realigned.bam \
-o NORMAL_VM21_VM22_sort.bqsr.grp

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T BaseRecalibrator \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-knownSites /home/references/broadhg38/broad_hg38/dbsnp_146.hg38.vcf \
-I NORMAL_VM23_VM24_sort.realigned.bam \
-o NORMAL_VM23_VM24_sort.bqsr.grp

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T BaseRecalibrator \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-knownSites /home/references/broadhg38/broad_hg38/dbsnp_146.hg38.vcf \
-I NORMAL_VM35_VM36_sort.realigned.bam \
-o NORMAL_VM35_VM36_sort.bqsr.grp

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T BaseRecalibrator \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-knownSites /home/references/broadhg38/broad_hg38/dbsnp_146.hg38.vcf \
-I NORMAL_VM43_VM44_sort.realigned.bam \
-o NORMAL_VM43_VM44_sort.bqsr.grp

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T BaseRecalibrator \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-knownSites /home/references/broadhg38/broad_hg38/dbsnp_146.hg38.vcf \
-I NORMAL_VM9_VM10_sort.realigned.bam \
-o NORMAL_VM9_VM10_sort.bqsr.grp

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T BaseRecalibrator \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-knownSites /home/references/broadhg38/broad_hg38/dbsnp_146.hg38.vcf \
-I VM10_sort.realigned.bam \
-o VM10_sort.bqsr.grp

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T BaseRecalibrator \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-knownSites /home/references/broadhg38/broad_hg38/dbsnp_146.hg38.vcf \
-I VM11_sort.realigned.bam \
-o VM11_sort.bqsr.grp

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T BaseRecalibrator \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-knownSites /home/references/broadhg38/broad_hg38/dbsnp_146.hg38.vcf \
-I VM12_sort.realigned.bam \
-o VM12_sort.bqsr.grp

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T BaseRecalibrator \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-knownSites /home/references/broadhg38/broad_hg38/dbsnp_146.hg38.vcf \
-I VM15_sort.realigned.bam \
-o VM15_sort.bqsr.grp

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T BaseRecalibrator \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-knownSites /home/references/broadhg38/broad_hg38/dbsnp_146.hg38.vcf \
-I VM17_sort.realigned.bam \
-o VM17_sort.bqsr.grp

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T BaseRecalibrator \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-knownSites /home/references/broadhg38/broad_hg38/dbsnp_146.hg38.vcf \
-I VM22_sort.realigned.bam \
-o VM22_sort.bqsr.grp

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T BaseRecalibrator \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-knownSites /home/references/broadhg38/broad_hg38/dbsnp_146.hg38.vcf \
-I VM23_sort.realigned.bam \
-o VM23_sort.bqsr.grp

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T BaseRecalibrator \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-knownSites /home/references/broadhg38/broad_hg38/dbsnp_146.hg38.vcf \
-I VM29_sort.realigned.bam \
-o VM29_sort.bqsr.grp


java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T BaseRecalibrator \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-knownSites /home/references/broadhg38/broad_hg38/dbsnp_146.hg38.vcf \
-I VM45_sort.realigned.bam \
-o VM45_sort.bqsr.grp


java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T BaseRecalibrator \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-knownSites /home/references/broadhg38/broad_hg38/dbsnp_146.hg38.vcf \
-I VM9_sort.realigned.bam \
-o VM9_sort.bqsr.grp
############################################################################################################
############################################################################################################
############################################################################################################
.realigned.bam
.realigned.bam
.realigned.bam
.realigned.bam
.realigned.bam
.realigned.bam
.realigned.bam
.realigned.bam
.realigned.bam
.realigned.bam
.realigned.bam
.realigned.bam
.realigned.bam
.realigned.bam
.realigned.bam
.realigned.bam
.realigned.bam
.realigned.bam
.realigned.bam

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T PrintReads \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I NORMAL_VM11_VM12_sort.realigned.bam \
--BQSR NORMAL_VM11_VM12_sort.bqsr.grp \
-o NORMAL_VM11_VM12.recalibrated.bam

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T PrintReads \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I NORMAL_VM19_VM20_sort.realigned.bam \
--BQSR NORMAL_VM19_VM20_sort.bqsr.grp \
-o NORMAL_VM19_VM20.recalibrated.bam

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T PrintReads \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I NORMAL_VM1_VM2_sort.realigned.bam \
--BQSR NORMAL_VM1_VM2_sort.bqsr.grp \
-o NORMAL_VM1_VM2.recalibrated.bam

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T PrintReads \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I NORMAL_VM21_VM22_sort.realigned.bam \
--BQSR NORMAL_VM21_VM22_sort.bqsr.grp \
-o NORMAL_VM21_VM22.recalibrated.bam

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T PrintReads \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I NORMAL_VM23_VM24_sort.realigned.bam \
--BQSR NORMAL_VM23_VM24_sort.bqsr.grp \
-o NORMAL_VM23_VM24.recalibrated.bam

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T PrintReads \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I NORMAL_VM35_VM36_sort.realigned.bam \
--BQSR NORMAL_VM35_VM36_sort.bqsr.grp \
-o NORMAL_VM35_VM36.recalibrated.bam

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T PrintReads \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I NORMAL_VM43_VM44_sort.realigned.bam \
--BQSR NORMAL_VM43_VM44_sort.bqsr.grp \
-o NORMAL_VM43_VM44.recalibrated.bam

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T PrintReads \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I NORMAL_VM9_VM10_sort.realigned.bam \
--BQSR NORMAL_VM9_VM10_sort.bqsr.grp \
-o NORMAL_VM9_VM10.recalibrated.bam

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T PrintReads \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I VM10_sort.realigned.bam \
--BQSR VM10_sort.bqsr.grp \
-o VM10.recalibrated.bam

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T PrintReads \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I VM11_sort.realigned.bam \
--BQSR VM11_sort.bqsr.grp \
-o VM11.recalibrated.bam

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T PrintReads \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I VM12_sort.realigned.bam \
--BQSR VM12_sort.bqsr.grp \
-o VM12.recalibrated.bam

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T PrintReads \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I VM15_sort.realigned.bam \
--BQSR VM15_sort.bqsr.grp \
-o VM15.recalibrated.bam

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T PrintReads \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I VM17_sort.realigned.bam \
--BQSR VM17_sort.bqsr.grp \
-o VM17.recalibrated.bam

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T PrintReads \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I VM22_sort.realigned.bam \
--BQSR VM22_sort.bqsr.grp \
-o VM22.recalibrated.bam

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T PrintReads \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I VM23_sort.realigned.bam \
--BQSR VM23_sort.bqsr.grp \
-o VM23.recalibrated.bam

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T PrintReads \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I VM24_sort.realigned.bam \
--BQSR VM24_sort.bqsr.grp \
-o VM24.recalibrated.bam

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T PrintReads \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I VM29_sort.realigned.bam \
--BQSR VM29_sort.bqsr.grp \
-o VM29.recalibrated.bam

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T PrintReads \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I VM45_sort.realigned.bam \
--BQSR VM45_sort.bqsr.grp \
-o VM45.recalibrated.bam

java -Xmx10g -jar /home/rtm/myprograms/GenomeAnalysisTK_3.8.1.jar \
-T PrintReads \
-nct 20 \
-R /home/references/broadhg38/broad_hg38/Homo_sapiens_assembly38.fasta \
-I VM9_sort.realigned.bam \
--BQSR VM9_sort.bqsr.grp \
-o VM9.recalibrated.bam
