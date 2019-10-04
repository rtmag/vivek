suppressMessages(library(RnBeads))

options(scipen=999)
library(gplots)
library(factoextra)
library(RColorBrewer)
colors <- rev(colorRampPalette( (brewer.pal(9, "RdBu")) )(9))
options(bitmapType="cairo")
############################################################################################
rnb.set.norm=load.rnb.set("/home/rtm/vivek/navi/EPIC_2nd_batch/RnBeads/RnBeads_normalization/rnb.set.norm.filtered.RData.zip")
beta <- meth(rnb.set.norm,row.names=TRUE)

meth.filtered.centered = readRDS('/home/rtm/vivek/navi/EPIC_2nd_batch/RnBeads/RnBeads_differential/meth.norm.centered.rds')
meth.filtered.centered<-meth.filtered.centered[rownames(meth.filtered.centered) %in% rownames(beta),]

meth.filtered.centered.sd <- apply(meth.filtered.centered,1,sd)
beta.sd <- apply(beta,1,sd)

# 0.5 %
beta.005<-beta[ order(beta.sd,decreasing=TRUE)[1:round(length(beta.sd)*0.005)], ]

# 1%

# 2.5%

# 5%

# 10%

# 20%%
