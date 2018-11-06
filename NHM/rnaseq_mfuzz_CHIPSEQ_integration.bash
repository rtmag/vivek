
more /root/resources/hg38_tss.bed|grep -wf ct_1_rnaseq.txt|grep -v "\-\AS"|grep -v "\-IT" > ct_1_TSS.bed &
more /root/resources/hg38_tss.bed|grep -wf ct_2_rnaseq.txt|grep -v "\-\AS"|grep -v "\-IT" > ct_2_TSS.bed &
more /root/resources/hg38_tss.bed|grep -wf ct_3_rnaseq.txt|grep -v "\-\AS"|grep -v "\-IT" > ct_3_TSS.bed &
more /root/resources/hg38_tss.bed|grep -wf ct_4_rnaseq.txt|grep -v "\-\AS"|grep -v "\-IT" > ct_4_TSS.bed &
more /root/resources/hg38_tss.bed|grep -wf ct_5_rnaseq.txt|grep -v "\-\AS"|grep -v "\-IT" > ct_5_TSS.bed &
more /root/resources/hg38_tss.bed|grep -wf ct_6_rnaseq.txt|grep -v "\-\AS"|grep -v "\-IT" > ct_6_TSS.bed &
more /root/resources/hg38_tss.bed|grep -wf ct_7_rnaseq.txt|grep -v "\-\AS"|grep -v "\-IT" > ct_7_TSS.bed &
more /root/resources/hg38_tss.bed|grep -wf ct_8_rnaseq.txt|grep -v "\-\AS"|grep -v "\-IT" > ct_8_TSS.bed &
more /root/resources/hg38_tss.bed|grep -wf ct_9_rnaseq.txt|grep -v "\-\AS"|grep -v "\-IT" > ct_9_TSS.bed &
#

################################################################################################################################
computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K27ac.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27ac.bw \
-R ct_1_TSS.bed --referencePoint center \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out H3K27ac_C1.mat

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K27me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27me3.bw \
-R ct_1_TSS.bed --referencePoint center \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out H3K27me3_C1.mat

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K4me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K4me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K4me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K4me3.bw \
-R ct_1_TSS.bed --referencePoint center \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out H3K4me3_C1.mat

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K9me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K9me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K9me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K9me3.bw \
-R ct_1_TSS.bed --referencePoint center \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out H3K9me3_C1.mat
################################################################################################################################
################################################################################################################################
computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K27ac.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27ac.bw \
-R ct_2_TSS.bed --referencePoint center \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out H3K27ac_C2.mat

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K27me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27me3.bw \
-R ct_2_TSS.bed --referencePoint center \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out H3K27me3_C2.mat

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K4me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K4me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K4me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K4me3.bw \
-R ct_2_TSS.bed --referencePoint center \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out H3K4me3_C2.mat

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K9me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K9me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K9me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K9me3.bw \
-R ct_2_TSS.bed --referencePoint center \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out H3K9me3_C2.mat
################################################################################################################################
computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K27ac.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27ac.bw \
-R ct_3_TSS.bed --referencePoint center \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out H3K27ac_C3.mat

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K27me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27me3.bw \
-R ct_3_TSS.bed --referencePoint center \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out H3K27me3_C3.mat

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K4me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K4me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K4me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K4me3.bw \
-R ct_3_TSS.bed --referencePoint center \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out H3K4me3_C3.mat

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K9me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K9me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K9me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K9me3.bw \
-R ct_3_TSS.bed --referencePoint center \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out H3K9me3_C3.mat
################################################################################################################################
computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K27ac.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27ac.bw \
-R ct_4_TSS.bed --referencePoint center \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out H3K27ac_C4.mat

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K27me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27me3.bw \
-R ct_4_TSS.bed --referencePoint center \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out H3K27me3_C4.mat

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K4me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K4me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K4me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K4me3.bw \
-R ct_4_TSS.bed --referencePoint center \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out H3K4me3_C4.mat

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K9me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K9me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K9me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K9me3.bw \
-R ct_4_TSS.bed --referencePoint center \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out H3K9me3_C4.mat
################################################################################################################################
computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K27ac.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27ac.bw \
-R ct_5_TSS.bed --referencePoint center \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out H3K27ac_C5.mat

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K27me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27me3.bw \
-R ct_5_TSS.bed --referencePoint center \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out H3K27me3_C5.mat

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K4me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K4me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K4me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K4me3.bw \
-R ct_5_TSS.bed --referencePoint center \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out H3K4me3_C5.mat

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K9me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K9me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K9me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K9me3.bw \
-R ct_5_TSS.bed --referencePoint center \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out H3K9me3_C5.mat
################################################################################################################################
computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K27ac.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27ac.bw \
-R ct_6_TSS.bed --referencePoint center \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out H3K27ac_C6.mat

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K27me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27me3.bw \
-R ct_6_TSS.bed --referencePoint center \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out H3K27me3_C6.mat

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K4me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K4me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K4me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K4me3.bw \
-R ct_6_TSS.bed --referencePoint center \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out H3K4me3_C6.mat

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K9me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K9me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K9me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K9me3.bw \
-R ct_6_TSS.bed --referencePoint center \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out H3K9me3_C6.mat
################################################################################################################################
computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K27ac.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27ac.bw \
-R ct_7_TSS.bed --referencePoint center \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out H3K27ac_C7.mat

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K27me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27me3.bw \
-R ct_7_TSS.bed --referencePoint center \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out H3K27me3_C7.mat

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K4me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K4me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K4me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K4me3.bw \
-R ct_7_TSS.bed --referencePoint center \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out H3K4me3_C7.mat

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K9me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K9me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K9me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K9me3.bw \
-R ct_7_TSS.bed --referencePoint center \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out H3K9me3_C7.mat
################################################################################################################################
computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K27ac.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27ac.bw \
-R ct_8_TSS.bed --referencePoint center \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out H3K27ac_C8.mat

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K27me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27me3.bw \
-R ct_8_TSS.bed --referencePoint center \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out H3K27me3_C8.mat

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K4me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K4me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K4me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K4me3.bw \
-R ct_8_TSS.bed --referencePoint center \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out H3K4me3_C8.mat

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K9me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K9me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K9me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K9me3.bw \
-R ct_8_TSS.bed --referencePoint center \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out H3K9me3_C8.mat
################################################################################################################################
computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K27ac.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27ac.bw \
-R ct_9_TSS.bed --referencePoint center \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out H3K27ac_C9.mat

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K27me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27me3.bw \
-R ct_9_TSS.bed --referencePoint center \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out H3K27me3_C9.mat

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K4me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K4me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K4me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K4me3.bw \
-R ct_9_TSS.bed --referencePoint center \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out H3K4me3_C9.mat

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K9me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K9me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K9me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K9me3.bw \
-R ct_9_TSS.bed --referencePoint center \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out H3K9me3_C9.mat
################################################################################################################################
