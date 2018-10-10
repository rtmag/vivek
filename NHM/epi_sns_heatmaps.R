options(bitmapType="cairo")
options(scipen=999)
library(gplots)
library(factoextra)
library(RColorBrewer)

epi = read.table("~/Downloads/epigenetic_genes.txt",header=F)
epi = as.character(epi[,1])


epianno = read.table("~/Downloads/epigenetic_factor_withAnno.txt",header=F,stringsAsFactors=F)

vsd = readRDS("NHM_vsd.rds")
vsd = vsd[,c(10:12,1:3,7:9,4:6)]

##########
countData=readRDS("NHM_counts.rds")
library(DESeq2)

design<-data.frame(group=c("BRAF","BRAF","BRAF",
                "B_C","B_C","B_C",
                "CDKN2A","CDKN2A","CDKN2A",
                "NHM","NHM","NHM") )

dLRT <- DESeqDataSetFromMatrix(countData = countData, colData = design, design = ~ group )
dLRT <- DESeq(dLRT, test="LRT", reduced=~1)
dLRT_res = results(dLRT)
#########
pdf("NHM_ALL_epigeneticFactors.pdf")
colors <-  greenred(9)
sig_vsd = vsd[which(dLRT_res$padj<0.001 & dLRT_res$baseMean>250),]
sig_vsd = vsd[rownames(vsd) %in% epi,]
sig_vsd = sig_vsd[apply(sig_vsd,1,sd)!=0,]
colnames(sig_vsd) = c("NHM","NHM","NHM","BRAF","BRAF","BRAF","CDKN2A","CDKN2A","CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A")
heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,Colv=F,
xlab="",ylab="",main="Epigenetic Factors",key.title="Gene expression",cexCol=.65,cexRow=.1,dendrogram="row",density.info="none")
dev.off()

colors <-  greenred(9)
sig_vsd = vsd[which(dLRT_res$padj<0.001 & dLRT_res$baseMean>250),]
sig_vsd = vsd[rownames(vsd) %in% epianno[,1],]
sig_vsd = sig_vsd[apply(sig_vsd,1,sd)!=0,]

ix=match(rownames(sig_vsd), epianno[,1])
note= epianno[ix[!is.na(ix)],2:3]
note = paste(note[,1],note[,2])

track=as.character(note)
track[track=="Melanoma"]=1
track[track=="Nevi"]=2
track[track=="MIS"]=3


track=as.numeric(track)
colores=c("#ffb3ba","#baffc9","#bae1ff")
clab=as.character(colores[track])

colnames(sig_vsd) = c("NHM","NHM","NHM","BRAF","BRAF","BRAF","CDKN2A","CDKN2A","CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A")
heatmap.2(sig_vsd,col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,Colv=F,
xlab="",ylab="",main="Epigenetic Factors",key.title="Gene expression",cexCol=.65,cexRow=.1,dendrogram="row",density.info="none")
#########################

data = vsd
sns_class = c("CDKN1A","CDKN2A","CDKN2B","CDK4","CDK6","CDK2","RB1","NOTCH3","LMNB1",
              "CXCL1","CXCL2","IL6","IL8","IL10","SIRT1","MAPK11","GLB1","NOTCH1")

# 10 gene Marker Althubiti, et al. Cell Death and Disease 2014.
SNS_10 = c("DEP10","NTAL","EBP50","STX4","VAMP3","ARMCX3","B2MG","LANCL1","VPS26A","PLD3")

# 20 gene Marker Nagano, et al. Scientific Reports 2016.
SNS_20 = c("PVRL4","GPR172B","DAO","CCDC74B","LOXL4","EVL","PRODH","E2F7","LY6D","IGFBP2","CRABP2","EPN3","APOBEC3B","IER5",
          "ANGPTL2","SLC48AI","WBSCR27","E2F2","NXPH4","PPMID","CDKN1A","BTG2","SULF2")

SNS_20_p53_dependent = c("PVRL4","PRODH","LY6D","DAO","EPN3","GPR172B")

