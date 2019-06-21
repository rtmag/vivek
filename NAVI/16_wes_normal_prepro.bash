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
