library(ComplexHeatmap)
options(scipen=999)
library(graphics)
library(gplots)
library(RColorBrewer)

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
        
        
        
show_row_names = FALSE,show_column_names = FALSE,name = "Expression",row_dend_reorder = T, column_dend_reorder = F,
column_title="Freije Patients", column_title_side = "bottom", row_title="Gene Signature", row_title_side = "right",
bottom_annotation = column_ha, right_annotation = row_ha,
        clustering_distance_columns = "pearson",column_km = 3, column_km_repeats = 100,
        clustering_distance_rows = "pearson",row_split =track)


ht1 + ht2
