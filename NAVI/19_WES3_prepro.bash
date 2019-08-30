# Unzip all files
unzip "*.zip"

ls -1 |perl -pe 's/\_L0/\t/g'|cut -f1|uniq|grep -v "zips"| \
perl -pe 's/(.+)\n/cat $1_L001_R1_001.fastq.gz $1_L002_R1_001.fastq.gz \> .fastq.gz\n/g'
# 
ls -1 |perl -pe 's/\_L0/\t/g'|cut -f1|uniq|grep -v "zips"| \
perl -pe 's/(.+)\n/cat $1_L001_R2_001.fastq.gz $1_L002_R2_001.fastq.gz \> .fastq.gz\n/g'
# 

cat DLP-02_S1_L001_R1_001.fastq.gz DLP-02_S1_L002_R1_001.fastq.gz > VM36_R1.fastq.gz
cat DLP-03_S2_L001_R1_001.fastq.gz DLP-03_S2_L002_R1_001.fastq.gz > VM35_R1.fastq.gz
cat DLP-06_S3_L001_R1_001.fastq.gz DLP-06_S3_L002_R1_001.fastq.gz > VM37_R1.fastq.gz
cat DLP-08_S6_L001_R1_001.fastq.gz DLP-08_S6_L002_R1_001.fastq.gz > VM42_R1.fastq.gz
cat DLP-09_S7_L001_R1_001.fastq.gz DLP-09_S7_L002_R1_001.fastq.gz > VM41_R1.fastq.gz
cat DLP-19_S4_L001_R1_001.fastq.gz DLP-19_S4_L002_R1_001.fastq.gz > VM6_R1.fastq.gz
cat DLP-72_S8_L001_R1_001.fastq.gz DLP-72_S8_L002_R1_001.fastq.gz > NORMAL_VM45_VM46_R1.fastq.gz
cat DLP-75_S10_L001_R1_001.fastq.gz DLP-75_S10_L002_R1_001.fastq.gz > VM16_R1.fastq.gz
cat DLP-79_S11_L001_R1_001.fastq.gz DLP-79_S11_L002_R1_001.fastq.gz > VM48_R1.fastq.gz
cat DLP-85_S5_L001_R1_001.fastq.gz DLP-85_S5_L002_R1_001.fastq.gz > VM5_R1.fastq.gz
cat DLP-86_S9_L001_R1_001.fastq.gz DLP-86_S9_L002_R1_001.fastq.gz > VM46_R1.fastq.gz
cat DLP-94_S12_L001_R1_001.fastq.gz DLP-94_S12_L002_R1_001.fastq.gz > VM1000_R1.fastq.gz
cat DLP-95_S13_L001_R1_001.fastq.gz DLP-95_S13_L002_R1_001.fastq.gz > NORMAL_VM999_VM1000_R1.fastq.gz


cat DLP-02_S1_L001_R2_001.fastq.gz DLP-02_S1_L002_R2_001.fastq.gz > VM36_R2.fastq.gz
cat DLP-03_S2_L001_R2_001.fastq.gz DLP-03_S2_L002_R2_001.fastq.gz > VM35_R2.fastq.gz
cat DLP-06_S3_L001_R2_001.fastq.gz DLP-06_S3_L002_R2_001.fastq.gz > VM37_R2.fastq.gz
cat DLP-08_S6_L001_R2_001.fastq.gz DLP-08_S6_L002_R2_001.fastq.gz > VM42_R2.fastq.gz
cat DLP-09_S7_L001_R2_001.fastq.gz DLP-09_S7_L002_R2_001.fastq.gz > VM41_R2.fastq.gz
cat DLP-19_S4_L001_R2_001.fastq.gz DLP-19_S4_L002_R2_001.fastq.gz > VM6_R2.fastq.gz
cat DLP-72_S8_L001_R2_001.fastq.gz DLP-72_S8_L002_R2_001.fastq.gz > NORMAL_VM45_VM46_R2.fastq.gz
cat DLP-75_S10_L001_R2_001.fastq.gz DLP-75_S10_L002_R2_001.fastq.gz > VM16_R2.fastq.gz
cat DLP-79_S11_L001_R2_001.fastq.gz DLP-79_S11_L002_R2_001.fastq.gz > VM48_R2.fastq.gz
cat DLP-85_S5_L001_R2_001.fastq.gz DLP-85_S5_L002_R2_001.fastq.gz >  VM5_R2.fastq.gz
cat DLP-86_S9_L001_R2_001.fastq.gz DLP-86_S9_L002_R2_001.fastq.gz > VM46_R2.fastq.gz
cat DLP-94_S12_L001_R2_001.fastq.gz DLP-94_S12_L002_R2_001.fastq.gz > VM1000_R2.fastq.gz
cat DLP-95_S13_L001_R2_001.fastq.gz DLP-95_S13_L002_R2_001.fastq.gz > NORMAL_VM999_VM1000_R2.fastq.gz
