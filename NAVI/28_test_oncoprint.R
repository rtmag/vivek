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
mut.mat <- readRDS("mut.mat.RDS")
mut.csum = colSums(mut.mat != "WT")
#mut.30p = mut.csum[ (mut.csum / dim(mut.mat)[1]) > .30 ]
#mut_sig = mut.mat[ , colnames(mut.mat) %in% names(mut.30p)]
#saveRDS(mut_sig,"mut_matrix_30perc.rds")

selectGene<-names(sort(mut.csum)[sort(mut.csum)>4])

mx=colnames(mut.mat) %in% selectGene
x = mut.mat[,mx]
rownames(x) = gsub(".uf","",rownames(x))
x[x=="WT"]=""
x[x=="Missense_Mutation"]="Missense_Mutation"
x[x=="Nonsense_Mutation"]="Nonsense_Mutation"
x[x=="In_Frame_Del"]="InFrame_Del"
x[x=="Frame_Shift_Del"]="FrameShift_Del"
x[x=="Frame_Shift_Ins"]="FrameShift_Ins"
x[x=="In_Frame_Ins"]=""

library(ComplexHeatmap)
col = c("Missense_Mutation" = "#EC2049",
        "Nonsense_Mutation" = "#2F9599",
        "Alterations" = "#355C7D",
        "InFrame_Del" = "#E8B71A",
        "FrameShift_Del" = "#9B539C",
        "FrameShift_Ins" = "#DD5F32")

alter_fun = list(
    background = function(x, y, w, h) {
        grid.rect(x, y, w-unit(0.5, "mm"), h-unit(0.5, "mm"), 
            gp = gpar(fill = "#CCCCCC", col = NA))
    },
    # bug red
    Missense_Mutation = function(x, y, w, h) {
        grid.rect(x, y, w-unit(0.5, "mm"), h-unit(0.5, "mm"), 
            gp = gpar(fill = col["Missense_Mutation"], col = NA))
    },
    Nonsense_Mutation = function(x, y, w, h) {
        grid.rect(x, y, w-unit(0.5, "mm"), h-unit(0.5, "mm"), 
            gp = gpar(fill = col["Nonsense_Mutation"], col = NA))
    },
    Alterations = function(x, y, w, h) {
        grid.rect(x, y, w-unit(0.5, "mm"), h-unit(0.5, "mm"), 
            gp = gpar(fill = col["Alterations"], col = NA))
    },
    InFrame_Del = function(x, y, w, h) {
        grid.rect(x, y, w-unit(0.5, "mm"), h-unit(0.5, "mm"), 
            gp = gpar(fill = col["InFrame_Del"], col = NA))
    },
    FrameShift_Del = function(x, y, w, h) {
        grid.rect(x, y, w-unit(0.5, "mm"), h-unit(0.5, "mm"), 
            gp = gpar(fill = col["FrameShift_Del"], col = NA))
    },
    FrameShift_Ins = function(x, y, w, h) {
        grid.rect(x, y, w-unit(0.5, "mm"), h-unit(0.5, "mm"), 
            gp = gpar(fill = col["FrameShift_Ins"], col = NA))
    }
)

heatmap_legend_param = list(title = "Alterations", 
                            at = c( "Missense_Mutation","Nonsense_Mutation","Alterations",
                                      "InFrame_Del","FrameShift_Del","FrameShift_Ins"), 
                            labels = c( "Missense Mutation","Nonsense Mutation","Alterations",
                                      "InFrame Del","FrameShift Del","FrameShift Ins"))
pdf("oncoprint_top54.pdf",height=20)
oncoPrint(t(x),show_column_names = TRUE,
    alter_fun = alter_fun, col = col, 
     heatmap_legend_param = heatmap_legend_param)
dev.off()
