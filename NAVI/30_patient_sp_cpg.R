B<-readRDS("/Users/wone/CSI/vivek/nevi/beta_48samples.RDS")
rnb.set.filtered=load.rnb.set("/home/rtm/vivek/navi/EPIC_2nd_batch/RnBeads/RnBeads_normalization/rnb.set.norm.filtered.RData.zip")
B<-meth(rnb.set.filtered,row.names=T)

M=log(B/(1-B))
Mstd=(M-apply(M,1,mean))/apply(M,1,sd)

           Type = c("Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi",
                     "Melanoma","MIS","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi",
                    "Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi",
                    "Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi",
                    "Melanoma","Nevi","Nevi","Melanoma","Melanoma","Nevi","Melanoma","Nevi",
                    "Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi")

Mstd.nevi = Mstd[ , Type!="Melanoma" ]
Mstd.melanoma = Mstd[ , Type=="Melanoma" ]

Dstd=(Mstd.nevi - Mstd.melanoma)^2
Stat=apply(Dstd,1,sum)
order.Stat=rev(order(Stat))
chosen.cpgs=order.Stat[1:round(length(order.Stat)*.25)]
tokeep = order.Stat[round(length(order.Stat)*.25):dim(B)[1]]


beta <- B[tokeep,]
beta.sd <- apply(beta,1,sd)

library(ComplexHeatmap)
options(scipen=999)
library(RColorBrewer)
colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(9))
options(bitmapType="cairo")

column_ha = HeatmapAnnotation(Type = as.character(Type),
                              col = list(Type = c("Melanoma" = "red", "Nevi" = "blue", "MIS" = "grey") ) )

# 0.5 %
beta.005<-beta[ order(beta.sd,decreasing=TRUE)[1:round(length(beta.sd)*0.005)], ]

pdf("SD_removed25patientVariance_heatmap_top_0.005_cpg.pdf",width=9)
Heatmap(beta.005,
show_row_names = FALSE,show_column_names = TRUE,name = "Methylation",row_dend_reorder = TRUE, column_dend_reorder = TRUE,
column_title="Top 0.5% CpGs with the highest SD", column_title_side = "bottom", row_title="", row_title_side = "right",
top_annotation = column_ha, clustering_distance_columns = "pearson", clustering_distance_rows = "pearson")
dev.off()


# 1%
beta.005<-beta[ order(beta.sd,decreasing=TRUE)[1:round(length(beta.sd)*0.01)], ]

pdf("SD_removed25patientVariance_heatmap_top_0.01_cpg.pdf",width=9)
Heatmap(beta.005,
show_row_names = FALSE,show_column_names = TRUE,name = "Methylation",row_dend_reorder = TRUE, column_dend_reorder = TRUE,
column_title="Top 1% CpGs with the highest SD", column_title_side = "bottom", row_title="", row_title_side = "right",
top_annotation = column_ha, clustering_distance_columns = "pearson", clustering_distance_rows = "pearson")
dev.off()

# 2.5%
beta.005<-beta[ order(beta.sd,decreasing=TRUE)[1:round(length(beta.sd)*0.025)], ]

pdf("SD_removed25patientVariance_heatmap_top_0.025_cpg.pdf",width=9)
Heatmap(beta.005,
show_row_names = FALSE,show_column_names = TRUE,name = "Methylation",row_dend_reorder = TRUE, column_dend_reorder = TRUE,
column_title="Top 2.5% CpGs with the highest SD", column_title_side = "bottom", row_title="", row_title_side = "right",
top_annotation = column_ha, clustering_distance_columns = "pearson", clustering_distance_rows = "pearson")
dev.off()
# 5%
beta.005<-beta[ order(beta.sd,decreasing=TRUE)[1:round(length(beta.sd)*0.05)], ]

pdf("SD_removed25patientVariance_heatmap_top_0.05_cpg.pdf",width=9)
Heatmap(beta.005,
show_row_names = FALSE,show_column_names = TRUE,name = "Methylation",row_dend_reorder = TRUE, column_dend_reorder = TRUE,
column_title="Top 5% CpGs with the highest SD", column_title_side = "bottom", row_title="", row_title_side = "right",
top_annotation = column_ha, clustering_distance_columns = "pearson", clustering_distance_rows = "pearson")
dev.off()
####
