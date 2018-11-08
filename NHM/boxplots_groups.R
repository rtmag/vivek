vsd = readRDS("NHM_vsd.rds")
vsd = vsd[,c(10:12,1:3,7:9,4:6)]

boxploter=function(name_gene){
id=which(rownames(vsd)==name_gene)
                               
bdata = vsd[id,]

boxplot(bdata[1:3],bdata[4:6],bdata[7:9],bdata[10:12],names=c("NHM","BRAF","CDKN2A","BRAF+CDKN2A"), 
        main = name_gene, col=c("#ffb3ba","#baffc9","#bae1ff","#ff8c00"),outline=F,ylab = "log2 Normalized Read Counts",las=2)
                              } 
                              
boxploter_fix=function(name_gene){
id=which(rownames(vsd)==name_gene)
                               
bdata = vsd[id,]

boxplot(bdata[1:3],bdata[4:6],bdata[7:9],bdata[10:12],names=c("NHM","BRAF","CDKN2A","BRAF+CDKN2A"),ylim=c(5,13),
        main = name_gene, col=c("#ffb3ba","#baffc9","#bae1ff","#ff8c00"),outline=F,ylab = "log2 Normalized Read Counts",las=2)
                              } 

pdf("1st_group.pdf")
par(mfrow=c(3,3))
boxploter("KIFC1")
boxploter("KIF22")
boxploter("TOP2A")

boxploter("SNAI1")
boxploter("SNAI2")
boxploter("TWIST1")

boxploter("FOXC2")
boxploter("CDH1")
boxploter("CDH2")
dev.off()

pdf("1st_group_sameScale.pdf")
par(mfrow=c(3,3))
boxploter_fix("KIFC1")
boxploter_fix("KIF22")
boxploter_fix("TOP2A")

boxploter_fix("SNAI1")
boxploter_fix("SNAI2")
boxploter_fix("TWIST1")

boxploter_fix("FOXC2")
boxploter_fix("CDH1")
boxploter_fix("CDH2")
dev.off()

pdf("2nd_group.pdf")
par(mfrow=c(3,3))
boxploter("MITF")
boxploter("SOX10")
boxploter("SOX9")

boxploter("PAX3")
boxploter("DCT")
boxploter("NGFR")

boxploter("TPD52")
boxploter("FOXD3")
dev.off()

pdf("2nd_group_sameScale.pdf")
par(mfrow=c(3,3))
boxploter_fix("MITF")
boxploter_fix("SOX10")
boxploter_fix("SOX9")

boxploter_fix("PAX3")
boxploter_fix("DCT")
boxploter_fix("NGFR")

boxploter_fix("TPD52")
boxploter_fix("FOXD3")
dev.off()


pdf("3rd_group.pdf")
par(mfrow=c(3,3))
boxploter("EZH2")
boxploter("SUZ12")
boxploter("EED")
dev.off()

pdf("3rd_group_sameScale.pdf")
par(mfrow=c(3,3))
boxploter_fix("EZH2")
boxploter_fix("SUZ12")
boxploter_fix("EED")
dev.off()
