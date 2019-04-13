
# Removing Patient pairing
rnb.options("columns.pairing"=NULL)
MvsN_dmc_noPatient <- rnb.execute.computeDiffMeth(rnb.set.norm_no910,pheno.cols=c("Tumor"))

comparison <- get.comparisons(MvsN_dmc_noPatient)[1]
dmc_noPatient_table <-get.table(MvsN_dmc_noPatient, comparison, "sites", return.data.frame=TRUE)
saveRDS(dmc_noPatient_table,"dmc_MvsN_NoPatient.rds")
