###############################################################################################################################
### STD PIPE ###
suppressMessages(library(RnBeads))
options(bitmapType="cairo")

## Preprocess Sample Sheet ##
pre_sample_sheet = read.table(
    pipe("grep 'R0' /home/rtm/vivek/navi/new_epic/2019_09_18_UCSF_EPIC_GenStudSS.csv| \
    perl -pe 's/\\,/\\t/g'|perl -pe 's/ BN/_BN/g'|cut -f1,6,7")
    )
    
colnames(pre_sample_sheet) = c("Sample_ID","Sentrix_ID","Sentrix_Position")
write.csv(pre_sample_sheet,"/home/rtm/vivek/navi/new_epic/new_nevi_epic_sample_sheet.csv",row.names=F)

## Options and Parameters ##

#idat files
idat.dir <- file.path("/home/rtm/vivek/navi/new_epic/Rawdata")

# Sample annotation
sample.annotation <- file.path("/home/rtm/vivek/navi/new_epic/new_nevi_epic_sample_sheet.csv")
rnb.options(import.table.separator=",")

system("rm -fr /home/rtm/vivek/navi/new_epic/RnBeads/RnBeads_report")
report.dir <- file.path("/home/rtm/vivek/navi/new_epic/RnBeads/RnBeads_report")

analysis.dir <- "/home/rtm/vivek/navi/new_epic/RnBeads/RnBeads_analysis"

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
## preprocessing
#idat files
idat.dir <- file.path("/home/rtm/vivek/navi/new_epic/Rawdata")

# Sample annotation
sample.annotation <- file.path("/home/rtm/vivek/navi/new_epic/new_nevi_epic_sample_sheet.csv")
rnb.options(import.table.separator=",")

# Report directory
system("rm -fr /home/rtm/vivek/navi/new_epic/RnBeads/RnBeads_normalization")
report.dir <- file.path("/home/rtm/vivek/navi/new_epic/RnBeads/RnBeads_normalization")

# Vanilla parameters
rnb.options(identifiers.column="Sample_ID")

# Multiprocess
num.cores <- 20
parallel.setup(num.cores)

data.source <- c(idat.dir, sample.annotation)
result <- rnb.run.import(data.source=data.source,data.type="infinium.idat.dir", dir.reports=report.dir)
rnb.set.norm <- rnb.execute.normalization(result$rnb.set, method="swan",bgcorr.method="enmix.oob")

save.rnb.set(rnb.set.norm,path="/home/rtm/vivek/navi/new_epic/RnBeads/RnBeads_normalization/rnb.set.norm.RData")
###############################################################################################################################
rnb.set.filtered <- rnb.execute.context.removal(rnb.set.norm)$dataset
rnb.set.filtered <- rnb.execute.sex.removal(rnb.set.filtered)$dataset
rnb.set.filtered <- rnb.execute.snp.removal(rnb.set.filtered, snp="any")$dataset
rnb.set.filtered <- rnb.execute.na.removal(rnb.set.filtered)$dataset
save.rnb.set(rnb.set.filtered,path="/home/rtm/vivek/navi/new_epic/RnBeads/RnBeads_normalization/rnb.set.norm.filtered.RData")
#####################################################################################################################################
