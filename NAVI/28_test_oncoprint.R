system("grep -P -i "Missense_Mutation|Nonsense_Mutation|Nonstop_Mutation|_Del|_Ins" *maf| \
cut -f 1,5-10,35,37,38,41,42| grep -P -i "Missense_Mutation|Nonsense_Mutation|Nonstop_Mutation|_Del|_Ins"|cut -f1,6| \
perl -pe 's/all_//g'|perl -pe 's/\.maf\:/\t/g' > mutation_master_table.txt")

mut <- read.table("mutation_master_table.txt",sep="\t",header=FALSE,stringsAsFactors=FALSE)

mut.mat <- matrix("WT", nrow=length(unique(mut[,1])), ncol=length(unique(mut[,2])) )
rownames(mut.mat) <- sort(unique(mut[,1]))
colnames(mut.mat) <- sort(unique(mut[,2]))

for(ix in 1:dim(mut)[1]){ 
    if(mut.mat[mut[ix,1],mut[ix,2]] != mut[ix,3] & mut.mat[mut[ix,1],mut[ix,2]] != "WT"){ mut.mat[mut[ix,1],mut[ix,2]] <- "Alterations" }
    if(mut.mat[mut[ix,1],mut[ix,2]] == "WT"){ mut.mat[mut[ix,1],mut[ix,2]] <- mut[ix,3] }
}

saveRDS(mut.mat,"mut.mat.RDS")


mut.csum = colSums(mut.mat != "WT")
mut.30p = mut.csum[ (mut.csum / dim(mut.mat)[1]) > .30 ]
mut_sig = mut.mat[ , colnames(mut.mat) %in% names(mut.10p)]
saveRDS(mut_sig,"mut_matrix_10perc.rds")

library(ComplexHeatmap)

mx=colnames(mut_sig) %in% names(tail(gene_sorted,n=25))
x = mut_sig[,mx]
x[x==1] = "MUT"
x[x==0] = ""

library(ComplexHeatmap)
col = c("MUT" = "red")
alter_fun = list(
    background = function(x, y, w, h) {
        grid.rect(x, y, w-unit(0.5, "mm"), h-unit(0.5, "mm"), 
            gp = gpar(fill = "#CCCCCC", col = NA))
    },
    # bug red
    MUT = function(x, y, w, h) {
        grid.rect(x, y, w-unit(0.5, "mm"), h-unit(0.5, "mm"), 
            gp = gpar(fill = col["MUT"], col = NA))
    }
)

heatmap_legend_param = list(title = "Alterations", at = c( "MUT"), 
        labels = c("Mutation"))
pdf("oncoprint.pdf")
oncoPrint(t(x),
    alter_fun = alter_fun, col = col, 
     heatmap_legend_param = heatmap_legend_param)
dev.off()
