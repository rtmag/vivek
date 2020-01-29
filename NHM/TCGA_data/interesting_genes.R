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
           
pator <- read.table("order_patient.txt")
pator<- as.character(pator[,1])
pator<-gsub("-",".",pator)
harmonized_lab <-gsub("\\.\\d\\d","",colnames(exp_sig_h))
           
ix <- match(pator,harmonized_lab)
exp_sig_h <- exp_sig_h[,ix]
mut_sig_h <- mut_sig_h[ix,]
cna_sig_h <- cna_sig_h[,ix]

# categorize
cna_sig_h[cna_sig_h==(-1)] <- (0)
cna_sig_h[cna_sig_h==1] <- 0


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
                                         CDKN2A_CNA = c("-2" = "blue","0" = "white", "2" = "green"),
                                         CDK4_CNA = c("-2" = "blue","0" = "white", "2" = "green"),
                                         RB1_CNA = c("-2" = "blue","0" = "white", "2" = "green"),
                                         EZH2_CNA = c("-2" = "blue","0" = "white", "2" = "green"),
                                         ARID2_CNA = c("-2" = "blue","0" = "white", "2" = "green")
                                        ),
                             gp = gpar(col = "black",lwd=.1)
                           )
                                        
                                        
pdf("TCGA_SKCM_epiGenes.pdf",height=4)
Heatmap(exp_sig_h,
show_row_names = TRUE,show_column_names = FALSE,name = "Expression",
column_title="SKCM Patients", column_title_side = "bottom",cluster_columns=F,cluster_rows=F,
top_annotation = column_ha)
dev.off()
