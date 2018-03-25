require(DESeq2)
options(scipen=999)
library(factoextra)


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
                               
ex=assay(dLRT_vsd)[dLRT_res$padj<0.001,]
rownames(ex)=NULL
colnames(ex)=NULL

track=as.character(dLRT_vsd@colData$group)
track[track=="bap1"]=1
track[track=="eif1ax"]=2
track[track=="sf3b1"]=3
track=as.numeric(track)
                               
colores=c("#ffb3ba","#baffc9","#bae1ff")
clab=cbind(colores[track])
colnames(clab)="Mutation"
                               
 library(RColorBrewer)
colors <- colorRampPalette(c("green","black","red"))(30)


# set the custom distance and clustering functions
hclustfunc <- function(x) hclust(x, method="complete")
distfunc <- function(x) get_dist(x,method="spearman")

                               
par(mar=c(7,4,4,2)+0.1) 
png(filename='vivek_heatmap.png', width=800, height=750)  
heatmap.3(ex,col=colors, hclustfun=hclustfunc, distfun=distfunc, labRow = FALSE, labCol = FALSE,xlab="Tumor Sample", ylab="genes",
            scale="row", trace="none",KeyValueName="Expression", ColSideColors=clab,dendrogram="both",margins = c(2, 2),
           cexRow=.6, cexCol=.6,keysize=0.9)

legend(0,.9,legend=c("BAP1","EIF1AX","SF3B1"),fill=c("#ffb3ba","#baffc9","#bae1ff"),border=NA,bty = "n",cex=.9)
dev.off()

#############################################################
#removing chr 3

library(ensembldb)
library("EnsDb.Hsapiens.v86")   
edb <- EnsDb.Hsapiens.v86
tx <- genes(edb, columns=c("gene_id", "gene_name"))
tx=data.frame(gene_id=tx$gene_id, gene_name=tx$gene_name)

ex = countData
ex = ex[rowSums(ex)>0,]

#rownames_uniq = make.names(tx[ match( gsub("\\..+","",rownames(ex)), tx[['gene_id']] ) , 'gene_name'],unique=T)
rownames_uniq = as.character(tx[ match( gsub("\\..+","",rownames(ex)), tx[['gene_id']] ) , 'gene_name'])

ex = ex[!duplicated(rownames_uniq),]
rownames(ex) <- rownames_uniq[!duplicated(rownames_uniq)]


tx_ex = tx[tx$gene_id %in% gsub("\\..+","",rownames(ex),perl=T),]                               
tx_ex = tx_ex[order(tx_ex$gene_id)]
ex = ex[order(rownames(ex)),]
tx_xx=cbind(tx_ex$gene_id,as.character(tx_ex@seqnames))
tx_xx=tx_xx[tx_xx[,2]!="3",]

ex_xx = ex[gsub("\\..+","",rownames(ex),perl=T) %in% tx_xx[,1],]

pdf("Diagnostic_bygene_noChr3_pca.pdf")
plotPCA(dLRT_vsd[gsub("\\..+","",rownames(dLRT_vsd),perl=T) %in% tx_xx[,1],],ntop=30000,intgroup=c('group'))
dev.off()
                               
par(mar=c(7,4,4,2)+0.1) 
png(filename='vivek_heatmap_noChr3.png', width=800, height=750)  
heatmap.3(ex_xx,col=colors, hclustfun=hclustfunc, distfun=distfunc, labRow = FALSE, labCol = FALSE,xlab="Tumor Sample", ylab="genes",
            scale="row", trace="none",KeyValueName="Expression", ColSideColors=clab,dendrogram="both",margins = c(2, 2),
           cexRow=.6, cexCol=.6,keysize=0.9)

legend(0,.9,legend=c("BAP1","EIF1AX","SF3B1"),fill=c("#ffb3ba","#baffc9","#bae1ff"),border=NA,bty = "n",cex=.9)
dev.off()

##
#####################
colData[colData[,1]!='bap1',1]="sf3b1"
                               
dds <- DESeqDataSetFromMatrix(
       countData = countData[gsub("\\..+","",rownames(countData),perl=T) %in% tx_xx[,1],],
       colData = colData,
       design = ~ group)
                               
dds_deseq <- DESeq(dds)
res <- results(dds_deseq, contrast=c("group","bap1","sf3b1"))    
write.table(rownames(res)[res$log2FoldChange>0],"genes_high_bap1.txt",sep="\t",row.names=F,col.names=F,quote=F)
write.table(rownames(res)[res$log2FoldChange<0],"genes_high_EIF1AX_SF3B1.txt",sep="\t",row.names=F,col.names=F,quote=F)

write.table(tx_ex$gene_name[tx_ex$gene_id %in% gsub("\\..+","",rownames(res)[res$log2FoldChange>0],perl=T)]
,"genes_names_high_bap1.txt",sep="\t",row.names=F,col.names=F,quote=F)
write.table(tx_ex$gene_name[tx_ex$gene_id %in% gsub("\\..+","",rownames(res)[res$log2FoldChange<0],perl=T)]
,"genes_names_high_EIF1AX_SF3B1.txt",sep="\t",row.names=F,col.names=F,quote=F)

