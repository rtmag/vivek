# h1 hg38 chromhmm data downloaded from https://egg2.wustl.edu/roadmap/web_portal/chr_state_learning.html#core_15state
more E003_18_core_K27ac_hg38lift_dense.bed|grep "14_TssBiv" > H1_heSC_poised_TSS.bed


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
-R H1_heSC_poised_TSS.bed --referencePoint center \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out H1_heSC_poised_TSS.mat

plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "H1-PoisedTSS" --colorMap Greens Reds Greens Reds Greens Reds Greens Reds \
-m H1_heSC_poised_TSS.mat --zMin 0 0 0 0 0 0 0 0 --zMax 1.7 1.2 1.7 1.2 1.7 1.2 1.7 1.2 \
--samplesLabel "H3K4me3 NHM" "H3K27me3 NHM" "H3K4me3 NB" "H3K27me3 NB" "H3K4me3 NC" "H3K27me3 NC" "H3K4me3 NBC" "H3K27me3 NBC" \
-out H1_poised_TSS.pdf 
########

more E003_18_core_K27ac_hg38lift_dense.bed|grep "EnhG" > H1_heSC_genic_enhancer.bed

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K27ac.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27ac.bw \
/root/vivek/chip-seq/bw/NHM_H3K4me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K4me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K4me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K4me3.bw \
/root/vivek/chip-seq/bw/NHM_H3K9me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K9me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K9me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K9me3.bw \
/root/vivek/chip-seq/bw/NHM_H3K27me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27me3.bw \
-R H1_heSC_genic_enhancer.bed \
--sortRegions descend --sortUsingSamples 1 4 -bs 20 -a 5000 -b 5000 -p max -out H1_heSC_genic_enhancer_all.mat \
--referencePoint center

plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "H1 GenicEnhancer" \
--colorMap Blues Blues Blues Blues Greens Greens Greens Greens Reds Reds Reds Reds Oranges Oranges Oranges Oranges \
-m H1_heSC_genic_enhancer_all.mat \
 --samplesLabel "NHM" "VE" "KO" "VE+KO" "NHM" "VE" "KO" "VE+KO" "NHM" "VE" "KO" "VE+KO" "NHM" "VE" "KO" "VE+KO" \
-out H1_heSC_genic_enhancer_all.pdf 

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K27ac.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27ac.bw \
-R H1_heSC_genic_enhancer.bed \
--sortRegions descend --sortUsingSamples 1 4 -bs 20 -a 5000 -b 5000 -p max -out H1_heSC_genic_enhancer.mat \
--referencePoint center

plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "H1 GenicEnhancer" \
--colorMap Blues \
-m H1_heSC_genic_enhancer.mat \
 --samplesLabel "NHM" "VE" "KO" "VE+KO" \
-out H1_heSC_genic_enhancer.pdf 
################################################################

more E003_18_core_K27ac_hg38lift_dense.bed|grep "EnhA" > H1_heSC_active_enhancer.bed



computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K27ac.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27ac.bw \
/root/vivek/chip-seq/bw/NHM_H3K4me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K4me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K4me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K4me3.bw \
/root/vivek/chip-seq/bw/NHM_H3K9me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K9me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K9me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K9me3.bw \
/root/vivek/chip-seq/bw/NHM_H3K27me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27me3.bw \
-R H1_heSC_active_enhancer.bed \
--sortRegions descend --sortUsingSamples 1 4 -bs 20 -a 5000 -b 5000 -p max -out H1_heSC_active_enhancer_all.mat \
--referencePoint center

plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "H1 ActiveEnhancer" \
--colorMap Blues Blues Blues Blues Greens Greens Greens Greens Reds Reds Reds Reds Oranges Oranges Oranges Oranges \
-m H1_heSC_active_enhancer_all.mat \
 --samplesLabel "NHM" "VE" "KO" "VE+KO" "NHM" "VE" "KO" "VE+KO" "NHM" "VE" "KO" "VE+KO" "NHM" "VE" "KO" "VE+KO" \
-out H1_heSC_active_enhancer_all.pdf 

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K27ac.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27ac.bw \
-R H1_heSC_active_enhancer.bed \
--sortRegions descend --sortUsingSamples 1 4 -bs 20 -a 5000 -b 5000 -p max -out H1_heSC_active_enhancer.mat \
--referencePoint center

plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "H1 ActiveEnhancer" \
--colorMap Blues \
-m H1_heSC_active_enhancer.mat \
 --samplesLabel "NHM" "VE" "KO" "VE+KO" \
-out H1_heSC_active_enhancer.pdf 


################################################################3

