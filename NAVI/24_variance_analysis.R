suppressMessages(library(RnBeads))
library(ComplexHeatmap)
options(scipen=999)
library(gplots)
library(factoextra)
library(RColorBrewer)
colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(9))
options(bitmapType="cairo")
############################################################################################
rnb.set.norm=load.rnb.set("/home/rtm/vivek/navi/EPIC_2nd_batch/RnBeads/RnBeads_normalization/rnb.set.norm.filtered.RData.zip")
beta <- meth(rnb.set.norm,row.names=TRUE)

meth.filtered.centered = readRDS('/home/rtm/vivek/navi/EPIC_2nd_batch/RnBeads/RnBeads_differential/meth.norm.centered.rds')
meth.filtered.centered<-meth.filtered.centered[rownames(meth.filtered.centered) %in% rownames(beta),]

meth.filtered.centered.sd <- apply(meth.filtered.centered,1,sd)
beta.sd <- apply(beta,1,sd)

# 0.5 %
beta.005<-beta[ order(beta.sd,decreasing=TRUE)[1:round(length(beta.sd)*0.005)], ]

column_ha = HeatmapAnnotation(Type = as.character(rnb.set.norm@pheno$Tumor),
                              col = list(Type = c("Melanoma" = "darkred", "Nevi" = "darkblue", "MIS" = "grey") ) )

pdf("SD_heatmap_top_0.05_cpg.pdf")
Heatmap(beta.005,
show_row_names = FALSE,show_column_names = TRUE,name = "Expression",row_dend_reorder = TRUE, column_dend_reorder = TRUE,
column_title="Top 0.5% CpGs with the highest SD", column_title_side = "bottom", row_title="", row_title_side = "right",
top_annotation = column_ha, clustering_distance_columns = "pearson", clustering_distance_rows = "pearson")
dev.off()
# 1%

# 2.5%

# 5%

# 10%

# 20%%
