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

#meth.filtered.centered = readRDS('/home/rtm/vivek/navi/EPIC_2nd_batch/RnBeads/RnBeads_differential/meth.norm.centered.rds')
#meth.filtered.centered<-meth.filtered.centered[rownames(meth.filtered.centered) %in% rownames(beta),]

#meth.filtered.centered.sd <- apply(meth.filtered.centered,1,sd)
beta.sd <- apply(beta,1,sd)

# 50,000
beta.005<-beta[ order(beta.sd,decreasing=TRUE)[1:50000], ]

column_ha = HeatmapAnnotation(Type = as.character(rnb.set.norm@pheno$Tumor),
                              col = list(Type = c("Melanoma" = "red", "Nevi" = "blue", "MIS" = "grey") ) )

pdf("SD_heatmap_top_50000_cpg.pdf",width=9)
Heatmap(beta.005,
show_row_names = FALSE,show_column_names = TRUE,name = "Methylation",row_dend_reorder = TRUE, column_dend_reorder = TRUE,
column_title="Top 50000 CpGs with the highest SD", column_title_side = "bottom", row_title="", row_title_side = "right",
top_annotation = column_ha, clustering_distance_columns = "pearson", clustering_distance_rows = "pearson")
dev.off()
##############

# 0.5 %
beta.005<-beta[ order(beta.sd,decreasing=TRUE)[1:round(length(beta.sd)*0.005)], ]



column_ha = HeatmapAnnotation(Type = as.character(rnb.set.norm@pheno$Tumor),
                              col = list(Type = c("Melanoma" = "red", "Nevi" = "blue", "MIS" = "grey") ) )

# gotoxy 11

pdf("SD_heatmap_top_0.005_cpg.pdf",width=9)
Heatmap(beta.005,
show_row_names = FALSE,show_column_names = TRUE,name = "Methylation",row_dend_reorder = TRUE, column_dend_reorder = TRUE,
column_title="Top 0.5% CpGs with the highest SD", column_title_side = "bottom", row_title="", row_title_side = "right",
top_annotation = column_ha, clustering_distance_columns = "pearson", clustering_distance_rows = "pearson")
dev.off()

hcw <- hclust(dist(t(beta.005), method = "euclidean"), method = "ward.D2")

pdf("SD_heatmap_top_0.05_cpg_onlyDend.pdf",width=9)
Heatmap(matrix(nc = 48, nr = 0),cluster_columns = hcw,
show_column_names = TRUE,
column_title="Top 0.5% CpGs with the highest SD",top_annotation = column_ha)
dev.off()

# 1%
beta.005<-beta[ order(beta.sd,decreasing=TRUE)[1:round(length(beta.sd)*0.01)], ]

pdf("SD_heatmap_top_0.01_cpg.pdf",width=9)
Heatmap(beta.005,
show_row_names = FALSE,show_column_names = TRUE,name = "Methylation",row_dend_reorder = TRUE, column_dend_reorder = TRUE,
column_title="Top 1% CpGs with the highest SD", column_title_side = "bottom", row_title="", row_title_side = "right",
top_annotation = column_ha, clustering_distance_columns = "pearson", clustering_distance_rows = "pearson")
dev.off()

# 2.5%
beta.005<-beta[ order(beta.sd,decreasing=TRUE)[1:round(length(beta.sd)*0.025)], ]

pdf("SD_heatmap_top_0.025_cpg.pdf",width=9)
Heatmap(beta.005,
show_row_names = FALSE,show_column_names = TRUE,name = "Methylation",row_dend_reorder = TRUE, column_dend_reorder = TRUE,
column_title="Top 2.5% CpGs with the highest SD", column_title_side = "bottom", row_title="", row_title_side = "right",
top_annotation = column_ha, clustering_distance_columns = "pearson", clustering_distance_rows = "pearson")
dev.off()
# 5%
beta.005<-beta[ order(beta.sd,decreasing=TRUE)[1:round(length(beta.sd)*0.05)], ]

