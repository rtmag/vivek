java -mx22000M -jar /root/myPrograms/ChromHMM/ChromHMM.jar BinarizeBam \
/root/resources/hg38.chrom.sizes \
/root/vivek/chip-seq/bam/ \
vivek_nhm_input_matrix.txt \
binarizedBAM

java -mx22000M -jar /root/myPrograms/ChromHMM/ChromHMM.jar LearnModel -p 0 
/root/vivek/chip-seq/chromHMM/binarizedBAM \
/root/vivek/chip-seq/chromHMM/LearnModel \
14 \
hg38
########################################################################3
more ~/resources/hg38_tss.bed | awk -F'\t' '$1"\t"$2-500"\t"$3+500"\t"$4"\t"$5"\t"$6'| \
bedtools intersect -a - -b NHM_14_segments.bed -wa -wb|grep -w "E7"|cut -f4|sort|uniq > NHM_E7_genes.txt

more ~/resources/hg38_tss.bed | awk -F'\t' '$1"\t"$2-500"\t"$3+500"\t"$4"\t"$5"\t"$6'| \
bedtools intersect -a - -b BRAF_14_segments.bed -wa -wb|grep -w "E7"|cut -f4|sort|uniq > BRAF_E7_genes.txt

more ~/resources/hg38_tss.bed | awk -F'\t' '$1"\t"$2-500"\t"$3+500"\t"$4"\t"$5"\t"$6'| \
bedtools intersect -a - -b BRAF+CDKN2A_14_segments.bed -wa -wb|grep -w "E7"|cut -f4|sort|uniq > BRAF_E7+CDKN2A_genes.txt

cat NHM_E7_genes.txt BRAF_E7+CDKN2A_genes.txt BRAF_E7_genes.txt |sort|uniq > E7_genes.txt
########################################################################
more ~/resources/hg38_tss.bed | awk -F'\t' '$1"\t"$2-1000"\t"$3+1000"\t"$4"\t"$5"\t"$6'|grep -wf E7_genes.txt > poised.bed
########################################################################
computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K4me3.bw \
/root/vivek/chip-seq/bw/NHM_H3K27me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K4me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K4me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27me3.bw \
-R poised.bed --referencePoint center \
--sortRegions descend -bs 20 -a 1000 -b 1000 -p max -out poised.mat


plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "TSS" --colorMap Blues \
-m poised.mat --kmeans 3 \
 --samplesLabel "H3K4me3 NHM" "H3K27me3 NHM" "H3K4me3 BRAF" "H3K27me3 BRAF" "H3K4me3 CDKN2A+BRAF" "H3K27me3 CDKN2A+BRAF" \
-out poised.pdf --outFileSortedRegions poised_kmeans.bed
########
plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "TSS" --colorMap Blues Reds Blues Reds Blues Reds \
-m poised.mat --kmeans 4 --zMin 0 0 0 0 0 0 --zMax 1.7 1.2 1.7 1.2 1.7 1.2 \
 --samplesLabel "H3K4me3 NHM" "H3K27me3 NHM" "H3K4me3 BRAF" "H3K27me3 BRAF" "H3K4me3 CDKN2A+BRAF" "H3K27me3 CDKN2A+BRAF" \
-out poised_kmeans_zmet.pdf --outFileSortedRegions poised_kmeans_zmet.bed

plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "TSS" --colorMap Blues Reds Blues Reds Blues Reds \
-m poised.mat --zMin 0 0 0 0 0 0 --zMax 1.7 1.2 1.7 1.2 1.7 1.2 --sortUsingSamples 5 \
 --samplesLabel "H3K4me3 NHM" "H3K27me3 NHM" "H3K4me3 BRAF" "H3K27me3 BRAF" "H3K4me3 CDKN2A+BRAF" "H3K27me3 CDKN2A+BRAF" \
-out poised_kmeans_nok.pdf --outFileSortedRegions poised_kmeans_nok.bed
########################################################################
computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K4me3.bw \
/root/vivek/chip-seq/bw/NHM_H3K27me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K4me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K4me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K4me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27me3.bw \
-R poised.bed --referencePoint center \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out poised_5k.mat


plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "TSS" --colorMap Blues Reds Blues Reds Blues Reds Blues Reds \
-m poised_5k.mat --kmeans 4 --zMin 0 0 0 0 0 0 0 0 --zMax 1.7 1.2 1.7 1.2 1.7 1.2 1.7 1.2 \
--samplesLabel "H3K4me3 NHM" "H3K27me3 NHM" "H3K4me3 BRAF" "H3K27me3 BRAF" "H3K4me3 CDKN2A" "H3K27me3 CDKN2A" "H3K4me3 CDKN2A+BRAF" "H3K27me3 CDKN2A+BRAF" \
-out poised_kmeans_zmet_3k.pdf --outFileSortedRegions poised_kmeans_zmet_5k.bed
#
##################################################################################
##################################################################################
java -mx22000M -jar /root/myPrograms/ChromHMM/ChromHMM.jar BinarizeBam \
/root/resources/hg38.chrom.sizes \
/root/vivek/chip-seq/bam/ \
vivek_nhm_full_input.matrix.txt \
binarizedBAM_full

java -mx22000M -jar /root/myPrograms/ChromHMM/ChromHMM.jar LearnModel -p 0 
/root/vivek/chip-seq/chromHMM/binarizedBAM_full \
/root/vivek/chip-seq/chromHMM/LearnModel_full \
13 \
hg38
######
#
#
