# Mut sampleName
info<-read.csv("/root/TCGA/Rnbeads/SKCM/SKCM_TP53_mutation_info_withNormal.csv",header=T)
out <- strsplit(as.character(info[,1]),"-")
out <-do.call(rbind, out)
out <- out[,1:4]
out[,4] <- gsub("\\w$","",out[,4],perl=TRUE)
out<-apply(out,1,function(x)paste(x,collapse="."))
           
# mutation
mut = read.csv("/root/TCGA/Rnbeads/SKCM/SKCM_mutation_matrix_withNormal.csv",header=TRUE)
mut_sig<-mut[,which(colnames(mut) %in% c("CDKN2A","CDK4","RB1","EZH2","ARID2"))]
rownames(mut_sig)<-out

# expression
exp <- read.table("/root/TCGA/panCancer_2018/skcm/data_RNA_Seq_v2_mRNA_median_Zscores.txt",header=TRUE,sep='\t')

exp_sig<-exp[
  exp[,1] %in% c("CDKN2A","CDK4","RB1","EZH2","ARID2"),
  3:dim(exp)[2]]

rownames(exp_sig) <- exp[exp[,1] %in% c("CDKN2A","CDK4","RB1","EZH2","ARID2"),1]

# CNV
cna <- read.table("/root/TCGA/panCancer_2018/skcm/data_CNA.txt",header=TRUE,sep="\t")
cna_sig<-cna[
  cna[,1] %in% c("CDKN2A","CDK4","RB1","EZH2","ARID2"),
  3:dim(cna)[2]]

rownames(cna_sig) <- cna[cna[,1] %in% c("CDKN2A","CDK4","RB1","EZH2","ARID2"),1]

# Harmonization
mut_sig_h <- mut_sig[rownames(mut_sig) %in% colnames(exp_sig),]          
mut_sig_h <- mut_sig_h[rownames(mut_sig_h) %in% colnames(cna_sig),]
           
# reorder
ix <- match(rownames(mut_sig_h),colnames(exp_sig))
exp_sig_h <- exp_sig[,ix[!is.na(ix)]]
           
ix <- match(rownames(mut_sig_h),colnames(cna_sig))
cna_sig_h <- cna_sig[,ix[!is.na(ix)]]

colnames(exp_sig_h) == colnames(cna_sig_h)
rownames(mut_sig_h) == colnames(cna_sig_h)
rownames(mut_sig_h) == colnames(exp_sig_h)

# categorize
cna_sig_h[cna_sig_h==(-2)] <- (-1)
cna_sig_h[cna_sig_h==2] <- 1


library(ComplexHeatmap)
options(scipen=999)
library(graphics)
library(gplots)
library(factoextra)
library(RColorBrewer)
colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(9))
options(bitmapType="cairo")

column_ha = HeatmapAnnotation(CDKN2A_Mut = as.character(mut_sig_h$CDKN2A),
                              CDK4_Mut = as.character(mut_sig_h$CDK4),
                              RB1_Mut = as.character(mut_sig_h$RB1),
                              EZH2_Mut = as.character(mut_sig_h$EZH2),
                              ARID2_Mut = as.character(mut_sig_h$ARID2),
                              CDKN2A_CNA = as.character(cna_sig_h[2,]),
                              CDK4_CNA = as.character(cna_sig_h[4,]),
                              RB1_CNA = as.character(cna_sig_h[5,]),
                              EZH2_CNA = as.character(cna_sig_h[1,]),
                              ARID2_CNA = as.character(cna_sig_h[3,]),
                              col = list(CDKN2A_Mut = c("0" = "white", "1" = "red"),
                                         CDK4_Mut = c("0" = "white", "1" = "red"),
                                         RB1_Mut = c("0" = "white", "1" = "red"),
                                         EZH2_Mut = c("0" = "white", "1" = "red"),
                                         ARID2_Mut = c("0" = "white", "1" = "red"),
                                         CDKN2A_CNA = c("-1" = "blue","0" = "white", "1" = "green"),
                                         CDK4_CNA = c("-1" = "blue","0" = "white", "1" = "green"),
                                         RB1_CNA = c("-1" = "blue","0" = "white", "1" = "green"),
                                         EZH2_CNA = c("-1" = "blue","0" = "white", "1" = "green"),
                                         ARID2_CNA = c("-1" = "blue","0" = "white", "1" = "green")
                                        ))
pdf("TCGA_SKCM_epiGenes.pdf")
Heatmap(exp_sig,
show_row_names = TRUE,show_column_names = FALSE,name = "Expression",row_dend_reorder = T, column_dend_reorder = T,
column_title="SKCM Patients", column_title_side = "bottom", row_title="", row_title_side = "right",
bottom_annotation = column_ha,
        clustering_distance_columns = "pearson",
        clustering_distance_rows = "pearson")
dev.off()