# hNCC enhancer table was downloaded from Epigenomic Annotation of Enhancers Predicts Transcriptional Regulators of Human Neural Crest
# https://www.cell.com/cms/10.1016/j.stem.2012.07.006/attachment/b2e099d7-b344-4d37-b5d1-7fded46195f3/mmc2

# H9_active_enhancer_hg38liftover.bed




computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K27ac.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27ac.bw \
/root/vivek/chip-seq/bw/NHM_H3K4me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K4me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K4me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K4me3.bw \
/root/vivek/chip-seq/bw/NHM_H3K9me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K9me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K9me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K9me3.bw \
/root/vivek/chip-seq/bw/NHM_H3K27me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27me3.bw \
-R H9_active_enhancer_hg38liftover.bed \
--sortRegions descend --sortUsingSamples 1 4 -bs 20 -a 5000 -b 5000 -p max -out H9_active_enhancer_hg38liftover_all.mat \
--referencePoint center

plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "hNCC activeEnhancer" \
--colorMap Blues Blues Blues Blues Greens Greens Greens Greens Reds Reds Reds Reds Oranges Oranges Oranges Oranges \
-m H9_active_enhancer_hg38liftover_all.mat \
 --samplesLabel "NHM" "VE" "KO" "VE+KO" "NHM" "VE" "KO" "VE+KO" "NHM" "VE" "KO" "VE+KO" "NHM" "VE" "KO" "VE+KO" \
-out H9_active_enhancer_hg38liftover_all.pdf 

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K27ac.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27ac.bw \
-R H9_active_enhancer_hg38liftover.bed \
--sortRegions descend --sortUsingSamples 1 4 -bs 20 -a 5000 -b 5000 -p max -out H9_active_enhancer_hg38liftover.mat \
--referencePoint center

plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "hNCC activeEnhancer" \
--colorMap Blues \
-m H9_active_enhancer_hg38liftover.mat \
 --samplesLabel "NHM" "VE" "KO" "VE+KO" \
-out H9_active_enhancer_hg38liftover.pdf 

################################################################

# H9_poised_enhancers_hg38liftover.bed



computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K27ac.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27ac.bw \
/root/vivek/chip-seq/bw/NHM_H3K4me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K4me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K4me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K4me3.bw \
/root/vivek/chip-seq/bw/NHM_H3K9me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K9me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K9me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K9me3.bw \
/root/vivek/chip-seq/bw/NHM_H3K27me3.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27me3.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27me3.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27me3.bw \
-R H9_poised_enhancers_hg38liftover.bed \
--sortRegions descend --sortUsingSamples 1 4 -bs 20 -a 5000 -b 5000 -p max -out H9_poised_enhancers_hg38liftover_all.mat \
--referencePoint center

plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "hNCC poisedEnhancer" \
--colorMap Blues Blues Blues Blues Greens Greens Greens Greens Reds Reds Reds Reds Oranges Oranges Oranges Oranges \
-m H9_poised_enhancers_hg38liftover_all.mat \
 --samplesLabel "NHM" "VE" "KO" "VE+KO" "NHM" "VE" "KO" "VE+KO" "NHM" "VE" "KO" "VE+KO" "NHM" "VE" "KO" "VE+KO" \
-out H9_poised_enhancers_hg38liftover_all.pdf 

computeMatrix reference-point \
-S \
/root/vivek/chip-seq/bw/NHM_H3K27ac.bw \
/root/vivek/chip-seq/bw/BRAF_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A_H3K27ac.bw \
/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27ac.bw \
-R H9_poised_enhancers_hg38liftover.bed \
--sortRegions descend --sortUsingSamples 1 4 -bs 20 -a 5000 -b 5000 -p max -out H9_poised_enhancers_hg38liftover.mat \
--referencePoint center

plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "hNCC poisedEnhancer" \
--colorMap Blues \
-m H9_poised_enhancers_hg38liftover.mat \
 --samplesLabel "NHM" "VE" "KO" "VE+KO" \
-out H9_poised_enhancers_hg38liftover.pdf 

############################################################################################################################
# DNASE
wget https://www.encodeproject.org/files/ENCFF520XMG/@@download/ENCFF520XMG.bigWig

computeMatrix reference-point \
-S \
/root/vivek/NHM/joe_costello/ENCFF520XMG.bigWig \
-R /root/vivek/chip-seq/h3k27ac_diff/CDKN2A+BRAF_vs_NHM_H3K27ac.bed \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out foreskinDNASE_onNHMenhancers.mat --referencePoint center

plotHeatmap --xAxisLabel "" --yAxisLabel "" --refPointLabel "Enhancer" --colorMap Greys \
-m foreskinDNASE_onNHMenhancers.mat \
 --samplesLabel "DNASE-Seq foreskin melanocyte" \
-out foreskinDNASE_onNHMenhancers.pdf 



