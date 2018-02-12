

bap1_file <- dir('BAP1/',full.names=TRUE) #where you have your files
bap1 <- do.call(cbind, lapply(bap1_file, function(x) read.table(pipe(paste('cut -f2',x) ), sep="\t", header=T ) ))
colnames(bap1) <- rep("bap1",length(colnames(bap1)))
anno = read.table(bap1_file[1],sep="\t",header=T)
rownames(bap1) = anno[,1]
                              
eif1ax_file <- dir('EIF1AX/',full.names=TRUE) #where you have your files
eif1ax <- do.call(cbind, lapply(eif1ax_file, function(x) read.table(pipe(paste('cut -f2',x) ), sep="\t", header=T ) ))
colnames(eif1ax) <- rep("eif1ax",length(colnames(eif1ax)))
rownames(eif1ax) = anno[,1]

sf3b1_file <- dir('SF3B1/',full.names=TRUE) #where you have your files
sf3b1 <- do.call(cbind, lapply(sf3b1_file, function(x) read.table(pipe(paste('cut -f2',x) ), sep="\t", header=T ) ))
colnames(sf3b1) <- rep("sf3b1",length(colnames(sf3b1)))
rownames(sf3b1) = anno[,1]
##
                               
beta = cbind(bap1, eif1ax, sf3b1)
meta = log2(beta/(1 - beta)) # Beta = 2^M/(2^M + 1)
                               
require(Biobase)
library(limma)

samples = colnames(beta)
f <- factor (samples, levels=unique(samples))
design <- model.matrix(~0+f)
colnames(design) <- unique(samples)

colnames(meta) = make.names(colnames(meta),unique=T)
eset<-new("ExpressionSet", exprs=data.matrix(meta))

# linear model FIT
fit <- lmFit(eset, design)
                               
fit2 <- eBayes(fit)
res = topTableF(fit2,number=Inf,adjust="BH")

sig_meta = meta[rownames(meta) %in% rownames(res)[res$adj.P.Val<10e-50],]
######
sig_meta = meta
sig_meta = sig_meta[complete.cases(sig_meta), ]

colnames(sig_meta) = colnames(beta)
ir.pca <- prcomp(t(sig_meta),
                 center = TRUE,
                 scale. = TRUE) 

sx=summary(ir.pca)
track=colnames(sig_meta)
track[track=="bap1"]=1
track[track=="eif1ax"]=2
track[track=="sf3b1"]=3
track=as.numeric(track)
                               
colores=c("#ffb3ba","#baffc9","#bae1ff")
clab=as.character(cbind(colores[track]))

pdf("450K_methylation_allProbes_mvalues_pca.pdf")
plot(ir.pca$x[,1],ir.pca$x[,2],col=clab,xlab=paste("PCA1:",round(sx$importance[2,1]*100,digits=1),"%"),ylab=paste("PCA2:",round(sx$importance[2,2]*100,digits=1),"%"))
legend("topright",legend=c("BAP1","EIF1AX","SF3B1"),fill=c("#ffb3ba","#baffc9","#bae1ff"), border=T, bty="n" )
dev.off()
############
sig_meta = meta[rownames(meta) %in% (anno[,1][anno[,3]!="chr3"]),]
sig_meta = sig_meta[complete.cases(sig_meta), ]

colnames(sig_meta) = colnames(beta)
ir.pca <- prcomp(t(sig_meta),
                 center = TRUE,
                 scale. = TRUE) 

sx=summary(ir.pca)
track=colnames(sig_meta)
track[track=="bap1"]=1
track[track=="eif1ax"]=2
track[track=="sf3b1"]=3
track=as.numeric(track)
                               
colores=c("#ffb3ba","#baffc9","#bae1ff")
clab=as.character(cbind(colores[track]))

