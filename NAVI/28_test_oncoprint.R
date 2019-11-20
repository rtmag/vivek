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


# MCNEMAR TEST
mut.mat <- readRDS("mut.mat.RDS")
mut.mat <- mut.mat[order(nchar(row.names(mut.mat))),]
mut.mat[mut.mat!="WT"] = "Alt"

type <- rep(c("Melanoma","Nevi"),length=dim(mut.mat)[1])
test_results <- 1:dim(mut.mat)[2]
names(test_results) <- colnames(mut.mat)
for( ix in 1:dim(mut.mat)[2] ){   
    mydf<-data.frame( Melanoma = factor(mut.mat[type=="Melanoma",ix], levels = c("Alt", "WT") ),
                  Nevi = factor(mut.mat[type=="Nevi",ix], levels = c("Alt", "WT")) )
    tt = with(mydf, table(Melanoma, Nevi))
    test_results[ix] <- mcnemar.test(tt)$p.value
    }

# ratio TEST
ratio_results <- 1:dim(mut.mat)[2]
names(ratio_results) <- colnames(mut.mat)
for( ix in 1:dim(mut.mat)[2] ){   
    mel_tab <- table(factor(mut.mat[type=="Melanoma",ix], levels = c("Alt", "WT") ))[1]
    mel_sum <- sum(table(factor(mut.mat[type=="Melanoma",ix], levels = c("Alt", "WT") )))
    nev_tab <- table(factor(mut.mat[type=="Nevi",ix], levels = c("Alt", "WT") ))[1]
    nev_sum <- sum(table(factor(mut.mat[type=="Nevi",ix], levels = c("Alt", "WT") )))
    ratio_results[ix] <- (mel_tab/mel_sum) - (nev_tab/nev_sum)
    }

###########################

selectGene <- names(test_results[which(test_results<0.25)])
selectGene <- names(ratio_results[(ratio_results>.3)])

mx=colnames(mut.mat) %in% selectGene
mut.mat <- readRDS("mut.mat.RDS")
mut.mat <- mut.mat[order(nchar(row.names(mut.mat))),]
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

column_ha = HeatmapAnnotation(Type = as.character(type),
                              col = list(Type = c("Nevi" = "blue", "Melanoma" = "red"))
                                      )

pdf("oncoprint_ratio33.pdf",height=5)
oncoPrint(t(x),show_column_names = TRUE,column_split=as.character(type),
    alter_fun = alter_fun, col = col, bottom_annotation = column_ha,
     heatmap_legend_param = heatmap_legend_param)
dev.off()

####################################################################################################################################
####################################################################################################################################
####################################################################################################################################
####################################################################################################################################

mut.mat <- readRDS("mut.mat.RDS")
mut.mat <- mut.mat[order(nchar(row.names(mut.mat))),]
ix <- rep(1:(dim(mut.mat)[1]/2),2)
ix <- sort(ix)

for( i in min(ix):max(ix) ){
    pat<-t(mut.mat[ix ==i ,])
    pat_num<-gsub(".uf","",colnames(pat)[2])
    pat_num<-as.numeric(gsub("VM","",pat_num))/2
    write.csv(pat,paste0("patient_mutation_files/mutation_information_patient_",pat_num,".csv") )
    pat.ci<-pat[apply(pat,1,function(x) sum(x!="WT") )>0,]
    write.csv(pat.ci,paste0("patient_mutation_files/Altered_mutation_information_patient_",pat_num,".csv") )
}

