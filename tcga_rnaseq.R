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
colnames(countData) = make.names(colnames(countData),unique=T)
                               
colData <- data.frame(group=colnames(countData))
                               
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
