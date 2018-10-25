# high quality peakcalls
more NHM_H3K4me3_peaks.broadPeak|awk -F"\t" '{if($9>40){print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6}}' > NHM_H3K4me3_40.broadPeak
more NHM_H3K27me3_peaks.broadPeak|awk -F"\t" '{if($9>40){print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6}}' > NHM_H3K27me3_40.broadPeak
more NHM_H3K9me3_peaks.broadPeak|awk -F"\t" '{if($9>40){print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6}}' > NHM_H3K9me3_40.broadPeak

more BRAF_H3K4me3_peaks.broadPeak|awk -F"\t" '{if($9>40){print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6}}' > BRAF_H3K4me3_40.broadPeak
more BRAF_H3K27me3_peaks.broadPeak|awk -F"\t" '{if($9>40){print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6}}' > BRAF_H3K27me3_40.broadPeak
more BRAF_H3K9me3_peaks.broadPeak|awk -F"\t" '{if($9>40){print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6}}' > BRAF_H3K9me3_40.broadPeak

more CDKN2A_H3K4me3_peaks.broadPeak|awk -F"\t" '{if($9>40){print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6}}' > CDKN2A_H3K4me3_40.broadPeak
more CDKN2A_H3K27me3_peaks.broadPeak|awk -F"\t" '{if($9>40){print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6}}' > CDKN2A_H3K27me3_40.broadPeak
more CDKN2A_H3K9me3_peaks.broadPeak|awk -F"\t" '{if($9>40){print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6}}' > CDKN2A_H3K9me3_40.broadPeak

more CDKN2A+BRAF_H3K4me3_peaks.broadPeak|awk -F"\t" '{if($9>40){print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6}}' > CDKN2A+BRAF_H3K4me3_40.broadPeak
more CDKN2A+BRAF_H3K27me3_peaks.broadPeak|awk -F"\t" '{if($9>40){print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6}}' > CDKN2A+BRAF_H3K27me3_40.broadPeak
more CDKN2A+BRAF_H3K9me3_peaks.broadPeak|awk -F"\t" '{if($9>40){print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6}}' > CDKN2A+BRAF_H3K9me3_40.broadPeak

#############################################
multiIntersectBed -i BRAF_H3K27ac_40_noTSS.bed CDKN2A+BRAF_H3K27ac_40_noTSS.bed CDKN2A_H3K27ac_40_noTSS.bed NHM_H3K27ac_40_noTSS.bed -names N B C BC > ../chromDiff_naive/H3K27ac_multiIntersect.bed

more H3K27ac_multiIntersect.bed |cut -f1-5|grep -w "1"|grep -w "N" > NHM_enhancers.bed
more H3K27ac_multiIntersect.bed |cut -f1-5|grep -w "1"|grep -w "B" > BRAF_enhancers.bed
more H3K27ac_multiIntersect.bed |cut -f1-5|grep -w "1"|grep -w "C" > CDKN2A_enhancers.bed
more H3K27ac_multiIntersect.bed |cut -f1-5|grep -w "1"|grep -w "BC" > BC_enhancers.bed

bedtools intersect -a NHM_enhancers.bed -b ../macs2/NHM_H3K27me3_40.broadPeak ../macs2/NHM_H3K4me3_40.broadPeak ../macs2/NHM_H3K9me3_40.broadPeak ~/resources/hg38.blacklist.bed -v > NHM_enhancer_filtered.bed

bedtools intersect -a BRAF_enhancers.bed -b ../macs2/BRAF_H3K27me3_40.broadPeak ../macs2/BRAF_H3K4me3_40.broadPeak ../macs2/BRAF_H3K9me3_40.broadPeak ~/resources/hg38.blacklist.bed -v > BRAF_enhancers_filtered.bed

bedtools intersect -a CDKN2A_enhancers.bed -b ../macs2/CDKN2A_H3K27me3_40.broadPeak ../macs2/CDKN2A_H3K4me3_40.broadPeak ../macs2/CDKN2A_H3K9me3_40.broadPeak ~/resources/hg38.blacklist.bed -v > CDKN2A_enhancers_filtered.bed

bedtools intersect -a BC_enhancers.bed -b ../macs2/CDKN2A+BRAF_H3K27me3_40.broadPeak ../macs2/CDKN2A+BRAF_H3K4me3_40.broadPeak ../macs2/CDKN2A+BRAF_H3K9me3_40.broadPeak ~/resources/hg38.blacklist.bed -v > BC_enhancers_filtered.bed

#############################################
cat NHM_enhancer_filtered.bed > ENHANCER_STRONG_only.bed
echo "#NHM" >> ENHANCER_STRONG_only.bed
cat BRAF_enhancers_filtered.bed >> ENHANCER_STRONG_only.bed
echo "#BRAF" >> ENHANCER_STRONG_only.bed
cat CDKN2A_enhancers_filtered.bed >> ENHANCER_STRONG_only.bed
echo "#CDKN2A" >> ENHANCER_STRONG_only.bed
cat BC_enhancers_filtered.bed >> ENHANCER_STRONG_only.bed
echo "#CD" >> ENHANCER_STRONG_only.bed
#
computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K27ac.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27ac.bw \
-R ENHANCER_STRONG_only.bed --referencePoint center \
--sortRegions descend -bs 20 -a 3000 -b 3000 -p max -out ENHANCER_STRONG_only.mat

plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "Enhancer" --colorMap Blues \
-m ENHANCER_STRONG_only.mat \
 --samplesLabel "NHM" "BRAF" "CDKN2A" "CDKN2A+BRAF" \
-out ENHANCER_STRONG_only.pdf
#############################################
