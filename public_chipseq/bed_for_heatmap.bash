more NHM\ _VS_\ BRAF_CDKN2A\ _differentially_expressed_genes.csv|perl -pe 's/\,/\t/g'|perl -pe 's/\"//g'|cut -f1,3| \
grep -v "log2FoldChange" |awk -F"\t" '{if($2>0){print $1}}' > up_NHM_BRAF_CDKN2A.txt
more NHM\ _VS_\ BRAF_CDKN2A\ _differentially_expressed_genes.csv|perl -pe 's/\,/\t/g'|perl -pe 's/\"//g'|cut -f1,3| \
grep -v "log2FoldChange" |awk -F"\t" '{if($2<0){print $1}}' > dw_NHM_BRAF_CDKN2A.txt

more NHM\ _VS_\ BRAF\ _differentially_expressed_genes.csv |perl -pe 's/\,/\t/g'|perl -pe 's/\"//g'|cut -f1,3| \
grep -v "log2FoldChange"|awk -F"\t" '{if($2>0){print $1}}' > up_NHM_BRAF.txt
more NHM\ _VS_\ BRAF\ _differentially_expressed_genes.csv |perl -pe 's/\,/\t/g'|perl -pe 's/\"//g'|cut -f1,3| \
grep -v "log2FoldChange"|awk -F"\t" '{if($2<0){print $1}}' > dw_NHM_BRAF.txt

more NHM\ _VS_\ CDKN2A\ _differentially_expressed_genes.csv |perl -pe 's/\,/\t/g'|perl -pe 's/\"//g'|cut -f1,3| \
grep -v "log2FoldChange"|awk -F"\t" '{if($2>0){print $1}}' > up_NHM_CDKN2A.txt
more NHM\ _VS_\ CDKN2A\ _differentially_expressed_genes.csv |perl -pe 's/\,/\t/g'|perl -pe 's/\"//g'|cut -f1,3| \
grep -v "log2FoldChange"|awk -F"\t" '{if($2<0){print $1}}' > dw_NHM_CDKN2A.txt
##############################################################################################################################
more /root/resources/hg38_tss.bed|grep -wf up_NHM_BRAF_CDKN2A.txt|grep -v "\-\AS"|grep -v "\-IT" > NHM_BRAF_CDKN2A.bed
echo "#NHM" >> NHM_BRAF_CDKN2A.bed
more /root/resources/hg38_tss.bed|grep -wf dw_NHM_BRAF_CDKN2A.txt|grep -v "\-\AS"|grep -v "\-IT" >> NHM_BRAF_CDKN2A.bed
echo "#CDKN2A" >> NHM_BRAF_CDKN2A.bed
#
more /root/resources/hg38_tss.bed|grep -wf up_NHM_BRAF.txt|grep -v "\-\AS"|grep -v "\-IT" > NHM_BRAF.bed
echo "#NHM" >> NHM_BRAF.bed
more /root/resources/hg38_tss.bed|grep -wf dw_NHM_BRAF.txt|grep -v "\-\AS"|grep -v "\-IT" >> NHM_BRAF.bed
echo "#BRAF" >> NHM_BRAF.bed
#
more /root/resources/hg38_tss.bed|grep -wf up_NHM_CDKN2A.txt|grep -v "\-\AS"|grep -v "\-IT" > NHM_CDKN2A.bed
echo "#NHM" >> NHM_CDKN2A.bed
more /root/resources/hg38_tss.bed|grep -wf dw_NHM_CDKN2A.txt|grep -v "\-\AS"|grep -v "\-IT" >> NHM_CDKN2A.bed
echo "#CDKN2A" >> NHM_CDKN2A.bed

##############################################################################################################################

computeMatrix reference-point \
-S \
/home/roberto/deepa/h3k9me3/bw/C_H3.bw \
/home/roberto/deepa/h3k9me3/bw/K_H3.bw \
/home/roberto/deepa/h3k9me3/bw/C_k9me3.bw \
/home/roberto/deepa/h3k9me3/bw/K_k9me3.bw \
-R /home/roberto/deepa/novogene/deseq2/siC_siK_tss.bed --referencePoint center \
--sortRegions descend -bs 20 -a 2000 -b 2000 -p 40 -out tss_siC_vs_siK_h3k9me3_h3.mat

plotHeatmap --xAxisLabel "" --refPointLabel "TSS" --colorMap Greens Greens Reds Reds \
-m tss_siC_vs_siK_h3k9me3_h3.mat \
--samplesLabel "siControl H3" "siTIP60 H3" "siControl H3K9me3" "siTIP60 H3K9me3" \
--regionsLabel "Up-Reg Genes" "Down-Reg Genes" --zMax 30 \
-out tss_siC_vs_siK_h3k9me3_h3.pdf

