

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
wtnames=rownames(wt_table[wt_table$adj.P.Val<0.001,])

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
colors = rev(colors)
# set the custom distance and clustering functions
hclustfunc <- function(x) hclust(x, method="complete")
distfunc <- function(x) dist(x, method="euclidean")

par(mar=c(7,4,4,2)+0.1) 
png(filename='450k_heatmap_mvalues_FDR1e-3_rowScale.png', width=800, height=750) 
heatmap.3(meta_sig,col=colors, hclustfun=hclustfunc, distfun=distfunc, labRow = FALSE, labCol = FALSE,xlab="Tumor Sample", ylab="CpG",
            scale="row", trace="none",KeyValueName="Methylation", ColSideColors=clab,dendrogram="both",margins = c(2, 2),
cexRow=.6, cexCol=.6,keysize=0.9)
legend(0,.9,legend=c("BAP1","EIF1AX","SF3B1"),fill=c("#ffb3ba","#baffc9","#bae1ff"),border=NA,bty = "n",cex=.9)
dev.off()
                               
par(mar=c(7,4,4,2)+0.1) 
png(filename='450k_heatmap_mvalues_FDR1e-3_noneScale.png', width=800, height=750) 
heatmap.3(meta_sig,col=colors, hclustfun=hclustfunc, distfun=distfunc, labRow = FALSE, labCol = FALSE,xlab="Tumor Sample", ylab="CpG",
            scale="none", trace="none",KeyValueName="Methylation", ColSideColors=clab,dendrogram="both",margins = c(2, 2),
cexRow=.6, cexCol=.6,keysize=0.9)
legend(0,.9,legend=c("BAP1","EIF1AX","SF3B1"),fill=c("#ffb3ba","#baffc9","#bae1ff"),border=NA,bty = "n",cex=.9)
dev.off()

par(mar=c(7,4,4,2)+0.1) 
png(filename='450k_heatmap_bvalues_FDR1e-3_noneScale.png', width=800, height=750) 
beta_sig=beta[rownames(beta) %in% wtnames,]
heatmap.3(beta_sig,col=colors, hclustfun=hclustfunc, distfun=distfunc, labRow = FALSE, labCol = FALSE,xlab="Tumor Sample", ylab="CpG",
            scale="none", trace="none",KeyValueName="Methylation", ColSideColors=clab,dendrogram="both",margins = c(2, 2),
cexRow=.6, cexCol=.6,keysize=0.9)
legend(0,.9,legend=c("BAP1","EIF1AX","SF3B1"),fill=c("#ffb3ba","#baffc9","#bae1ff"),border=NA,bty = "n",cex=.9)
dev.off()
                               
#
anno=read.table("BAP1/jhu-usc.edu_UVM.HumanMethylation450.1.lvl-3.TCGA-V4-A9F1-01A-11D-A39X-05.gdc_hg38.txt",sep="\t", row.names=1, header=T)
anno_sig=anno[rownames(anno) %in% wtnames,2:dim(anno)[2]]
anno_sig=anno_sig[order(rownames(anno_sig)),]
                               
table_sig=wt_table[wt_table$adj.P.Val<0.001,]
table_sig=table_sig[order(rownames(table_sig)),]
                               
comb=cbind(anno_sig,table_sig[,1],table_sig[,5])
write.csv(comb,"differentially_meth_cpg_bap1_VS_eif1ax-SF3B1_FDR1e-3.csv")
                               #
#saturating colors
colors <- colorRampPalette( (brewer.pal(9, "RdBu")) )(10)
colors = rev(colors)
par(mar=c(7,4,4,2)+0.1) 
png(filename='450k_heatmap_mvalues_FDR1e-3_rowScale_colorSaturated.png', width=800, height=750) 
heatmap.3(meta_sig,col=colors, hclustfun=hclustfunc, distfun=distfunc, labRow = FALSE, labCol = FALSE,xlab="Tumor Sample", ylab="CpG",
            scale="row", trace="none",KeyValueName="Methylation", ColSideColors=clab,dendrogram="both",margins = c(2, 2),
cexRow=.6, cexCol=.6,keysize=0.9,breaks=seq(-2,2,length.out=11))
dev.off()
legend(0,.9,legend=c("BAP1","EIF1AX","SF3B1"),fill=c("#ffb3ba","#baffc9","#bae1ff"),border=NA,bty = "n",cex=.9)
                               
                               
dev.off()
                               
####
dmc=read.csv("differentially_meth_cpg_bap1_VS_eif1ax-SF3B1_FDR1e-3.csv",row.names=1)
names=as.character(dmc$Gene_Symbol)
name_gene=lapply(names,function(x) unique(unlist(strsplit(x,";"))) )
       
mat = c(0,0)
for ( i in 1:length(name_gene) ){
    mat = rbind( mat, cbind(name_gene[[i]], dmc[i,10]) )
  }

mat=mat[2:dim(mat)[1],]

meth=mat
meth[as.numeric(mat[,2])>0,2]="Meth_bap1"
meth[as.numeric(mat[,2])<0,2]="Meth_eif1ax_sf3b1"
#
meth_counts=matrix(0,nrow=length(unique(meth[,1])),ncol=2)
rownames(meth_counts)=unique(meth[,1])
colnames(meth_counts)=c("MethCpG_bap1","MethCpG_eif1ax_sf3b1")
                 
for(i in 1:dim(meth)[1]){
    ix = rownames(meth_counts)==meth[i,1]
    if(meth[i,2]=="Meth_bap1"){ jx = 1 }
    if(meth[i,2]=="Meth_eif1ax_sf3b1"){ jx = 2 }
    meth_counts[ ix, jx] = meth_counts[ ix, jx]+1
  }

meth_gene=data.frame(meth_counts,CpGs=rowSums(meth_counts))
meth_gene = meth_gene[order(meth_gene$CpGs,decreasing=T),]
meth_gene = meth_gene[2:dim(meth_gene)[1],]

meth_gene = data.frame(meth_gene, ratio=(meth_gene[,1]/meth_gene[,3]) )

meth_gene = data.frame(meth_gene, High_meth_on="0" )
meth_gene[,5]=as.character(meth_gene[,5])
                 
meth_gene[meth_gene$ratio>.7,5]="BAP1"
meth_gene[meth_gene$ratio<.3,5]="EIF1AX_SF3B1"

write.csv(meth_gene,"HyperMeth_CpG_bap1_VS_eif1ax_sf3b1_byGene.csv")
write.csv(meth_gene[meth_gene[,5]=="BAP1" & meth_gene[,3]>9,],"HyperMeth_CpG_bap1_byGene.csv")
write.csv(meth_gene[meth_gene[,5]=="EIF1AX_SF3B1" & meth_gene[,3]>9,],"HyperMeth_CpG_EIF1AX_SF3B1_byGene.csv")
                 
write.csv(meth_gene[meth_gene[,5]=="BAP1" & meth_gene[,3]>9,],"NAMES_HyperMeth_CpG_bap1_byGene.csv")
write.csv(meth_gene[meth_gene[,5]=="EIF1AX_SF3B1" & meth_gene[,3]>9,],"NAMES_HyperMeth_CpG_EIF1AX_SF3B1_byGene.csv")
                 
write.table(dmc[dmc[,10]>0,c(1,2,3)],"BAP1_coord.bed",sep="\t",col.names=F,quote=F,row.names=F)
write.table(dmc[dmc[,10]<0,c(1,2,3)],"EIF1AX_SF3B1_coord.bed",sep="\t",col.names=F,quote=F,row.names=F)
