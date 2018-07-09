

############################################################################################
Rscript /root/myPrograms/epicseg.R getcounts \
-m H3K27ac:/root/vivek/chip-seq/bam/BRAF_H3K27ac_rmdup.bam \
-m H3K27me3:/root/vivek/chip-seq/bam/BRAF_H3K27me3_rmdup.bam \
-m H3K4me3:/root/vivek/chip-seq/bam/BRAF_H3K4me3_rmdup.bam \
-m H3K9me3:/root/vivek/chip-seq/bam/BRAF_H3K9me3_rmdup.bam \
--shift 100 -r /root/HCT116_histone_modification_Quy/epicseg/hg38_normal.bed --binsize 200 -n 60 \
-t /root/vivek/chip-seq/epicseg/BRAF_counts.rda

Rscript /root/myPrograms/epicseg.R getcounts \
-m H3K27ac:/root/vivek/chip-seq/bam/CDKN2A+BRAF_H3K27ac_rmdup.bam \
-m H3K27me3:/root/vivek/chip-seq/bam/CDKN2A+BRAF_H3K27me3_rmdup.bam \
-m H3K4me3:/root/vivek/chip-seq/bam/CDKN2A+BRAF_H3K4me3_rmdup.bam \
-m H3K9me3:/root/vivek/chip-seq/bam/CDKN2A+BRAF_H3K9me3_rmdup.bam \
--shift 100 -r /root/HCT116_histone_modification_Quy/epicseg/hg38_normal.bed --binsize 200 -n 60 \
-t /root/vivek/chip-seq/epicseg/CDKN2A+BRAF_counts.rda

Rscript /root/myPrograms/epicseg.R getcounts \
-m H3K27ac:/root/vivek/chip-seq/bam/CDKN2A_H3K27ac_rmdup.bam \
-m H3K27me3:/root/vivek/chip-seq/bam/CDKN2A_H3K27me3_rmdup.bam \
-m H3K4me3:/root/vivek/chip-seq/bam/CDKN2A_H3K4me3_rmdup.bam \
-m H3K9me3:/root/vivek/chip-seq/bam/CDKN2A_H3K9me3_rmdup.bam \
--shift 100 -r /root/HCT116_histone_modification_Quy/epicseg/hg38_normal.bed --binsize 200 -n 60 \
-t /root/vivek/chip-seq/epicseg/CDKN2A_counts.rda

Rscript /root/myPrograms/epicseg.R getcounts \
-m H3K27ac:/root/vivek/chip-seq/bam/NHM_H3K27ac_rmdup.bam \
-m H3K27me3:/root/vivek/chip-seq/bam/NHM_H3K27me3_rmdup.bam \
-m H3K4me3:/root/vivek/chip-seq/bam/NHM_H3K4me3_rmdup.bam \
-m H3K9me3:/root/vivek/chip-seq/bam/NHM_H3K9me3_rmdup.bam \
--shift 100 -r /root/HCT116_histone_modification_Quy/epicseg/hg38_normal.bed --binsize 200 -n 60 \
-t /root/vivek/chip-seq/epicseg/NHM_counts.rda
############################################################################################
############################################################################################
# Normalize
Rscript /root/myPrograms/epicseg.R normalizecounts -n 60 -c BRAF_counts.rda -c CDKN2A_counts.rda -c CDKN2A+BRAF_counts.rda -c NHM_counts.rda
Rscript /root/myPrograms/epicseg.R normalizecounts -c CDKN2A_counts.rda -c NHM_counts.rda
Rscript /root/myPrograms/epicseg.R normalizecounts -c CDKN2A+BRAF_counts.rda -c NHM_counts.rda
############################################################################################
############################################################################################
# Segment
Rscript /root/myPrograms/epicseg.R segment \
                  -c BRAF:/root/vivek/chip-seq/epicseg/BRAF_counts_norm.rda \
                  -c NHM:/root/vivek/chip-seq/epicseg/NHM_counts_norm.rda \
                  -r /root/vivek/chip-seq/epicseg/BRAF_counts_refined_regions.bed \
                  -n 6 --nthreads 60 --outdir BRAF_NHM --prefix BRAF_NHM_ --annot genes:/root/resources/hg38_genes.bed

Rscript /root/myPrograms/epicseg.R segment \
                  -c CDKN2A:/root/vivek/chip-seq/epicseg/CDKN2A_counts_norm.rda \
                  -c NHM:/root/vivek/chip-seq/epicseg/NHM_counts_norm.rda \
                  -r /root/vivek/chip-seq/epicseg/BRAF_counts_refined_regions.bed \
                  -n 6 --nthreads 60 --outdir CDKN2A_NHM --prefix CDKN2A_NHM_ --annot genes:/root/resources/hg38_genes.bed

Rscript /root/myPrograms/epicseg.R segment \
                  -c CDKN2A+BRAF:/root/vivek/chip-seq/epicseg/CDKN2A+BRAF_counts_norm.rda \
                  -c NHM:/root/vivek/chip-seq/epicseg/NHM_counts_norm.rda \
                  -r /root/vivek/chip-seq/epicseg/BRAF_counts_refined_regions.bed \
                  -n 6 --nthreads 60 --outdir CDKN2A+BRAF_NHM --prefix CDKN2A+BRAF_NHM_ --annot genes:/root/resources/hg38_genes.bed
############################################################################################
############################################################################################

# Segment MACBOOK
epicseg segment \
                  -c BRAF:BRAF_counts_norm.rda \
                  -c NHM:NHM_counts_norm.rda \
                  -r BRAF_counts_refined_regions.bed \
                  -n 6 --nthreads 60 --outdir BRAF_NHM --prefix BRAF_NHM_ --annot genes:hg38_genes.bed

epicseg segment \
                  -c CDKN2A:CDKN2A_counts_norm.rda \
                  -c NHM:NHM_counts_norm.rda \
                  -r BRAF_counts_refined_regions.bed \
                  -n 6 --nthreads 60 --outdir CDKN2A_NHM --prefix CDKN2A_NHM_ --annot genes:hg38_genes.bed

epicseg segment \
                  -c CDKN2A+BRAF:CDKN2A+BRAF_counts_norm.rda \
                  -c NHM:NHM_counts_norm.rda \
                  -r BRAF_counts_refined_regions.bed \
                  -n 6 --nthreads 60 --outdir CDKN2A+BRAF_NHM --prefix CDKN2A+BRAF_NHM_ --annot genes:hg38_genes.bed

 





