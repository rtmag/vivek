
############################################################################################
suppressMessages(library(RnBeads))
options(bitmapType="cairo")
options(scipen=999)
############################################################################################
rnb.set.norm=load.rnb.set("/home/rtm/vivek/navi/EPIC_2nd_batch/RnBeads/RnBeads_normalization/rnb.set.norm.filtered.RData.zip")
############################################################################################
# original
#rnb.set.norm@pheno = data.frame(rnb.set.norm@pheno, 
#           BRAF = c("WT","WT","NA","NA","NA","NA","MUT","MUT","MUT","MUT",
#                    "MUT","MUT","NA","NA","WT","NA","MUT","NA","MUT","MUT",
#                    "NA","WT","MUT","NA","WT","WT","NA","NA","MUT","NA",
#                    "WT","WT","WT","WT","NA","NA","NA","NA","NA","NA",
#                    "NA","NA","WT","MUT","MUT","NA","NA","NA"),
           
#           NRAS = c("WT","WT","NA","NA","NA","NA","MUT","MUT","WT","WT",
#                    "WT","WT","NA","NA","WT","NA","WT","NA","WT","WT",
#                    "NA","MUT","WT","NA","MUT","MUT","NA","NA","WT","NA",
#                    "MUT","MUT","WT","WT","NA","NA","NA","NA","NA","NA",
#                    "NA","NA","WT","WT","WT","NA","NA","NA"),
           
#           NF1 = c("WT","WT","NA","NA","NA","NA","MUT","MUT","MUT","MUT",
#                   "WT","WT","NA","NA","MUT","NA","WT","NA","WT","WT",
#                   "NA","WT","MUT","NA","WT","WT","NA","NA","WT","NA",
#                   "WT","WT","WT","WT","NA","NA","NA","NA","NA","NA",
#                   "NA","NA","MUT","WT","WT","NA","NA","NA") )
           


rnb.set.norm@pheno = data.frame(rnb.set.norm@pheno, 
           BRAF = c("WT","WT","NA","NA","NA","NA","MUT","MUT","MUT","MUT",
                    "MUT","MUT","NA","NA","WT","WT","MUT","MUT","MUT","MUT",
                    "WT","WT","MUT","MUT","WT","WT","NA","NA","MUT","MUT",
                    "WT","WT","WT","WT","NA","NA","NA","NA","NA","NA",
                    "NA","NA","WT","MUT","MUT","MUT","NA","NA"),
           
           NRAS = c("WT","WT","NA","NA","NA","NA","MUT","MUT","WT","WT",
                    "WT","WT","NA","NA","WT","WT","WT","WT","WT","WT",
                    "MUT","MUT","WT","WT","MUT","MUT","NA","NA","WT","WT",
                    "MUT","MUT","WT","WT","NA","NA","NA","NA","NA","NA",
                    "NA","NA","WT","WT","WT","WT","NA","NA"),
           
           NF1 = c("WT","WT","NA","NA","NA","NA","MUT","MUT","MUT","MUT",
                   "WT","WT","NA","NA","MUT","MUT","WT","WT","WT","WT",
                   "WT","WT","MUT","MUT","WT","WT","NA","NA","WT","WT",
                   "WT","WT","WT","WT","NA","NA","NA","NA","NA","NA",
                   "NA","NA","MUT","WT","WT","WT","NA","NA") )
           
############################################################################################
num.cores <- 20
parallel.setup(num.cores)
rnb.options("columns.pairing"=c("Tumor"="Patient"))
############################################################################################
meth.norm<-meth(rnb.set.norm,row.names=T)
colnames(meth.norm) = as.character(rnb.set.norm@pheno[,1])
rownames(meth.norm) = rownames(rnb.set.norm@sites)
mval.norm <- mval(rnb.set.norm,row.names=T)
############################################################################################
#  BRAF
rnb.set.norm.noNA=remove.samples(rnb.set.norm,samples(rnb.set.norm)[rnb.set.norm@pheno[,'BRAF']=="NA"])
BRAF <- rnb.execute.computeDiffMeth(rnb.set.norm.noNA,pheno.cols=c("BRAF"))
comparison <- get.comparisons(BRAF)[1]
BRAF_table <-get.table(BRAF, comparison, "sites", return.data.frame=TRUE)
table(BRAF_table$diffmeth.p.adj.fdr<0.1) # 3 cpg
############################################################################################
#  NRAS
rnb.set.norm.noNA=remove.samples(rnb.set.norm,samples(rnb.set.norm)[rnb.set.norm@pheno[,'NRAS']=="NA"])
NRAS <- rnb.execute.computeDiffMeth(rnb.set.norm.noNA,pheno.cols=c("NRAS"))
comparison <- get.comparisons(NRAS)[1]
NRAS_table <-get.table(NRAS, comparison, "sites", return.data.frame=TRUE)
table(NRAS_table$diffmeth.p.adj.fdr<0.1) # 327 cpg
############################################################################################
#  NF1
rnb.set.norm.noNA=remove.samples(rnb.set.norm,samples(rnb.set.norm)[rnb.set.norm@pheno[,'NF1']=="NA"])
NF1 <- rnb.execute.computeDiffMeth(rnb.set.norm.noNA,pheno.cols=c("NF1"))
comparison <- get.comparisons(NF1)[1]
NF1_table <-get.table(NF1, comparison, "sites", return.data.frame=TRUE)
table(NF1_table$diffmeth.p.adj.fdr<0.1) # 23 cpg
############################################################################################
#BRAF VS NRAS nevi
rnb.set.norm.nevi=remove.samples(rnb.set.norm,samples(rnb.set.norm)[rnb.set.norm@pheno[,'Tumor']=="Melanoma"])
rnb.set.norm.nevi.noEQ=remove.samples(
           rnb.set.norm.nevi,samples(rnb.set.norm.nevi)[rnb.set.norm.nevi@pheno[,c(9)]==rnb.set.norm.nevi@pheno[,c(10)]])

