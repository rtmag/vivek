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
      
