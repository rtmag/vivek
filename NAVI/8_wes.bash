# Unzip all files
unzip "*.zip"

ls -1 |perl -pe 's/\_L0/\t/g'|cut -f1|uniq|grep -v "zips"| \
perl -pe 's/(.+)\n/cat $1_L001_R1_001.fastq.gz $1_L002_R1_001.fastq.gz $1_L003_R1_001.fastq.gz $1_L004_R1_001.fastq.gz \> .fastq.gz\n/g'
# 
ls -1 |perl -pe 's/\_L0/\t/g'|cut -f1|uniq|grep -v "zips"| \
perl -pe 's/(.+)\n/cat $1_L001_R2_001.fastq.gz $1_L002_R2_001.fastq.gz $1_L003_R2_001.fastq.gz $1_L004_R2_001.fastq.gz \> .fastq.gz\n/g'
# 

cat DLP-011_S1_L001_R1_001.fastq.gz DLP-011_S1_L002_R1_001.fastq.gz DLP-011_S1_L003_R1_001.fastq.gz DLP-011_S1_L004_R1_001.fastq.gz > VM4_R1.fastq.gz
cat DLP-012_S2_L001_R1_001.fastq.gz DLP-012_S2_L002_R1_001.fastq.gz DLP-012_S2_L003_R1_001.fastq.gz DLP-012_S2_L004_R1_001.fastq.gz > VM3_R1.fastq.gz
cat DLP-017_S13_L001_R1_001.fastq.gz DLP-017_S13_L002_R1_001.fastq.gz DLP-017_S13_L003_R1_001.fastq.gz DLP-017_S13_L004_R1_001.fastq.gz > VM2_R1.fastq.gz
cat DLP-018_S14_L001_R1_001.fastq.gz DLP-018_S14_L002_R1_001.fastq.gz DLP-018_S14_L003_R1_001.fastq.gz DLP-018_S14_L004_R1_001.fastq.gz > VM1_R1.fastq.gz
cat DLP-021_S3_L001_R1_001.fastq.gz DLP-021_S3_L002_R1_001.fastq.gz DLP-021_S3_L003_R1_001.fastq.gz DLP-021_S3_L004_R1_001.fastq.gz > VM8_R1.fastq.gz
cat DLP-022_S4_L001_R1_001.fastq.gz DLP-022_S4_L002_R1_001.fastq.gz DLP-022_S4_L003_R1_001.fastq.gz DLP-022_S4_L004_R1_001.fastq.gz > VM7_R1.fastq.gz
cat DLP-043_S5_L001_R1_001.fastq.gz DLP-043_S5_L002_R1_001.fastq.gz DLP-043_S5_L003_R1_001.fastq.gz DLP-043_S5_L004_R1_001.fastq.gz > VM31_R1.fastq.gz
cat DLP-044_S6_L001_R1_001.fastq.gz DLP-044_S6_L002_R1_001.fastq.gz DLP-044_S6_L003_R1_001.fastq.gz DLP-044_S6_L004_R1_001.fastq.gz > VM32_R1.fastq.gz
cat DLP-045_S7_L001_R1_001.fastq.gz DLP-045_S7_L002_R1_001.fastq.gz DLP-045_S7_L003_R1_001.fastq.gz DLP-045_S7_L004_R1_001.fastq.gz > VM33_R1.fastq.gz
cat DLP-046_S8_L001_R1_001.fastq.gz DLP-046_S8_L002_R1_001.fastq.gz DLP-046_S8_L003_R1_001.fastq.gz DLP-046_S8_L004_R1_001.fastq.gz > VM34_R1.fastq.gz
cat DLP-049_S9_L001_R1_001.fastq.gz DLP-049_S9_L002_R1_001.fastq.gz DLP-049_S9_L003_R1_001.fastq.gz DLP-049_S9_L004_R1_001.fastq.gz > VM19_R1.fastq.gz
cat DLP-050_S10_L001_R1_001.fastq.gz DLP-050_S10_L002_R1_001.fastq.gz DLP-050_S10_L003_R1_001.fastq.gz DLP-050_S10_L004_R1_001.fastq.gz > VM20_R1.fastq.gz
cat DLP-055_S15_L001_R1_001.fastq.gz DLP-055_S15_L002_R1_001.fastq.gz DLP-055_S15_L003_R1_001.fastq.gz DLP-055_S15_L004_R1_001.fastq.gz > VM25_R1.fastq.gz
cat DLP-056_S16_L001_R1_001.fastq.gz DLP-056_S16_L002_R1_001.fastq.gz DLP-056_S16_L003_R1_001.fastq.gz DLP-056_S16_L004_R1_001.fastq.gz > VM26_R1.fastq.gz
cat DLP-061_S11_L001_R1_001.fastq.gz DLP-061_S11_L002_R1_001.fastq.gz DLP-061_S11_L003_R1_001.fastq.gz DLP-061_S11_L004_R1_001.fastq.gz > VM43_R1.fastq.gz
cat DLP-062_S12_L001_R1_001.fastq.gz DLP-062_S12_L002_R1_001.fastq.gz DLP-062_S12_L003_R1_001.fastq.gz DLP-062_S12_L004_R1_001.fastq.gz > VM44_R1.fastq.gz