b_vs_n <- rnb.execute.computeDiffMeth(rnb.set.norm.nevi.noEQ,pheno.cols=c("BRAF"))
comparison <- get.comparisons(b_vs_n)[1]
b_vs_n_table <-get.table(b_vs_n, comparison, "sites", return.data.frame=TRUE)
table(b_vs_n_table$diffmeth.p.adj.fdr<0.1) # 2 cpg

############################################################################################
############################################################################################
options(scipen=999)
library(gplots)
library(factoextra)
library(RColorBrewer)
colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(9))
source('https://raw.githubusercontent.com/rtmag/tumor-meth-pipe/master/heatmap3.R')

clab=rnb.set.norm@pheno[,9:11]
clab[,1] = as.character(clab[,1])
clab[,2] = as.character(clab[,2])
clab[,3] = as.character(clab[,3])
clab[clab=="WT"]="blue"
clab[clab=="NA"]="grey"
clab[clab=="MUT"]="red"
meth.norm.sig = meth.norm[BRAF_table$diffmeth.p.adj.fdr<0.1 | NRAS_table$diffmeth.p.adj.fdr<0.1 |NF1_table$diffmeth.p.adj.fdr<0.1,]

png("heatmap-test.png",width= 3.25,
  height= 5.25,units="in",
  res=1200,pointsize=4)
heatmap.3(as.matrix(meth.norm.sig),col=colors,scale="none", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="", ylab="CpGs",key.title="Methylation lvl",ColSideColors=as.matrix(clab))
dev.off()

legend("topright",legend=c("Melanoma","Nevi","MIS"),fill=c("#ffb3ba","#baffc9","#bae1ff"), border=T, bty="n" )


########
# center analysis

meth.norm.centered = readRDS('/home/rtm/vivek/navi/EPIC_2nd_batch/RnBeads/RnBeads_differential/meth.norm.centered.rds')
meth.norm.centered.sig = meth.norm.centered[row.names(meth.norm.centered) %in% row.names(meth.norm.sig),]
png("heatmap-mut_sig_cpg_centered.png",width= 3.25,
  height= 5.25,units="in",
  res=1200,pointsize=4)
heatmap.3(as.matrix(meth.norm.centered.sig),col=colors,scale="none", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="", ylab="CpGs",key.title="Methylation lvl",ColSideColors=as.matrix(clab))
dev.off()

############################################################################################
#  NEVI VS MELANOMA
cpgs<-readRDS("/home/rtm/vivek/navi/EPIC_2nd_batch/LinearModel_132_CpG.rds")
#non centered
meth.norm.sig = meth.norm[row.names(meth.norm) %in% cpgs,]
png("heatmap-nevi_vs_melanoma_mutInfo.png",width= 3.25,
  height= 5.25,units="in",
  res=1200,pointsize=4)
heatmap.3(as.matrix(meth.norm.sig),col=colors,scale="none", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="", ylab="CpGs",key.title="Methylation lvl",ColSideColors=as.matrix(clab))
dev.off()

#centered
meth.norm.centered.sig = meth.norm.centered[row.names(meth.norm.centered) %in% cpgs,]
png("heatmap-nevi_vs_melanoma_centered_mutInfo.png",width= 3.25,
  height= 5.25,units="in",
  res=1200,pointsize=4)
heatmap.3(as.matrix(meth.norm.centered.sig),col=colors,scale="none", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="", ylab="CpGs",key.title="Methylation lvl",ColSideColors=as.matrix(clab))
dev.off()
############################################################################################
############################################################################################
############################################################################################
#  BRAF
rnb.set.norm.noNA=remove.samples(rnb.set.norm,samples(rnb.set.norm)[rnb.set.norm@pheno[,'BRAF']=="NA"])
BRAF <- rnb.execute.computeDiffMeth(rnb.set.norm.noNA,pheno.cols=c("BRAF"))
comparison <- get.comparisons(BRAF)[1]
BRAF_table <-get.table(BRAF, comparison, "sites", return.data.frame=TRUE)
table(BRAF_table$diffmeth.p.adj.fdr<0.1) # 3 cpg