pdf("SD_heatmap_top_0.05_cpg.pdf",width=9)
Heatmap(beta.005,
show_row_names = FALSE,show_column_names = TRUE,name = "Methylation",row_dend_reorder = TRUE, column_dend_reorder = TRUE,
column_title="Top 5% CpGs with the highest SD", column_title_side = "bottom", row_title="", row_title_side = "right",
top_annotation = column_ha, clustering_distance_columns = "pearson", clustering_distance_rows = "pearson")
dev.off()

# 7%
beta.005<-beta[ order(beta.sd,decreasing=TRUE)[1:round(length(beta.sd)*0.7)], ]

pdf("SD_heatmap_top_0.07_cpg.pdf",width=9)
Heatmap(beta.005,
show_row_names = FALSE,show_column_names = TRUE,name = "Methylation",row_dend_reorder = TRUE, column_dend_reorder = TRUE,
column_title="Top 7% CpGs with the highest SD", column_title_side = "bottom", row_title="", row_title_side = "right",
top_annotation = column_ha, clustering_distance_columns = "pearson", clustering_distance_rows = "pearson")
dev.off()

# 10% FAIL!
beta.005<-beta[ order(beta.sd,decreasing=TRUE)[1:round(length(beta.sd)*0.1)], ]

pdf("SD_heatmap_top_0.10_cpg.pdf",width=9)
Heatmap(beta.005,
show_row_names = FALSE,show_column_names = TRUE,name = "Methylation",row_dend_reorder = TRUE, column_dend_reorder = TRUE,
column_title="Top 10% CpGs with the highest SD", column_title_side = "bottom", row_title="", row_title_side = "right",
top_annotation = column_ha, clustering_distance_columns = "pearson", clustering_distance_rows = "pearson")
dev.off()


######
# PCA
mvalues <- M(rnb.set.norm, row.names = TRUE)
pca <- prcomp(mvalues, center = TRUE,scale. = TRUE)

track = as.character(rnb.set.norm@pheno$Tumor)
track[track=="Melanoma"]=1
track[track=="Nevi"]=2
track[track=="MIS"]=3

track=as.numeric(track)
colores=c("red","blue","grey")
clab=as.character(colores[track])

sx=summary(pca)

pdf("PCA_Nevi_vs_melanoma_Mvalues.pdf")
plot(pca$rotation[,1],pca$rotation[,2],col=clab,pch=19,
    xlab=paste("PCA1:",round(sx$importance[2,1]*100,digits=1),"%"),ylab=paste("PCA2:",round(sx$importance[2,2]*100,digits=1),"%"))
legend("topright",legend=c("Melanoma","Nevi","MIS"),fill=c("red","blue","grey"), border=T, bty="n" )
dev.off()


meth.filtered.centered = readRDS('meth.filtered.centered.rds')
pca <- prcomp(meth.filtered.centered, center = TRUE,scale. = TRUE)

 Tumor = c("Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi",
                     "Melanoma","MIS","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi",
                    "Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi",
                    "Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi",
                    "Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi",
                    "Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi")
track = as.character(Tumor)
track[track=="Melanoma"]=1
track[track=="Nevi"]=2
track[track=="MIS"]=3

track=as.numeric(track)
colores=c("red","blue","grey")
clab=as.character(colores[track])

sx=summary(pca)

pdf("PCA_Nevi_vs_melanoma_BetaScoresCenteredByPatient.pdf")
plot(pca$rotation[,1],pca$rotation[,2],col=clab,pch=19,
    xlab=paste("PCA1:",round(sx$importance[2,1]*100,digits=1),"%"),ylab=paste("PCA2:",round(sx$importance[2,2]*100,digits=1),"%"))
legend("topright",legend=c("Melanoma","Nevi","MIS"),fill=c("red","blue","grey"), border=T, bty="n" )
dev.off()

pdf("density_distribution_of_Nevi_vand_melanoma_BetaScoresCenteredByPatient.pdf")
plot(density(meth.filtered.centered[,1]),ylim=c(0,40))
for(i in 1:48){ lines(density(meth.filtered.centered[,i]),col=clab[i]) }
dev.off()

