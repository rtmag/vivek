# MACS2 NHM
macs2 callpeak -g hs -q 0.001 --keep-dup auto -n NHM_H3K27ac_narrow_FDR1e-3 --outdir /home/rtm/vivek/chip-seq/macs2 \
-t /root/vivek/chip-seq/bam/NHM_H3K27ac_rmdup.bam -c /root/vivek/chip-seq/bam/NHM_input_rmdup.bam &
########################################################################################################
# MACS2 CDKN2A
macs2 callpeak -g hs -q 0.001 --keep-dup auto -n CDKN2A_H3K27ac_narrow_FDR1e-3 --outdir /home/rtm/vivek/chip-seq/macs2 \
-t /root/vivek/chip-seq/bam/CDKN2A_H3K27ac_rmdup.bam -c /root/vivek/chip-seq/bam/CDKN2A+BRAF_input_rmdup.bam &
########################################################################################################
# MACS2 BRAF
macs2 callpeak -g hs -q 0.001 --keep-dup auto -n BRAF_H3K27ac_narrow_FDR1e-3 --outdir /home/rtm/vivek/chip-seq/macs2 \
-t /root/vivek/chip-seq/bam/BRAF_H3K27ac_rmdup.bam -c /root/vivek/chip-seq/bam/CDKN2A+BRAF_input_rmdup.bam &
########################################################################################################
# MACS2 CDKN2A+BRAF
macs2 callpeak -g hs -q 0.001 --keep-dup auto -n CDKN2A+BRAF_H3K27ac_narrow_FDR1e-3 --outdir /home/rtm/vivek/chip-seq/macs2 \
-t /root/vivek/chip-seq/bam/CDKN2A+BRAF_H3K27ac_rmdup.bam -c /root/vivek/chip-seq/bam/CDKN2A+BRAF_input_rmdup.bam &
########################################################################################################

# THRESHOLD higher than -log10(40)
more NHM_H3K27ac_narrow_FDR1e-3_peaks.narrowPeak|awk -F"\t" '{if($9>40){print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6}}' > /root/vivek/chip-seq/macs2/NHM_H3K27ac_40.bed
more BRAF_H3K27ac_narrow_FDR1e-3_peaks.narrowPeak|awk -F"\t" '{if($9>40){print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6}}' > /root/vivek/chip-seq/macs2/BRAF_H3K27ac_40.bed
more CDKN2A_H3K27ac_narrow_FDR1e-3_peaks.narrowPeak|awk -F"\t" '{if($9>40){print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6}}' > /root/vivek/chip-seq/macs2/CDKN2A_H3K27ac_40.bed
more CDKN2A+BRAF_H3K27ac_narrow_FDR1e-3_peaks.narrowPeak|awk -F"\t" '{if($9>40){print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6}}' > /root/vivek/chip-seq/macs2/CDKN2A+BRAF_H3K27ac_40.bed


python /root/myPrograms/rose/ROSE_main_hg38.py \
-r /root/vivek/chip-seq/bam/NHM_H3K27ac_rmdup.bam \
-c /root/vivek/chip-seq/bam/NHM_input_rmdup.bam \
-i /root/vivek/chip-seq/macs2/NHM_H3K27ac_40.bed \
-g HG38 -t 2500 \
-o /root/vivek/chip-seq/ROSE/NHM_40 &> NHM_40.log &
# NOTES WORST PROGRAM EVER, RUN INSIDE THE DIRECTORY WITH THE SCRIPTS...
################################################################################

python /root/myPrograms/rose/ROSE_main_hg38.py \
-r /root/vivek/chip-seq/bam/BRAF_H3K27ac_rmdup.bam \
-c /root/vivek/chip-seq/bam/CDKN2A+BRAF_input_rmdup.bam \
-i /root/vivek/chip-seq/macs2/BRAF_H3K27ac_40.bed \
-g HG38 -t 2500 \
-o /root/vivek/chip-seq/ROSE/BRAF_40 &> BRAF_40.log &
################################################################################
python /root/myPrograms/rose/ROSE_main_hg38.py \
-r /root/vivek/chip-seq/bam/CDKN2A_H3K27ac_rmdup.bam \
-c /root/vivek/chip-seq/bam/CDKN2A+BRAF_input_rmdup.bam \
-i /root/vivek/chip-seq/macs2/CDKN2A_H3K27ac_40.bed \
-g HG38 -t 2500 \
-o /root/vivek/chip-seq/ROSE/CDKN2A_40 &> CDKN2A_40.log &
##############################################################
python /root/myPrograms/rose/ROSE_main_hg38.py \
-r /root/vivek/chip-seq/bam/CDKN2A+BRAF_H3K27ac_rmdup.bam \
-c /root/vivek/chip-seq/bam/CDKN2A+BRAF_input_rmdup.bam \
-i /root/vivek/chip-seq/macs2/CDKN2A+BRAF_H3K27ac_40.bed \
-g HG38 -t 2500 \
-o /root/vivek/chip-seq/ROSE/CDKN2A+BRAF_40 &> CDKN2A+BRAF_40.log &
##############################################################
