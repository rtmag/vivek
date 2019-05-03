
options(scipen=999)
library(DESeq2)
library(gplots)
library(factoextra)
library(RColorBrewer)

  colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(9))


vsd = readRDS("crest_vsd.rds")

colnames(vsd) = c("NHM_1","NHM_2","NHM_3",
                 "VE_1","VE_2","VE_3",
                 "KO_1","KO_2","KO_3",
                 "VEKO_1","VEKO_2","VEKO_3",
                 "NCC")

sig = read.csv("NCC_signature.csv")
################################################################################################
# CREST 
sig_vsd = vsd[rownames(vsd) %in% as.character(sig[sig$Signature=="Neural crest-like",1]),]
sig_vsd = sig_vsd[apply(sig_vsd,1,sd)!=0,]
x = sig_vsd[,1:12]
x = x[apply(x,1,sd)!=0,]
pdf("CREST_SIGNATURE_NHM.pdf",height=10,width=3.5)
  heatmap.2(x,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="CREST Gene Signature",key.title="Gene expression",cexCol=.85,cexRow=.6,Colv = "none",dendrogram="row")
dev.off()
################################################################################################
# Undifferentiated-Neural crest-like 
sig_vsd = vsd[rownames(vsd) %in% as.character(sig[sig$Signature=="Undifferentiated-Neural crest-like",1]),]
sig_vsd = sig_vsd[apply(sig_vsd,1,sd)!=0,]
x = sig_vsd[,1:12]
x = x[apply(x,1,sd)!=0,]
pdf("Undiff_CREST_SIGNATURE_NHM.pdf",height=10,width=3.5)
  heatmap.2(x,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Undifferentiated-Neural crest-like Gene Signature",key.title="Gene expression",cexCol=.85,cexRow=.6,Colv = "none",dendrogram="row")
dev.off()
################################################################################################
# Melanocytic 
sig_vsd = vsd[rownames(vsd) %in% as.character(sig[sig$Signature=="Melanocytic",1]),]
sig_vsd = sig_vsd[apply(sig_vsd,1,sd)!=0,]
x = sig_vsd[,1:12]
x = x[apply(x,1,sd)!=0,]
pdf("Melanocytic_SIGNATURE_NHM.pdf",height=10,width=3.5)
  heatmap.2(x,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Melanocytic Gene Signature",key.title="Gene expression",cexCol=.85,cexRow=.6,Colv = "none",dendrogram="row")
dev.off()
################################################################################################
# Undifferentiated 
sig_vsd = vsd[rownames(vsd) %in% as.character(sig[sig$Signature=="Undifferentiated",1]),]
sig_vsd = sig_vsd[apply(sig_vsd,1,sd)!=0,]
x = sig_vsd[,1:12]
x = x[apply(x,1,sd)!=0,]
pdf("Undifferentiated_SIGNATURE_NHM.pdf",height=10,width=3.5)
  heatmap.2(x,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Undifferentiated Gene Signature",key.title="Gene expression",cexCol=.85,cexRow=.6,Colv = "none",dendrogram="row")
dev.off()
################################################################################################
# Undifferentiated 
sig_vsd = vsd[rownames(vsd) %in% as.character(sig[sig$Signature=="Neural crest-like-Transitory",1]),]
sig_vsd = sig_vsd[apply(sig_vsd,1,sd)!=0,]
x = sig_vsd[,1:12]
x = x[apply(x,1,sd)!=0,]
pdf("NCC_transitory_SIGNATURE_NHM.pdf",height=10,width=3.5)
  heatmap.2(x,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Neural crest-like-Transitory Gene Signature",key.title="Gene expression",cexCol=.85,cexRow=.6,Colv = "none",dendrogram="row")
dev.off()
################################################################################################
sig_3g = sig[sig$Signature %in% c("Melanocytic","Neural crest-like","Undifferentiated"),1:2]
sig_vsd = vsd[rownames(vsd) %in% as.character(sig_3g[,1]),]
sig_vsd = sig_vsd[apply(sig_vsd,1,sd)!=0,]
x = sig_vsd[,c(1:6,10:12)]
x = x[apply(x,1,sd)!=0,]

track=as.character(rownames(x))
track[track %in% sig$Gene[sig$Signature=="Melanocytic"] ]=1
track[track %in% sig$Gene[sig$Signature=="Neural crest-like"] ]=2
track[track %in% sig$Gene[sig$Signature=="Undifferentiated"] ]=3
track=as.numeric(track)
colores=c("#ffb3ba","#baffc9","#bae1ff")
rlab=as.character(colores[track])

pdf("combined_SIGNATURE_NHM.pdf",height=10,width=3.5)
 x=heatmap.2(x,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Genes",key.title="Gene expression",cexCol=.85,cexRow=.6,
           Colv = "none",dendrogram="row",RowSideColors=rlab)
legend("topright",legend=c("Melanocytic","Neural crest-like","Undifferentiated"),
       fill=c("#ffb3ba","#baffc9","#bae1ff"), border=T, bty="n" )
dev.off()
################################################################################################
# CREST 
sig_vsd = vsd[rownames(vsd) %in% as.character(sig[sig$Signature=="Neural crest-like",1]),]
sig_vsd = sig_vsd[apply(sig_vsd,1,sd)!=0,]
x = sig_vsd[,c(1:6,10:12)]
x = x[apply(x,1,sd)!=0,]
pdf("CREST_SIGNATURE_NHM.pdf",height=10,width=3.5)
  heatmap.2(x,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="CREST Gene Signature",key.title="Gene expression",cexCol=.85,cexRow=.6,Colv = "none",dendrogram="row")
dev.off()
################################################################################################
# Melanocytic 
sig_vsd = vsd[rownames(vsd) %in% as.character(sig[sig$Signature=="Melanocytic",1]),]
sig_vsd = sig_vsd[apply(sig_vsd,1,sd)!=0,]
x = sig_vsd[,c(1:6,10:12)]
x = x[apply(x,1,sd)!=0,]
pdf("Melanocytic_SIGNATURE_NHM.pdf",height=10,width=3.5)
  heatmap.2(x,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Melanocytic Gene Signature",key.title="Gene expression",cexCol=.85,cexRow=.6,Colv = "none",dendrogram="row")
dev.off()
################################################################################################
# Undifferentiated 
sig_vsd = vsd[rownames(vsd) %in% as.character(sig[sig$Signature=="Undifferentiated",1]),]
sig_vsd = sig_vsd[apply(sig_vsd,1,sd)!=0,]
x = sig_vsd[,c(1:6,10:12)]
x = x[apply(x,1,sd)!=0,]
pdf("Undifferentiated_SIGNATURE_NHM.pdf",height=10,width=3.5)
  heatmap.2(x,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="Undifferentiated Gene Signature",key.title="Gene expression",cexCol=.85,cexRow=.6,Colv = "none",dendrogram="row")
dev.off()
################################################################################################
sig_3g = sig[sig$Signature %in% c("Melanocytic","Neural crest-like","Undifferentiated"),1:2]
sig_vsd = vsd[rownames(vsd) %in% as.character(sig_3g[,1]),]
sig_vsd = sig_vsd[apply(sig_vsd,1,sd)!=0,]
x = sig_vsd[,c(1:6,10:12)]
x = x[apply(x,1,sd)!=0,]
rownormx= t(apply(x, 1, function(x)(x-min(x))/(max(x)-min(x))))
rownormx=cbind(rownormx,Neural_Crest=0)
rownormx=cbind(rownormx,Melanocytic=0)
rownormx=cbind(rownormx,Undifferentiated=0)

rownormx[rownames(rownormx) %in% sig$Gene[sig$Signature=="Neural_Crest"], "Neural_Crest" ]=1
rownormx[rownames(rownormx) %in% sig$Gene[sig$Signature=="Melanocytic"], "Melanocytic" ]=1
rownormx[rownames(rownormx) %in% sig$Gene[sig$Signature=="Undifferentiated"], "Undifferentiated" ]=1

sampleDists <- get_dist(t(rownormx),method="euclidean")
sampleDistMatrix <- as.matrix(sampleDists)
                  
library(pheatmap)
colors <- (colorRampPalette( (brewer.pal(9, "RdYlBu")) )(200))
pdf("combined_sampleDistance.pdf")
                  pheatmap(sampleDistMatrix,
         clustering_distance_rows=sampleDists,
         clustering_distance_cols=sampleDists,
         col=colors)
dev.off()
####################################################################################
                  
sig_vsd = vsd[rownames(vsd) %in% as.character(sig[sig$Signature=="Neural crest-like",1]),]
sig_vsd = sig_vsd[apply(sig_vsd,1,sd)!=0,]
x = sig_vsd[,c(1:6,10:12)]
x = x[apply(x,1,sd)!=0,]

rownormx= t(apply(x, 1, function(x)(x-min(x))/(max(x)-min(x))))
rownormx=cbind(rownormx,Neural_Crest=1)
sampleDists <- get_dist(t(rownormx),method="euclidean")
sampleDistMatrix <- as.matrix(sampleDists)
                  
library(pheatmap)
colors <- (colorRampPalette( (brewer.pal(9, "RdYlBu")) )(200))
pdf("NCC_sampleDistance.pdf")
pheatmap(sampleDistMatrix,
         clustering_distance_rows=sampleDists,
         clustering_distance_cols=sampleDists,
         col=colors)
dev.off()

                  
sig_vsd = vsd[rownames(vsd) %in% as.character(sig[sig$Signature=="Melanocytic",1]),]
sig_vsd = sig_vsd[apply(sig_vsd,1,sd)!=0,]
x = sig_vsd[,c(1:6,10:12)]
x = x[apply(x,1,sd)!=0,]
                  
rownormx= t(apply(x, 1, function(x)(x-min(x))/(max(x)-min(x))))
rownormx=cbind(rownormx,Melanocytic=1)
sampleDists <- get_dist(t(rownormx),method="euclidean")
sampleDistMatrix <- as.matrix(sampleDists)
                  
library(pheatmap)
colors <- (colorRampPalette( (brewer.pal(9, "RdYlBu")) )(200))
pdf("Melanocytic_sampleDistance.pdf")
pheatmap(sampleDistMatrix,
         clustering_distance_rows=sampleDists,
         clustering_distance_cols=sampleDists,
         col=colors)
dev.off()

sig_vsd = vsd[rownames(vsd) %in% as.character(sig[sig$Signature=="Undifferentiated",1]),]
sig_vsd = sig_vsd[apply(sig_vsd,1,sd)!=0,]
x = sig_vsd[,c(1:6,10:12)]
x = x[apply(x,1,sd)!=0,]
                  
rownormx= t(apply(x, 1, function(x)(x-min(x))/(max(x)-min(x))))
rownormx=cbind(rownormx,Undifferentiated=1)
sampleDists <- get_dist(t(rownormx),method="euclidean")
sampleDistMatrix <- as.matrix(sampleDists)
                  
library(pheatmap)
colors <- (colorRampPalette( (brewer.pal(9, "RdYlBu")) )(200))
pdf("Undifferentiated_sampleDistance.pdf")
pheatmap(sampleDistMatrix,
         clustering_distance_rows=sampleDists,
         clustering_distance_cols=sampleDists,
         col=colors)
dev.off()
                  
############################################################################################
options(scipen=999)
library(DESeq2)
library(gplots)
library(factoextra)
library(RColorBrewer)
colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(9))

expr = readRDS("expr_group_name.rds")
sig = read.csv("~/CSI/vivek/new_rnaseq/crest/22_april_2019/NCC_signature.csv")
          
track=as.character(colnames(expr))
track[track=="Nev"] = 1
track[track=="Mel"] = 2
track = as.numeric(track)
colores=c("#800000","#4363d8")
clab=as.character(colores[track])
                  
sig_vsd = expr[rownames(expr) %in% as.character(sig[sig$Signature=="Neural crest-like",1]),]
sig_vsd = sig_vsd[apply(sig_vsd,1,sd)!=0,]
sig_vsd = sig_vsd[complete.cases(sig_vsd),]
                  
x = matrix(as.numeric(unlist(x)),ncol=35)
colnames(x) = colnames(sig_vsd)
rownames(x) = rownames(sig_vsd)
                 
pdf("CREST_SIGNATURE_HUNTER.pdf",height=10,width=6.5)
  heatmap.2(x,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="",key.title="Gene expression",cexCol=.85,cexRow=1,dendrogram="both",ColSideColors=clab)
dev.off()    

pdf("color_key.pdf",height=5,width=6)
  heatmap.2(x,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="",key.title="Gene expression",cexCol=.85,cexRow=1,dendrogram="both",ColSideColors=clab,density.info="none")
dev.off()
      
pdf("color_hunter_heatmap.legend.pdf",height=5,width=6)
plot(NULL)
legend("top",legend=c("NEV","MEL"),fill=c("#800000","#4363d8"), border=T, bty="n" )
dev.off()
                  
                  
                  
