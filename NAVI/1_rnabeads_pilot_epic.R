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

#idat files
idat.dir <- file.path("/home/rtm/vivek/navi/EPIC/idat_Raw_Data")

# Sample annotation
sample.annotation <- file.path("/home/rtm/vivek/navi/EPIC/rnbeads_sample_sheet.csv")
rnb.options(import.table.separator=",")

# Report directory
system("rm -fr /home/rtm/vivek/navi/EPIC/RnBeads/RnBeads_report")
report.dir <- file.path("/home/rtm/vivek/navi/EPIC/RnBeads/RnBeads_report")

# Analysis directory
analysis.dir <- "/home/rtm/vivek/navi/EPIC/RnBeads/RnBeads_analysis"

# Vanilla parameters
rnb.options(filtering.sex.chromosomes.removal=TRUE, identifiers.column="Sample_ID")
rnb.options(differential=FALSE)

# Normalization parameters
rnb.options(normalization=TRUE,normalization.method="swan",normalization.background.method="methylumi.noob")

# Multiprocess
num.cores <- 20
parallel.setup(num.cores)

rnb.run.analysis(dir.reports=report.dir, sample.sheet=sample.annotation, data.dir=idat.dir, data.type="infinium.idat.dir")
###############################################################################################################################