#more result\(1\).csv|perl -pe 's/\,/\t/g'|perl -pe 's/\"//g'|cut -f2,7|head -n18 > ~/vivek/rna_tcga/enriched_high_bap1.txt    
#
x=read.table("enriched_high_bap1.txt",sep="\t",header=T)
        
pdf("bap1_highExpression.pdf",width=14, height=10)
mar.default <- c(5,4,4,0) + 0.1
par(mar = mar.default + c(0, 27, 0, 0)) 
barplot(rev(-log10(x[,2])), border=F, horiz=T , las=1,names.arg=x[,1],col="#ffb3ba",xlab="-Log10 FDR",main="")
abline(v=2,lty='dashed')
dev.off()

#

temp = cbind(tx_ex$gene_name[tx_ex$gene_id %in% gsub("\\..+","",rownames(res)[res$log2FoldChange>0],perl=T)],
             res$log2FoldChange[res$log2FoldChange>0])
write.table(temp,"genes_names_log2fc_high_bap1.txt",sep="\t",row.names=F,col.names=F,quote=F)

temp = cbind(tx_ex$gene_name[tx_ex$gene_id %in% gsub("\\..+","",rownames(res)[res$log2FoldChange<0],perl=T)],
             res$log2FoldChange[res$log2FoldChange<0])
write.table(temp,"genes_names_log2fc_high_NOTbap1.txt",sep="\t",row.names=F,col.names=F,quote=F)



temp = tx_ex$gene_name[ (tx_ex$gene_id %in% gsub("\\..+","",
                                           rownames(res)[res$log2FoldChange<0],perl=T) ) & (tx_ex$gene_id %in% tx_xx[,1][tx_xx[,2]=="6"] )]
write.table(temp,"genes_names_high_NOTbap1_chr6.txt",sep="\t",row.names=F,col.names=F,quote=F)

temp = tx_ex$gene_name[ (tx_ex$gene_id %in% gsub("\\..+","",
                                           rownames(res)[res$log2FoldChange>0],perl=T) ) & (tx_ex$gene_id %in% tx_xx[,1][tx_xx[,2]=="6"] )]
write.table(temp,"genes_names_high_NOTbap1_chr6.txt",sep="\t",row.names=F,col.names=F,quote=F)

#
                               

                    
library(ensembldb)
library("EnsDb.Hsapiens.v86")   
edb <- EnsDb.Hsapiens.v86
tx <- genes(edb, columns=c("gene_id", "gene_name"))

ex = readRDS("dLRT_vsd.rds")
ex = assay(ex)

                               
boxploter=function(name_gene){
id=tx$gene_id[which(tx$gene_name==name_gene)]
                               
bdata = ex[grep(id,rownames(ex)),]
                               
dnames = gsub("\\..+","",names(bdata),perl = T)
bap1 = dnames == "bap1"
eif1ax = dnames == "eif1ax"
sf3b1 = dnames == "sf3b1"

boxplot(bdata[bap1],bdata[eif1ax],bdata[sf3b1],names=c("BAP1","EIF1AX","SF3B1"), 
        main = name_gene, col=c("#ffb3ba","#baffc9","#bae1ff"),outline=F)
                              } 

pdf("boxplot_genes_of_interest_noOutline.pdf")
par(mfrow=c(3,3))
boxploter("TWIST1")
boxploter("RNF2")
boxploter("RING1")
boxploter("JARID2")
boxploter("BMI1")
boxploter("KIT")
boxploter("MYCN")
boxploter("PHF1")
dev.off()
                               

pvalues=function(name_gene){

id=tx$gene_id[which(tx$gene_name==name_gene)]
id = id[grep("ENS",id)]
bdata = ex[grep(id,rownames(ex)),]
                               
dnames = gsub("\\..+","",names(bdata),perl = T)
bap1 = bdata[dnames == "bap1"]
eif1ax = bdata[dnames == "eif1ax"]
sf3b1 = bdata[dnames == "sf3b1"]
                               
cor.mat = matrix(1,nrow=3,ncol=3)

cor.mat[1,2] = wilcox.test(bap1,eif1ax)$p.value
cor.mat[2,1] = wilcox.test(bap1,eif1ax)$p.value

cor.mat[1,3] = wilcox.test(bap1,sf3b1)$p.value
cor.mat[3,1] = wilcox.test(bap1,sf3b1)$p.value

cor.mat[2,3] = wilcox.test(eif1ax,sf3b1)$p.value
cor.mat[3,2] = wilcox.test(eif1ax,sf3b1)$p.value

colnames(cor.mat) = c("bap1","eif1ax","sf3b1")
rownames(cor.mat) = c("bap1","eif1ax","sf3b1")
corrplot(cor.mat, method = "number",cl.lim=c(0,1),col=colorRampPalette(c("red","black"))(10),tl.col="black",cl.pos='n',
        number.digits=4)
  title(name_gene,outer=F,cex.main=.9)  
  }
                       