cat DLP-011_S1_L001_R2_001.fastq.gz DLP-011_S1_L002_R2_001.fastq.gz DLP-011_S1_L003_R2_001.fastq.gz DLP-011_S1_L004_R2_001.fastq.gz > VM4_R2.fastq.gz
cat DLP-012_S2_L001_R2_001.fastq.gz DLP-012_S2_L002_R2_001.fastq.gz DLP-012_S2_L003_R2_001.fastq.gz DLP-012_S2_L004_R2_001.fastq.gz > VM3_R2.fastq.gz
cat DLP-017_S13_L001_R2_001.fastq.gz DLP-017_S13_L002_R2_001.fastq.gz DLP-017_S13_L003_R2_001.fastq.gz DLP-017_S13_L004_R2_001.fastq.gz > VM2_R2.fastq.gz
cat DLP-018_S14_L001_R2_001.fastq.gz DLP-018_S14_L002_R2_001.fastq.gz DLP-018_S14_L003_R2_001.fastq.gz DLP-018_S14_L004_R2_001.fastq.gz > VM1_R2.fastq.gz
cat DLP-021_S3_L001_R2_001.fastq.gz DLP-021_S3_L002_R2_001.fastq.gz DLP-021_S3_L003_R2_001.fastq.gz DLP-021_S3_L004_R2_001.fastq.gz > VM8_R2.fastq.gz
cat DLP-022_S4_L001_R2_001.fastq.gz DLP-022_S4_L002_R2_001.fastq.gz DLP-022_S4_L003_R2_001.fastq.gz DLP-022_S4_L004_R2_001.fastq.gz > VM7_R2.fastq.gz
cat DLP-043_S5_L001_R2_001.fastq.gz DLP-043_S5_L002_R2_001.fastq.gz DLP-043_S5_L003_R2_001.fastq.gz DLP-043_S5_L004_R2_001.fastq.gz > VM31_R2.fastq.gz
cat DLP-044_S6_L001_R2_001.fastq.gz DLP-044_S6_L002_R2_001.fastq.gz DLP-044_S6_L003_R2_001.fastq.gz DLP-044_S6_L004_R2_001.fastq.gz > VM32_R2.fastq.gz
cat DLP-045_S7_L001_R2_001.fastq.gz DLP-045_S7_L002_R2_001.fastq.gz DLP-045_S7_L003_R2_001.fastq.gz DLP-045_S7_L004_R2_001.fastq.gz > VM33_R2.fastq.gz
cat DLP-046_S8_L001_R2_001.fastq.gz DLP-046_S8_L002_R2_001.fastq.gz DLP-046_S8_L003_R2_001.fastq.gz DLP-046_S8_L004_R2_001.fastq.gz > VM34_R2.fastq.gz
cat DLP-049_S9_L001_R2_001.fastq.gz DLP-049_S9_L002_R2_001.fastq.gz DLP-049_S9_L003_R2_001.fastq.gz DLP-049_S9_L004_R2_001.fastq.gz > VM19_R2.fastq.gz
cat DLP-050_S10_L001_R2_001.fastq.gz DLP-050_S10_L002_R2_001.fastq.gz DLP-050_S10_L003_R2_001.fastq.gz DLP-050_S10_L004_R2_001.fastq.gz > VM20_R2.fastq.gz
cat DLP-055_S15_L001_R2_001.fastq.gz DLP-055_S15_L002_R2_001.fastq.gz DLP-055_S15_L003_R2_001.fastq.gz DLP-055_S15_L004_R2_001.fastq.gz > VM25_R2.fastq.gz
cat DLP-056_S16_L001_R2_001.fastq.gz DLP-056_S16_L002_R2_001.fastq.gz DLP-056_S16_L003_R2_001.fastq.gz DLP-056_S16_L004_R2_001.fastq.gz > VM26_R2.fastq.gz
cat DLP-061_S11_L001_R2_001.fastq.gz DLP-061_S11_L002_R2_001.fastq.gz DLP-061_S11_L003_R2_001.fastq.gz DLP-061_S11_L004_R2_001.fastq.gz > VM43_R2.fastq.gz
cat DLP-062_S12_L001_R2_001.fastq.gz DLP-062_S12_L002_R2_001.fastq.gz DLP-062_S12_L003_R2_001.fastq.gz DLP-062_S12_L004_R2_001.fastq.gz > VM44_R2.fastq.gz