#################################################################################################################
#################################################################################################################
#################################################################################################################
# Lack
# VM3,VM4,VM14,VM24,VM27,VM28,VM30
# With mutation information
track = as.character(rnb.set.norm@pheno$Tumor)

BRAF_info = c(
  "REF", # VM1
  "REF", # VM2
  "NA", # VM3
  "NA", # VM4
  "MUT", # VM5
  "MUT", # VM6
  "MUT", # VM7
  "MUT", # VM8
  "MUT", # VM9
  "MUT", # VM10
  "MUT", # VM11
  "MUT", # VM12
  "MUT", # VM13
  "MUT", # VM14
  "REF", # VM15
  "REF", # VM16
  "MUT", # VM17
  "MUT", # VM18
  "MUT", # VM19
  "MUT", # VM20
  "REF", # VM21
  "REF", # VM22
  "MUT", # VM23
  "MUT", # VM24
  "REF", # VM25
  "REF", # VM26
  "NA", # VM27
  "NA", # VM28
  "MUT", # VM29
  "MUT", # VM30
  "REF", # VM31
  "REF", # VM32
  "REF", # VM33
  "REF", # VM34
  "MUT", # VM35
  "MUT", # VM36
  "MUT", # VM37
  "MUT", # VM38
  "MUT", # VM39
  "MUT", # VM40
  "MUT", # VM41
  "MUT", # VM42
  "MUT", # VM43
  "MUT", # VM44
  "MUT", # VM45
  "MUT", # VM46
  "MUT", # VM47
  "MUT") # VM48

NRAS_info = c(
  "REF", # VM1
  "REF", # VM2
  "NA", # VM3
  "NA", # VM4
  "REF", # VM5
  "REF", # VM6
  "MUT", # VM7
  "MUT", # VM8
  "REF", # VM9
  "REF", # VM10
  "REF", # VM11
  "REF", # VM12
  "REF", # VM13
  "REF", # VM14
  "REF", # VM15
  "REF", # VM16
  "REF", # VM17
  "REF", # VM18
  "REF", # VM19
  "REF", # VM20
  "MUT", # VM21
  "MUT", # VM22
  "REF", # VM23
  "REF", # VM24
  "MUT", # VM25
  "MUT", # VM26
  "NA", # VM27
  "NA", # VM28
  "REF", # VM29
  "REF", # VM30
  "MUT", # VM31
  "MUT", # VM32
  "REF", # VM33
  "REF", # VM34
  "REF", # VM35
  "REF", # VM36
  "REF", # VM37
  "REF", # VM38
  "REF", # VM39
  "REF", # VM40
  "REF", # VM41
  "REF", # VM42
  "REF", # VM43
  "REF", # VM44
  "REF", # VM45
  "REF", # VM46
  "REF", # VM47
  "REF") # VM48

NF1_info = c(
  "REF", # VM1
  "REF", # VM2
  "NA", # VM3
  "NA", # VM4
  "REF", # VM5
  "REF", # VM6
  "MUT", # VM7
  "MUT", # VM8
  "MUT", # VM9
  "MUT", # VM10
  "REF", # VM11
  "REF", # VM12
  "REF", # VM13
  "REF", # VM14
  "MUT", # VM15
  "MUT", # VM16
  "REF", # VM17
  "REF", # VM18
  "REF", # VM19
  "REF", # VM20
  "REF", # VM21
  "REF", # VM22
  "MUT", # VM23
  "MUT", # VM24
  "REF", # VM25
  "REF", # VM26
  "NA", # VM27
  "NA", # VM28
  "REF", # VM29
  "REF", # VM30
  "REF", # VM31
  "REF", # VM32
  "REF", # VM33
  "REF", # VM34
  "MUT", # VM35
  "MUT", # VM36
  "REF", # VM37
  "REF", # VM38
  "REF", # VM39
  "REF", # VM40
  "REF", # VM41
  "REF", # VM42
  "MUT", # VM43
  "MUT", # VM44
  "REF", # VM45
  "REF", # VM46
  "REF", # VM47
  "REF") # VM48


