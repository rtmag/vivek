source("https://raw.githubusercontent.com/rtmag/refactor/master/R/refactor.R")

 tumor = c("Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi",
                     "Melanoma","MIS","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi",
                    "Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi",
                    "Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi",
                    "Melanoma","Nevi","Nevi","Melanoma","Melanoma","Nevi","Melanoma","Nevi",
                    "Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi","Melanoma","Nevi")
                    
meth.filtered = readRDS("meth.filtered.rds")
nevi = meth.filtered[,tumor=="Nevi"]
k = 5
datafile = nevi
results <- refactor(datafile,k)
RC <- results$refactor_components # Extract the ReFACTor components
ranked_list <- results$ranked_list # Extract the list of sites ranked by ReFACTor

# Can also provide one or more of the optional arguments
results <- refactor(datafile,k,covarfile="../demo_files/demo_covariates.txt",t=500,numcomp=10,stdth=0.01,out="demo_results")


png("heatmap_top10000_CpG_highestVariability_nevi.png",width= 3.25,
  height= 3.25,units="in",
  res=1200,pointsize=4)
topnevi = tail(sort(neviSD),10000)
all.meth.norm = nevi[rownames(nevi) %in% names(topnevi), ]
heatmap.2(as.matrix(all.meth.norm),col=colors,scale="none", trace="none",distfun = function(x) get_dist(x,method="pearson"),srtCol=90,
labRow = FALSE,xlab="", ylab="CpGs",key.title="Methylation lvl")
dev.off()
