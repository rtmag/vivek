cut -f 1-6 /root/vivek/chip-seq/macs2/NHM_H3K27ac_peaks.broadPeak > /root/vivek/chip-seq/macs2/NHM_H3K27ac_peaks.bed

python /root/myPrograms/rose/ROSE_main_hg38.py \
-r /root/vivek/chip-seq/bam/NHM_H3K27ac_rmdup.bam \
-c /root/vivek/chip-seq/bam/NHM_input_rmdup.bam \
-i /root/vivek/chip-seq/macs2/NHM_H3K27ac_peaks.bed \
-g HG38 \
-o /root/vivek/chip-seq/ROSE/NHM &> NHM.log
# NOTES WORST PROGRAM EVER, RUN INSIDE THE DIRECTORY WITH THE SCRIPTS...
