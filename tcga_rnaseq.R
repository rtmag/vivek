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
                               
#



colores=c("#bae1ff","#ffb3ba","#baffc9")
clab=cbind(colores[track])

 library(RColorBrewer)
colors <- colorRampPalette( (brewer.pal(9, "GrRd")) )(20)


# set the custom distance and clustering functions
hclustfunc <- function(x) hclust(x, method="complete")
distfunc <- function(x) dist(x, method="euclidean")

ex1.clust=hclustfunc(distfunc(ex1))
ex2.clust=hclustfunc(distfunc(ex2))

pdf("CD41-_treated_VS_CD41+_treated.pdf")
x=heatmap.3(rbind(ex1,ex2[ex2.clust$order,]),col=colors, hclustfun=hclustfunc, distfun=distfunc, 
            scale="row", trace="none",cexCol=1,KeyValueName="Expression",Rowv=FALSE, RowSideColors=rlab,dendrogram="none")

legend('topright',legend=c("Open Chromatin in CD41- treated","Open Chromatin in CD41+ treated"),fill=c("#bae1ff","#ffb3ba"),border=NA,bty = "n")
dev.off()