column_ha = HeatmapAnnotation(Type = as.character(rnb.set.norm@pheno$Tumor),
                              BRAF = BRAF_info, NRAS = NRAS_info, NF1 = NF1_info,
                              col = list(Type = c("Melanoma" = "red", "Nevi" = "blue", "MIS" = "grey"),
                                         BRAF = c("REF" = "black", "MUT" = "red", "NA" = "grey"),
                                         NRAS = c("REF" = "black", "MUT" = "red", "NA" = "grey"),
                                         NF1 = c("REF" = "black", "MUT" = "red", "NA" = "grey")
                                        ) 
                             )
# go to # gotoxy 11


rnb.set.braf=remove.samples(rnb.set.norm,samples(rnb.set.norm)[BRAF_info!="MUT"])
beta <- meth(rnb.set.braf,row.names=TRUE)
beta.sd <- apply(beta,1,sd)

column_ha = HeatmapAnnotation(Type = as.character(rnb.set.braf@pheno$Tumor),
                              col = list(Type = c("Melanoma" = "red", "Nevi" = "blue", "MIS" = "grey") ) )

# 0.5 %
beta.005<-beta[ order(beta.sd,decreasing=TRUE)[1:round(length(beta.sd)*0.005)], ]

pdf("SD_onlyBRAF_heatmap_top_0.005_cpg.pdf",width=9)
Heatmap(beta.005,
show_row_names = FALSE,show_column_names = TRUE,name = "Methylation",row_dend_reorder = TRUE, column_dend_reorder = TRUE,
column_title="Top 0.5% CpGs with the highest SD", column_title_side = "bottom", row_title="", row_title_side = "right",
top_annotation = column_ha, clustering_distance_columns = "pearson", clustering_distance_rows = "pearson")
dev.off()


# 1%
beta.005<-beta[ order(beta.sd,decreasing=TRUE)[1:round(length(beta.sd)*0.01)], ]

pdf("SD_onlyBRAF_heatmap_top_0.01_cpg.pdf",width=9)
Heatmap(beta.005,
show_row_names = FALSE,show_column_names = TRUE,name = "Methylation",row_dend_reorder = TRUE, column_dend_reorder = TRUE,
column_title="Top 1% CpGs with the highest SD", column_title_side = "bottom", row_title="", row_title_side = "right",
top_annotation = column_ha, clustering_distance_columns = "pearson", clustering_distance_rows = "pearson")
dev.off()

# 2.5%
beta.005<-beta[ order(beta.sd,decreasing=TRUE)[1:round(length(beta.sd)*0.025)], ]

pdf("SD_onlyBRAF_heatmap_top_0.025_cpg.pdf",width=9)
Heatmap(beta.005,
show_row_names = FALSE,show_column_names = TRUE,name = "Methylation",row_dend_reorder = TRUE, column_dend_reorder = TRUE,
column_title="Top 2.5% CpGs with the highest SD", column_title_side = "bottom", row_title="", row_title_side = "right",
top_annotation = column_ha, clustering_distance_columns = "pearson", clustering_distance_rows = "pearson")
dev.off()
# 5%
beta.005<-beta[ order(beta.sd,decreasing=TRUE)[1:round(length(beta.sd)*0.05)], ]

pdf("SD_onlyBRAF_heatmap_top_0.05_cpg.pdf",width=9)
Heatmap(beta.005,
show_row_names = FALSE,show_column_names = TRUE,name = "Methylation",row_dend_reorder = TRUE, column_dend_reorder = TRUE,
column_title="Top 5% CpGs with the highest SD", column_title_side = "bottom", row_title="", row_title_side = "right",
top_annotation = column_ha, clustering_distance_columns = "pearson", clustering_distance_rows = "pearson")
dev.off()
####
