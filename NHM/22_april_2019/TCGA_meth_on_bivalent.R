# get bw meth
x = readRDS("/root/TCGA/Rnbeads/SKCM/RnBeads_normalization/betaVALUES.rds")
x1 = readRDS("/root/TCGA/Rnbeads/SKCM/RnBeads_normalization/betaVALUES_withNormal.rds")

info = read.csv("/root/TCGA/Rnbeads/SKCM/SKCM_TP53_mutation_info_withNormal.csv")

meanx = rowMeans(x)
