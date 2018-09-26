###############################################################################################################################
### STD PIPE ###
library(RnBeads)

## Preprocess Sample Sheet ##
pre_sample_sheet = read.table(
    pipe("grep 'VM' /home/rtm/vivek/navi/EPIC/2018_09_18_Vivek_GenStudSS_FFPE_16.csv|perl -pe 's/\\,/\\t/g'|cut -f1,6,7")
    )

colnames(pre_sample_sheet) = c("Sample_ID","Sentrix_ID","Sentrix_Position")
write.csv(pre_sample_sheet,"rnbeads_sample_sheet.csv",row.names=F)

## Options and Parameters ##

# Analysis Directories
idat.dir <- file.path("/home/rtm/vivek/navi/EPIC/idat_Raw_Data")
print(idat.dir)

sample.annotation <- file.path("/home/rtm/vivek/navi/EPIC/rnbeads_sample_sheet.csv")
rnb.options(import.table.separator=",")

report.dir <- file.path("/home/rtm/ctrad/GC_Illumina02/DNA_Methylation/RnBeads")



# Multiprocess
num.cores <- 40
parallel.setup(num.cores)

sample.annotation <- file.path("/home/rtm/ctrad/GC_Illumina02/DNA_Methylation/sample_annotation_edited.csv")

print(sample.annotation)