# Apoptosis RT2 Profiler PCR Array https://www.qiagen.com/ca/shop/pcr/primer-sets/rt2-profiler-pcr-arrays/?catno=PAHS-012Z#geneglobe
DNA_damage_repair = c("ABL1", "CIDEA", "CIDEB", "TP53", "TP73")
extracellular_signal = c("CFLAR", "DAPK1", "TNFRSF25")
pro_apoptotic = c("BAD", "BAK1", "BAX", "BCL10", "BCL2L11", "BID", "BIK", "BNIP3", "BNIP3L", "CASP1", "CASP10", "CASP14", "CASP2",
 "CASP3", "CASP4", "CASP6", "CASP8", "CD27", "CD70", "CYCS", "DFFA", "DIABLO", "FAS", "FASLG", "GADD45A", "HRK", "LTA", "NOD1", 
 "PYCARD", "TNFRSF10A", "TNFRSF9", "TNFSF10", "TNFSF8", "TP53BP2", "TRADD", "TRAF3")

anti_apoptotic = c("AKT1", "BAG1", "BAG3", "BAX", "BCL2", "BCL2A1", "BCL2L1", "BCL2L10", "BCL2L2", "BFAR", "BIRC3", "BIRC5", 
"BIRC6", "BNIP2", "BNIP3", "BNIP3L", "BRAF", "CD27", "CD40LG", "CFLAR", "DAPK1", "FAS", "HRK", "IGF1R", "IL10", "MCL1", "NAIP", 
"NFKB1", "NOL3", "RIPK2", "TNF", "XIAP")

negative_regulation_apoptosis = c("BAG1", "BAG3", "BCL10", "BCL2", "BCL2A1", "BCL2L1", "BCL2L10", "BCL2L2",
 "BFAR", "BIRC2", "BIRC3", "BIRC6", "BNIP2", "BNIP3", "BNIP3L", "BRAF", "CASP3", "CD27", "CD40LG", "CFLAR", 
 "CIDEA", "DAPK1", "DFFA", "FAS", "IGF1R", "MCL1", "NAIP", "NOL3", "TP53", "TP73", "XIAP")
positive_regulation_apoptosis = c("ABL1", "AKT1", "BAD", "BAK1", "BAX", "BCL2L11", "BID", "BIK", "BNIP3", "BNIP3L",
 "CASP1", "CASP10", "CASP14", "CASP2", "CASP4", "CASP6", "CASP8", "CD40", "CD70", "CIDEB", "CRADD", "FADD", "FASLG",
  "HRK", "LTA", "LTBR", "NOD1", "PYCARD", "RIPK2", "TNF", "TNFRSF10A", "TNFRSF10B", "TNFRSF25", "TNFRSF9", "TNFSF10",
  "TNFSF8", "TP53", "TP53BP2", "TRADD", "TRAF2", "TRAF3")

death_domain_receptor = c("CRADD", "DAPK1", "FADD", "TNFRSF10A", "TNFRSF10B", "TNFRSF11B", "TNFRSF1A", "TNFRSF1B", 
"TNFRSF21", "TNFRSF25", "TRADD","TNF")

caspases = c( "CASP1", "CASP10", "CASP14", "CASP2", "CASP3", "CASP4", "CASP5", "CASP6", "CASP7", "CASP8", "CASP9",
 "CFLAR", "CRADD", "PYCARD")
caspase_activation = c("AIFM1", "APAF1", "BAX", "BCL2L10", "CASP1", "CASP9", "NOD1", "PYCARD", "TNFRSF10A", "TNFRSF10B", "TP53")
caspase_inhibition = c("CD27", "XIAP")



colnames(data) = c("NHM","NHM","NHM","BRAF","BRAF","BRAF","CDKN2A","CDKN2A","CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A","BRAF+CDKN2A")

### SNS Classic
pdf("sns_class.pdf")
sig_vsd = data[rownames(data) %in% sns_class,]
  heatmap.2(as.matrix(sig_vsd),col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="",main="Senescence Classic Genes",key.title="Gene expression",cexCol=.65,cexRow=.7,dendrogram="row",Colv=F)
dev.off()
### SNS 10 genes
pdf("SNS_10.pdf")
sig_vsd = data[rownames(data) %in% SNS_10,]
  heatmap.2(as.matrix(sig_vsd),col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="",main="Senescence Althubiti, et al.\nCell Death and Disease 2014",key.title="Gene expression",cexCol=.65,cexRow=.7
            ,dendrogram="row",Colv=F)
