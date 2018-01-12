require(DESeq2)

bap1_file <- dir('BAP1/',full.names=TRUE) #where you have your files
bap1 <- do.call(cbind, lapply(bap1_file, function(x) read.table(pipe(paste('zcat',x) ), sep="\t", row.names=1 ) ))
colnames(bap1) <- rep("bap1",length(colnames(bap1)))
                              
eif1ax_file <- dir('EIF1AX/',full.names=TRUE) #where you have your files
eif1ax <- do.call(cbind, lapply(eif1ax_file, function(x) read.table(pipe(paste('zcat',x) ), sep="\t", row.names=1 ) ))
colnames(eif1ax) <- rep("eif1ax",length(colnames(eif1ax)))

sf3b1_file <- dir('SF3B1/',full.names=TRUE) #where you have your files
sf3b1 <- do.call(cbind, lapply(sf3b1_file, function(x) read.table(pipe(paste('zcat',x) ), sep="\t", row.names=1 ) ))
colnames(sf3b1) <- rep("sf3b1",length(colnames(sf3b1)))
##
countData = cbind(bap1, eif1ax, sf3b1)
countData = head(countData,-5)
                               
colData <- data.frame(group=colnames(countData))
colnames(countData) = make.names(colnames(countData),unique=T)

dds <- DESeqDataSetFromMatrix(
       countData = countData,
       colData = colData,
       design = ~ group)
                               
dLRT <- DESeq(dds, test="LRT", reduced=~1)
dLRT_vsd <- varianceStabilizingTransformation(dLRT)
dLRT_res <- results(dLRT)

pdf("Diagnostic_bygene_pca.pdf")
plotPCA(dLRT_vsd,ntop=30000,intgroup=c('group'))
dev.off()
                               
# Heatmap
saveRDS(dLRT_res,"dLRT_res.rds")
saveRDS(dLRT_vsd,"dLRT_vsd.rds")

dLRT_res=readRDS("dLRT_res.rds")
dLRT_vsd=readRDS("dLRT_vsd.rds")

source('https://raw.githubusercontent.com/rtmag/tumor-meth-pipe/master/heatmap3.R')
dLRT_res$padj[is.na(dLRT_res$padj)]=1
                               
ex=assay(dLRT_vsd)[dLRT_res$padj<0.01,]
rownames(ex)=NULL
colnames(ex)=NULL

track=c( rep(1,dim(bap1)[2]),rep(2,dim(eif1ax)[2]),rep(3,dim(sf3b1)[2]) )
                               
colores=c("#bae1ff","#ffb3ba","#baffc9")
clab=cbind(colores[track])
colnames(clab)="Mutation"
                               
 library(RColorBrewer)
colors <- colorRampPalette(c("green","black","red"))(30)


# set the custom distance and clustering functions
hclustfunc <- function(x) hclust(x, method="complete")
distfunc <- function(x) dist(x, method="euclidean")

jpeg("vivek_heatmap.jpeg")
x=heatmap.3(ex,col=colors, hclustfun=hclustfunc, distfun=distfunc, 
            scale="row", trace="none",cexCol=1,KeyValueName="Expression", ColSideColors=clab,dendrogram="both")

legend('topright',legend=c("BAP1","EIF1AX","SF3B1"),fill=c("#bae1ff","#ffb3ba","#baffc9"),border=NA,bty = "n")
dev.off()
