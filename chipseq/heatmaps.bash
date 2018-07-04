
################################################################################################################################
computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/BRAF_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27ac.bw \
/root/vivek/chip-seq/bw/NHM_H3K27ac.bw \
-R /root/vivek/vivek_new_rna_seq/deseq2/NHM_BRAF_CDKN2A.bed --referencePoint center \
--sortRegions descend -bs 20 -a 3000 -b 3000 -p max -out /root/vivek/chip-seq/heatmap/H3K27ac_NHM_BRAF_CDKN2A.mat

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/BRAF_H3K27me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27me3.bw \
/root/vivek/chip-seq/bw/NHM_H3K27me3.bw \
-R /root/vivek/vivek_new_rna_seq/deseq2/NHM_BRAF_CDKN2A.bed --referencePoint center \
--sortRegions descend -bs 20 -a 3000 -b 3000 -p max -out /root/vivek/chip-seq/heatmap/H3K27me3_NHM_BRAF_CDKN2A.mat

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/BRAF_H3K4me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K4me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K4me3.bw \
/root/vivek/chip-seq/bw/NHM_H3K4me3.bw \
-R /root/vivek/vivek_new_rna_seq/deseq2/NHM_BRAF_CDKN2A.bed --referencePoint center \
--sortRegions descend -bs 20 -a 3000 -b 3000 -p max -out /root/vivek/chip-seq/heatmap/H3K4me3_NHM_BRAF_CDKN2A.mat

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/BRAF_H3K9me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K9me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K9me3.bw \
/root/vivek/chip-seq/bw/NHM_H3K9me3.bw \
-R /root/vivek/vivek_new_rna_seq/deseq2/NHM_BRAF_CDKN2A.bed --referencePoint center \
--sortRegions descend -bs 20 -a 3000 -b 3000 -p max -out /root/vivek/chip-seq/heatmap/H3K9me3_NHM_BRAF_CDKN2A.mat
################################################################################################################################
computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/BRAF_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27ac.bw \
/root/vivek/chip-seq/bw/NHM_H3K27ac.bw \
-R /root/vivek/vivek_new_rna_seq/deseq2/NHM_BRAF.bed --referencePoint center \
--sortRegions descend -bs 20 -a 3000 -b 3000 -p max -out /root/vivek/chip-seq/heatmap/H3K27ac_NHM_BRAF.mat

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/BRAF_H3K27me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27me3.bw \
/root/vivek/chip-seq/bw/NHM_H3K27me3.bw \
-R /root/vivek/vivek_new_rna_seq/deseq2/NHM_BRAF.bed --referencePoint center \
--sortRegions descend -bs 20 -a 3000 -b 3000 -p max -out /root/vivek/chip-seq/heatmap/H3K27me3_NHM_BRAF.mat

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/BRAF_H3K4me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K4me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K4me3.bw \
/root/vivek/chip-seq/bw/NHM_H3K4me3.bw \
-R /root/vivek/vivek_new_rna_seq/deseq2/NHM_BRAF.bed --referencePoint center \
--sortRegions descend -bs 20 -a 3000 -b 3000 -p max -out /root/vivek/chip-seq/heatmap/H3K4me3_NHM_BRAF.mat

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/BRAF_H3K9me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K9me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K9me3.bw \
/root/vivek/chip-seq/bw/NHM_H3K9me3.bw \
-R /root/vivek/vivek_new_rna_seq/deseq2/NHM_BRAF.bed --referencePoint center \
--sortRegions descend -bs 20 -a 3000 -b 3000 -p max -out /root/vivek/chip-seq/heatmap/H3K9me3_NHM_BRAF.mat
################################################################################################################################
computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/BRAF_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27ac.bw \
/root/vivek/chip-seq/bw/NHM_H3K27ac.bw \
-R /root/vivek/vivek_new_rna_seq/deseq2/NHM_CDKN2A.bed --referencePoint center \
--sortRegions descend -bs 20 -a 3000 -b 3000 -p max -out /root/vivek/chip-seq/heatmap/H3K27ac_NHM_CDKN2A.mat

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/BRAF_H3K27me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27me3.bw \
/root/vivek/chip-seq/bw/NHM_H3K27me3.bw \
-R /root/vivek/vivek_new_rna_seq/deseq2/NHM_CDKN2A.bed --referencePoint center \
--sortRegions descend -bs 20 -a 3000 -b 3000 -p max -out /root/vivek/chip-seq/heatmap/H3K27me3_NHM_CDKN2A.mat

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/BRAF_H3K4me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K4me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K4me3.bw \
/root/vivek/chip-seq/bw/NHM_H3K4me3.bw \
-R /root/vivek/vivek_new_rna_seq/deseq2/NHM_CDKN2A.bed --referencePoint center \
--sortRegions descend -bs 20 -a 3000 -b 3000 -p max -out /root/vivek/chip-seq/heatmap/H3K4me3_NHM_CDKN2A.mat

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/BRAF_H3K9me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K9me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K9me3.bw \
/root/vivek/chip-seq/bw/NHM_H3K9me3.bw \
-R /root/vivek/vivek_new_rna_seq/deseq2/NHM_CDKN2A.bed --referencePoint center \
--sortRegions descend -bs 20 -a 3000 -b 3000 -p max -out /root/vivek/chip-seq/heatmap/H3K9me3_NHM_CDKN2A.mat
################################################################################################################################
