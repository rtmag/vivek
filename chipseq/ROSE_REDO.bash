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
