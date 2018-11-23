
~/myPrograms/sra-tools/sratoolkit.2.9.0-centos_linux64/bin/fastq-dump --split-files -Z SRR191355 > SRR191355.fastq 

trim_galore --illumina -q 20 --fastqc -o ./ SRR191355.fastq 

STAR --genomeDir /root/resources/hg38_noanno/ \
--runThreadN 60 \
--alignIntronMax 1 \
--alignEndsType EndToEnd \
--readFilesIn SRR191355_trimmed.fq \
--outSAMtype BAM SortedByCoordinate \
--outFileNamePrefix crest_

java -jar /root/myPrograms/picard/build/libs/picard.jar MarkDuplicates REMOVE_DUPLICATES=true \
I=crest_Aligned.sortedByCoord.out.bam \
O=crest_rmdup.bam \
M=crest_rmdup.mfile 

samtools index crest_rmdup.bam 

bamCoverage -p max -e 200 -bs 1 --normalizeUsing CPM -b crest_rmdup.bam -o crest.bw
#####
multiBigwigSummary bins -b \
/root/vivek/chip-seq/bw/NHM_H3K27ac.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27ac.bw \
crest.bw \
-p max -bs 1000 -o H3K27ac_summary.npz

plotPCA -in H3K27ac_summary.npz \
-o PCA_H3K27ac_summary.pdf \
-T ""

plotCorrelation -in H3K27ac_summary.npz \
--corMethod spearman --skipZeros \
--plotTitle "" \
--whatToPlot heatmap --colorMap RdYlBu --plotNumbers \
-o heatmap_SpearmanCorr_H3K27ac_summary.pdf

plotCorrelation \
-in H3K27ac_summary.npz \
--corMethod pearson --skipZeros \
--plotTitle "" \
--whatToPlot heatmap --colorMap RdYlBu --plotNumbers \
-o heatmap_pearsonCorr_H3K27ac_summary.pdf
###

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K27ac.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27ac.bw \
/root/vivek/chip-seq/crest/crest.bw \
-R /root/vivek/chip-seq/diffreps/BRAF_vs_NHM_DIFF_h3k27ac_200_fc1.bed \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out CREST_DIFF_H3K27ac_comparison.mat --referencePoint center

plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "H3K27ac" --colorMap Blues \
-m CREST_DIFF_H3K27ac_comparison.mat \
 --samplesLabel "NHM" "BRAF" "CDKN2A" "CDKN2A+BRAF" "CREST" \
-out CREST_DIFF_H3K27ac_comparison.pdf 
#######
