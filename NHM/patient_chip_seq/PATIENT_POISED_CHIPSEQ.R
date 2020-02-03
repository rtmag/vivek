library(ComplexHeatmap)
options(scipen=999)
library(graphics)
library(gplots)
library(RColorBrewer)
library(circlize)
options(bitmapType="cairo")

# #cluster_1:556	cluster_2:438	cluster_3:1180


fresh_k27 <- read.table(pipe("tail -n +4 patient_fresh_H3K27me3.txt"),sep="\t")

fresh_k27_means <- cbind(rowMeans(fresh_k27[,1:2]),
      rowMeans(fresh_k27[,3:4]),
      rowMeans(fresh_k27[,5:6]),
      rowMeans(fresh_k27[,7:8]),
      rowMeans(fresh_k27[,9:10]),
      rowMeans(fresh_k27[,11:12]),
      rowMeans(fresh_k27[,13:14]),
      rowMeans(fresh_k27[,15:16]),
      rowMeans(fresh_k27[,17:18]),
      rowMeans(fresh_k27[,19:20]),
      rowMeans(fresh_k27[,21:22]),
      rowMeans(fresh_k27[,23:24]),
      rowMeans(fresh_k27[,25:26]),
      rowMeans(fresh_k27[,27:28]),
      rowMeans(fresh_k27[,29:30]),
      rowMeans(fresh_k27[,31:32]),
      rowMeans(fresh_k27[,33:34]),
      rowMeans(fresh_k27[,35:36]),
      rowMeans(fresh_k27[,37:38]),
      rowMeans(fresh_k27[,39:40])
      )
      

Heatmap(fresh_k27_means, row_split = c( rep("c1",556), rep("c2",438), rep("c3",1180) ) ,
        show_row_names = FALSE,show_column_names = FALSE, 
        column_title="H3K27me3 Patients", 
        cluster_columns=F,cluster_rows=F)
        
######################
fresh_k27 <- read.table(pipe("tail -n +4 patient_fresh_H3K27me3_bs20_5k.txt"),sep="\t")

col_fun = colorRamp2(c(0, 15), c("white", "red"))

pdf("fresh_k27_test.pdf")
Heatmap(fresh_k27, row_split = c( rep("Cluster1",556), rep("Cluster2",438), rep("Cluster3",1180) ) ,
        show_row_names = FALSE,show_column_names = FALSE, 
        column_title="H3K27me3 Patients", col = col_fun,
        cluster_columns=F,cluster_rows=F)
dev.off()

pdf("fresh_k27_test.pdf")
Heatmap(fresh_k27, split = c( rep("Cluster1",556), rep("Cluster2",438), rep("Cluster3",1180) ) ,
        show_row_names = FALSE,show_column_names = FALSE, 
        column_title="H3K27me3 Patients", col = col_fun,
        cluster_columns=F,cluster_rows=F)
dev.off()

fresh_k4 <- read.table(pipe("tail -n +4 patient_fresh_H3K4me3_bs20_5k.txt"),sep="\t")

col_fun = colorRamp2(c(0, 30), c("white", "darkgreen"))

pdf("fresh_k4_test.pdf")
Heatmap(fresh_k4, row_split = c( rep("Cluster1",556), rep("Cluster2",438), rep("Cluster3",1180) ) ,
        show_row_names = FALSE,show_column_names = FALSE, 
        column_title="H3K4me3 Patients", 
        cluster_columns=F,cluster_rows=F)
dev.off()

pdf("fresh_k4_test.pdf")
Heatmap(fresh_k4, split = c( rep("Cluster1",556), rep("Cluster2",438), rep("Cluster3",1180) ) ,
        show_row_names = FALSE,show_column_names = FALSE, 
        column_title="H3K4me3 Patients", col = col_fun,
        cluster_columns=F,cluster_rows=F)
dev.off()
####### fresh

col_fun = colorRamp2(c(0, 30), c("white", "darkgreen"))
ht1 = Heatmap(fresh_k4, split = c( rep("Cluster1",556), rep("Cluster2",438), rep("Cluster3",1180) ) ,
        show_row_names = FALSE,show_column_names = FALSE, 
        column_title="H3K4me3 Patients", col = col_fun,
        cluster_columns=F,cluster_rows=F)

