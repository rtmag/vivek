###############################################################################################################################
### STD PIPE ###
library(RnBeads)
options(bitmapType="cairo")

## Preprocess Sample Sheet ##
pre_sample_sheet_pilot = read.table(
    pipe("grep 'BN' /home/rtm/vivek/navi/new_epic/2019_09_18_UCSF_EPIC_GenStudSS.csv| \
    perl -pe 's/\\,/\\t/g'|perl -pe 's/ BN/_BN/g'|cut -f1,6,7")
    )
    
colnames(pre_sample_sheet) = c("Sample_ID","Sentrix_ID","Sentrix_Position")
write.csv(pre_sample_sheet,"new_nevi_epic_sample_sheet.csv",row.names=F)


## Options and Parameters ##

#idat files
idat.dir <- file.path("/home/rtm/vivek/navi/EPIC/idat_Raw_Data")