pdf("450K_methylation_NOchr3Probes_mvalues_pca.pdf")
plot(ir.pca$x[,1],ir.pca$x[,2],col=clab,xlab=paste("PCA1:",round(sx$importance[2,1]*100,digits=1),"%"),ylab=paste("PCA2:",round(sx$importance[2,2]*100,digits=1),"%"))
legend("topright",legend=c("BAP1","EIF1AX","SF3B1"),fill=c("#ffb3ba","#baffc9","#bae1ff"), border=T, bty="n" )
dev.off()
                               
##################
                               
sig_meta = meta[rownames(meta) %in% rownames(res)[res$adj.P.Val<10e-40],]
sig_meta = sig_meta[complete.cases(sig_meta), ]

colnames(sig_meta) = colnames(beta)
ir.pca <- prcomp(t(sig_meta),
                 center = TRUE,
                 scale. = TRUE) 

sx=summary(ir.pca)
track=colnames(sig_meta)
track[track=="bap1"]=1
track[track=="eif1ax"]=2
track[track=="sf3b1"]=3
track=as.numeric(track)
                               
colores=c("#ffb3ba","#baffc9","#bae1ff")
clab=as.character(cbind(colores[track]))

pdf("450K_methylation_adj.P.Val<10e-40_mvalues_pca.pdf")
plot(ir.pca$x[,1],ir.pca$x[,2],col=clab,xlab=paste("PCA1:",round(sx$importance[2,1]*100,digits=1),"%"),ylab=paste("PCA2:",round(sx$importance[2,2]*100,digits=1),"%"))
legend("topright",legend=c("BAP1","EIF1AX","SF3B1"),fill=c("#ffb3ba","#baffc9","#bae1ff"), border=T, bty="n" )
dev.off()
                               
########################
samples = colnames(beta)
samples[samples=="eif1ax"]="eif1ax_sf3b1"
samples[samples=="sf3b1"]="eif1ax_sf3b1"


f <- factor (samples, levels=unique(samples))
design <- model.matrix(~0+f)
colnames(design) <- unique(samples)

# ESET transformation
colnames(meta) = make.names(colnames(meta),unique=T)
eset<-new("ExpressionSet", exprs=data.matrix(meta))

# linear model FIT
fit <- lmFit(eset, design)

# genes respond at either the 24 hour or 48 hour or 72 hour times in the wild-type? 
cont.wt <- makeContrasts(
      "bap1-eif1ax_sf3b1",
  levels=design)
 fit_wt <- contrasts.fit(fit, cont.wt)
 fit_wt <- eBayes(fit_wt)
 wt_table=topTableF(fit_wt,number=485577, adjust="BH")
 table(wt_table$adj.P.Val<0.05)
wt_table$adj.P.Val[is.na(wt_table$adj.P.Val)]=1
wtnames=rownames(wt_table[wt_table$adj.P.Val<0.01,])

source('https://raw.githubusercontent.com/rtmag/tumor-meth-pipe/master/heatmap3.R')

meta_sig=meta[rownames(meta) %in% wtnames,]
                               
track=as.character(colnames(beta))
track[track=="bap1"]=1
track[track=="eif1ax"]=2
track[track=="sf3b1"]=3
track=as.numeric(track)
                               
colores=c("#ffb3ba","#baffc9","#bae1ff")
clab=cbind(colores[track])
colnames(clab)="Mutation"

 library(RColorBrewer)
colors <- colorRampPalette( (brewer.pal(9, "RdBu")) )(20)
# set the custom distance and clustering functions
hclustfunc <- function(x) hclust(x, method="complete")
distfunc <- function(x) dist(x, method="euclidean")
                               
heatmap.3(meta_sig,col=colors, hclustfun=hclustfunc, distfun=distfunc, labRow = FALSE, labCol = FALSE,xlab="Tumor Sample", ylab="genes",
            scale="row", trace="none",KeyValueName="Expression", ColSideColors=clab,dendrogram="both",margins = c(2, 2),
cexRow=.6, cexCol=.6,keysize=0.9)
