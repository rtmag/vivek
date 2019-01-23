bamToBed -i bam/CDKN2A+BRAF_H3K4me3_rmdup.bam > bed/CDKN2A+BRAF_H3K4me3.bed &
bamToBed -i bam/NHM_H3K4me3_rmdup.bam > bed/NHM_H3K4me3.bed &


diffReps.pl --treatment ../bed/CDKN2A+BRAF_H3K4me3.bed \
--control ../bed/NHM_H3K4me3.bed \
--meth gt --chrlen ~/resources/hg38.chrom.sizes --report /root/vivek/chip-seq/diffreps/H3K4me3_CDKN2A+BRAF_vs_NHM --nproc 60 --noanno --nohs
####
# RPROACH
more hg38_tss.bed|awk -F"\t" '{
       if($2-1000<1){print $1"\t"1"\t"$3+1000"\t"$4"\t"$5"\t"$6} \
       if($2-1000>1){print $1"\t"$2-1000"\t"$3+1000"\t"$4"\t"$5"\t"$6} \
       }' > hg38_tss_2kb.bed

#merged beds


cat NHM_H3K4me3_peaks.broadPeak CDKN2A+BRAF_H3K4me3_peaks.broadPeak | \
sort -k1,1 -k2,2n|bedtools merge -i - > H3K4me3_merge.bed

cat NHM_H3K27me3_peaks.broadPeak CDKN2A+BRAF_H3K27me3_peaks.broadPeak | \
sort -k1,1 -k2,2n|bedtools merge -i - > H3K27me3_merge.bed

cat NHM_H3K4me3_peaks.broadPeak CDKN2A+BRAF_H3K4me3_peaks.broadPeak|sort -k1,1 -k2,2n|bedtools merge -i -| \
intersectBed -a - -b hg38_tss_2kb.bed -wa -wb|cut -f1,2,3,7,8,9|intersectBed -a - -b H3K27me3_merge.bed -wa|sort|uniq >H3K4me3_premed.bed

cat NHM_H3K27me3_peaks.broadPeak CDKN2A+BRAF_H3K27me3_peaks.broadPeak|sort -k1,1 -k2,2n|bedtools merge -i -| \
intersectBed -a - -b hg38_tss_2kb.bed -wa -wb|cut -f1,2,3,7,8,9|intersectBed -a - -b H3K4me3_merge.bed -wa|sort|uniq > H3K27me3_premed.bed
#
k4 = read.table("H3K4me3_premed.bed",sep="\t",header=F)
k27 = read.table("H3K27me3_premed.bed",sep="\t",header=F)

write.table(k4[k4[,4] %in% k27[,4],],"k4_intk27.bed",quote=F,row.names=F,col.names=F,sep="\t")
write.table(k27[k27[,4] %in% k4[,4],],"k27_intk4.bed",quote=F,row.names=F,col.names=F,sep="\t")