pdf("boxplot_genes_of_interest_Mann-whitneyTest_pvalue.pdf")
par(mfrow=c(3,3))
pvalues("TWIST1")
pvalues("RNF2")
pvalues("RING1")
pvalues("JARID2")
pvalues("BMI1")
pvalues("KIT")
pvalues("MYCN")
pvalues("PHF1")
dev.off()
#####################################################

library(ensembldb)
library("EnsDb.Hsapiens.v86")   
edb <- EnsDb.Hsapiens.v86
tx <- genes(edb, columns=c("gene_id", "gene_name"))
tx=data.frame(gene_id=tx$gene_id, gene_name=tx$gene_name)

ex = countData
ex = ex[rowSums(ex)>0,]

#rownames_uniq = make.names(tx[ match( gsub("\\..+","",rownames(ex)), tx[['gene_id']] ) , 'gene_name'],unique=T)
rownames_uniq = as.character(tx[ match( gsub("\\..+","",rownames(ex)), tx[['gene_id']] ) , 'gene_name'])

ex = ex[!duplicated(rownames_uniq),]
                               
x_dup <- rownames_uniq[!duplicated(rownames_uniq)]
x_dup[which(is.na(x_dup))] = "NA"                         
rownames(ex) = x_dup

saveRDS(ex,"TCGA_countData.rds")

countData = readRDS("TCGA_countData.rds")
                               
tx <- genes(edb, columns=c("gene_id", "gene_name"))
tx_df=data.frame(gene_id=tx$gene_id, gene_name=tx$gene_name)

ex = ex[!(rownames(ex) %in% as.character(tx_df[which(tx@seqnames==3),2])),]

saveRDS(ex,"TCGA_countData_noChr3.rds")
###############################################################
library(DESeq2)
countData = readRDS("TCGA_countData_noChr3.rds")
#
colData <- data.frame(group=colnames(countData))
colData$group = gsub("\\..+","",colData$group,perl=T)
colData[colData[,1]!='bap1',1]="sf3b1_eif1ax"
                               
dds <- DESeqDataSetFromMatrix(
       countData = countData,
       colData = colData,
       design = ~ group)
                               
dds_deseq <- DESeq(dds)
res <- results(dds_deseq, contrast=c("group","bap1","sf3b1_eif1ax")) 
res=res[order(res$log2FoldChange,res$padj),] 
write.csv(res,"deseq2_bap1_vs_sf3b1_eif1ax.csv")
#######
colData <- data.frame(group=colnames(countData))
colData$group = gsub("\\..+","",colData$group,perl=T)
                      
dds <- DESeqDataSetFromMatrix(
       countData = countData[,colData[,1] %in% c("bap1","eif1ax")],
       colData = data.frame(group=colData[colData[,1] %in% c("bap1","eif1ax"),]),
       design = ~ group)
                               
dds_deseq <- DESeq(dds)
res <- results(dds_deseq, contrast=c("group","bap1","eif1ax")) 
res=res[order(res$log2FoldChange,res$padj),] 
write.csv(res,"deseq2_bap1_vs_eif1ax.csv")
#######                          
colData <- data.frame(group=colnames(countData))
colData$group = gsub("\\..+","",colData$group,perl=T)
                      
dds <- DESeqDataSetFromMatrix(
       countData = countData[,colData[,1] %in% c("bap1","sf3b1")],
       colData = data.frame(group=colData[colData[,1] %in% c("bap1","sf3b1"),]),
       design = ~ group)
                               
dds_deseq <- DESeq(dds)
res <- results(dds_deseq, contrast=c("group","bap1","sf3b1")) 
res=res[order(res$log2FoldChange,res$padj),] 
write.csv(res,"deseq2_bap1_vs_sf3b1.csv")
#######
colData <- data.frame(group=colnames(countData))
colData$group = gsub("\\..+","",colData$group,perl=T)
                      
dds <- DESeqDataSetFromMatrix(
       countData = countData[,colData[,1] %in% c("eif1ax","sf3b1")],
       colData = data.frame(group=colData[colData[,1] %in% c("eif1ax","sf3b1"),]),
       design = ~ group)
                               
dds_deseq <- DESeq(dds)
res <- results(dds_deseq, contrast=c("group","eif1ax","sf3b1")) 
res=res[order(res$log2FoldChange,res$padj),] 
write.csv(res,"deseq2_eif1ax_vs_sf3b1.csv")
                               
                               
###############################################################
up_reg = res[ which(res$log2FoldChange>0),]
up_reg = up_reg[ !is.na(up_reg$padj),]
up_reg_log=-log10(up_reg$padj)
names(up_reg_log) = rownames(up_reg)

dw_reg = res[ which(res$log2FoldChange<0),]
dw_reg = dw_reg[ !is.na(dw_reg$padj),]
dw_reg_log=log10(dw_reg$padj)
names(dw_reg_log) = rownames(dw_reg)

rankedlist = cbind(sort(c(up_reg_log,dw_reg_log),decreasing=T) )
rankedlist = data.frame(ensid=rownames(rankedlist), log10FDR=rankedlist)
write.table(rankedlist,"genes_ranked_bap1_vs_sf3b1_eif1ax_FCFDR.rnk", sep="\t", quote=F,col.names=F,row.names=F)