col_fun = colorRamp2(c(0, 30), c("white", "red"))
ht2 = Heatmap(fresh_k27, split = c( rep("Cluster1",556), rep("Cluster2",438), rep("Cluster3",1180) ) ,
        show_row_names = FALSE,show_column_names = FALSE, 
        column_title="H3K27me3 Patients", col = col_fun,
        cluster_columns=F,cluster_rows=F)

pdf("fresh_patients.pdf")
ht1 + ht2
dev.off()


png("fresh_patients.png",width= 7.25,
  height= 7.25,units="in",
  res=1200,pointsize=4)
ht1 + ht2
dev.off()

##### fresh

col_fun = colorRamp2(c(0, 20), c("white", "darkgreen"))
ht1 = Heatmap(fresh_k4, split = c( rep("Cluster1",556), rep("Cluster2",438), rep("Cluster3",1180) ) ,
        show_row_names = FALSE,show_column_names = FALSE, 
        column_title="H3K4me3 Patients", col = col_fun,
        cluster_columns=F,cluster_rows=F)

col_fun = colorRamp2(c(0, 20), c("white", "red"))
ht2 = Heatmap(fresh_k27, split = c( rep("Cluster1",556), rep("Cluster2",438), rep("Cluster3",1180) ) ,
        show_row_names = FALSE,show_column_names = FALSE, 
        column_title="H3K27me3 Patients", col = col_fun,
        cluster_columns=F,cluster_rows=F)

pdf("fresh_patients_max20.pdf")
ht1 + ht2
dev.off()


png("fresh_patients_max20.png",width= 7.25,
  height= 7.25,units="in",
  res=1200,pointsize=4)
ht1 + ht2
dev.off()
##
################################################################################################
##### Stored

stored_k4 <- read.table(pipe("tail -n +4 patient_stored_H3K4me3_bs20_5k.txt"),sep="\t")

col_fun = colorRamp2(c(0, 30), c("white", "darkgreen"))

ht1 = Heatmap(stored_k4, split = c( rep("Cluster1",556), rep("Cluster2",438), rep("Cluster3",1180) ) ,
        show_row_names = FALSE,show_column_names = FALSE, 
        column_title="H3K4me3 Patients", col = col_fun,
        cluster_columns=F,cluster_rows=F)

stored_k27 <- read.table(pipe("tail -n +4 patient_stored_H3K27me3_bs20_5k.txt"),sep="\t")

col_fun = colorRamp2(c(0, 30), c("white", "red"))

ht2 = Heatmap(stored_k27, split = c( rep("Cluster1",556), rep("Cluster2",438), rep("Cluster3",1180) ) ,
        show_row_names = FALSE,show_column_names = FALSE, 
        column_title="H3K27me3 Patients", col = col_fun,
        cluster_columns=F,cluster_rows=F)

pdf("stored_patients.pdf")
ht1 + ht2
dev.off()


png("stored_patients.png",width= 7.25,
  height= 7.25,units="in",
  res=1200,pointsize=4)
ht1 + ht2
dev.off()

##### Stored

stored_k4 <- read.table(pipe("tail -n +4 patient_stored_H3K4me3_bs20_5k.txt"),sep="\t")

col_fun = colorRamp2(c(0, 20), c("white", "darkgreen"))

ht1 = Heatmap(stored_k4, split = c( rep("Cluster1",556), rep("Cluster2",438), rep("Cluster3",1180) ) ,
        show_row_names = FALSE,show_column_names = FALSE, 
        column_title="H3K4me3 Patients", col = col_fun,
        cluster_columns=F,cluster_rows=F)

stored_k27 <- read.table(pipe("tail -n +4 patient_stored_H3K27me3_bs20_5k.txt"),sep="\t")

col_fun = colorRamp2(c(0, 20), c("white", "red"))

ht2 = Heatmap(stored_k27, split = c( rep("Cluster1",556), rep("Cluster2",438), rep("Cluster3",1180) ) ,
        show_row_names = FALSE,show_column_names = FALSE, 
        column_title="H3K27me3 Patients", col = col_fun,
        cluster_columns=F,cluster_rows=F)

pdf("stored_patients_max20.pdf")
ht1 + ht2
dev.off()


png("stored_patients_max20.png",width= 7.25,
  height= 7.25,units="in",
  res=1200,pointsize=4)
ht1 + ht2
dev.off()