dev.off()
### SNS 20 genes
pdf("SNS_20.pdf")
sig_vsd = data[rownames(data) %in% SNS_20,]
  heatmap.2(as.matrix(sig_vsd),col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="",main="Senescence Nagano, et al.\nScientific Reports 2016",key.title="Gene expression",cexCol=.65,cexRow=.7,
            dendrogram="row",Colv=F)
dev.off()
### SNS_20_p53_dependent
pdf("SNS_20_p53_dependent.pdf")
sig_vsd = data[rownames(data) %in% SNS_20_p53_dependent,]
  heatmap.2(as.matrix(sig_vsd),col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="",main="Senescence Nagano, et al. \nScientific Reports 2016",key.title="Gene expression",cexCol=.65,cexRow=.7,
            dendrogram="row",Colv=F)
dev.off()
### DNA_damage_repair
pdf("DNA_damage_repair.pdf")
sig_vsd = data[rownames(data) %in% DNA_damage_repair,]
  heatmap.2(as.matrix(sig_vsd),col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="",main="DNA Damage and Repair",key.title="Gene expression",cexCol=.65,cexRow=.7,
            dendrogram="row",Colv=F)
dev.off()
### extracellular_signal
pdf("extracellular_signal.pdf")
sig_vsd = data[rownames(data) %in% extracellular_signal,]
  heatmap.2(as.matrix(sig_vsd),col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="",main="Apoptosis extracellular\nsignal",key.title="Gene expression",cexCol=.65,cexRow=.7,
            dendrogram="row",Colv=F)
### pro_apoptotic
pdf("pro_apoptotic.pdf")
sig_vsd = data[rownames(data) %in% pro_apoptotic,]
  heatmap.2(as.matrix(sig_vsd),col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="",main="Pro Apoptotic",key.title="Gene expression",cexCol=.65,cexRow=.7,
            dendrogram="row",Colv=F)
dev.off()
### DNA_damage_repair
pdf("anti_apoptotic.pdf")
sig_vsd = data[rownames(data) %in% anti_apoptotic,]
  heatmap.2(as.matrix(sig_vsd),col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="",main="Anti Apoptotic",key.title="Gene expression",cexCol=.65,cexRow=.7,
            dendrogram="row",Colv=F)
dev.off()
### negative_regulation_apoptosis
pdf("negative_regulation_apoptosis.pdf")
sig_vsd = data[rownames(data) %in% negative_regulation_apoptosis,]
  heatmap.2(as.matrix(sig_vsd),col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="",main="Negative Regulation Apoptosis",key.title="Gene expression",cexCol=.65,cexRow=.7,
            dendrogram="row",Colv=F)
dev.off()
### positive_regulation_apoptosis
pdf("positive_regulation_apoptosis.pdf")
sig_vsd = data[rownames(data) %in% positive_regulation_apoptosis,]
  heatmap.2(as.matrix(sig_vsd),col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="",main="Positive Regulation Apoptotis",key.title="Gene expression",cexCol=.65,cexRow=.7,
            dendrogram="row",Colv=F)
dev.off()
### death_domain_receptor
pdf("death_domain_receptor.pdf")
sig_vsd = data[rownames(data) %in% death_domain_receptor,]
  heatmap.2(as.matrix(sig_vsd),col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="",main="Death Domain Receptor",key.title="Gene expression",cexCol=.65,cexRow=.7,
            dendrogram="row",Colv=F)
dev.off()
### caspases
pdf("caspases.pdf")
sig_vsd = data[rownames(data) %in% caspases,]
  heatmap.2(as.matrix(sig_vsd),col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="",main="Caspases",key.title="Gene expression",cexCol=.65,cexRow=.7,
            dendrogram="row",Colv=F)
dev.off()
### caspase_activation
pdf("caspase_activation.pdf")
sig_vsd = data[rownames(data) %in% caspase_activation,]
  heatmap.2(as.matrix(sig_vsd),col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="",main="Caspase Activation",key.title="Gene expression",cexCol=.65,cexRow=.7,
            dendrogram="row",Colv=F)
dev.off()
### caspase_inhibition
pdf("caspase_inhibition.pdf")
sig_vsd = data[rownames(data) %in% caspase_inhibition,]
  heatmap.2(as.matrix(sig_vsd),col=colors,scale="row", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
  xlab="", ylab="",main="Caspase Inhibition",key.title="Gene expression",cexCol=.65,cexRow=.7,
            dendrogram="row",Colv=F)
dev.off()
#####################
