##### FRESH
# H3K4me3 :: E

computeMatrix reference-point \
-S \
/root/vivek/patient_chipseq/fresh/bw/GSM3934252_SKCM-M028-P008_E.bw \
/root/vivek/patient_chipseq/fresh/bw/GSM3934259_SKCM-M035-P010_E.bw \
/root/vivek/patient_chipseq/fresh/bw/GSM3934266_SKCM-M137-P008_E.bw \
/root/vivek/patient_chipseq/fresh/bw/GSM3934273_SKCM-M233-P010_E.bw \
/root/vivek/patient_chipseq/fresh/bw/GSM3934280_SKCM-M263-P011_E.bw \
/root/vivek/patient_chipseq/fresh/bw/GSM3934287_SKCM-M275-P008_E.bw \
/root/vivek/patient_chipseq/fresh/bw/GSM3934294_SKCM-M305-P009_E.bw \
/root/vivek/patient_chipseq/fresh/bw/GSM3934301_SKCM-M306-P008_E.bw \
/root/vivek/patient_chipseq/fresh/bw/GSM3934308_SKCM-M357-P010_E.bw \
/root/vivek/patient_chipseq/fresh/bw/GSM3934315_SKCM-M399-P010_E.bw \
/root/vivek/patient_chipseq/fresh/bw/GSM3934322_SKCM-M409-P011_E.bw \
/root/vivek/patient_chipseq/fresh/bw/GSM3934329_SKCM-M527-P010_E.bw \
/root/vivek/patient_chipseq/fresh/bw/GSM3934336_SKCM-M642-P008_E.bw \
/root/vivek/patient_chipseq/fresh/bw/GSM3934343_SKCM-M721-P010_E.bw \
/root/vivek/patient_chipseq/fresh/bw/GSM3934350_SKCM-M749-P010_E.bw \
/root/vivek/patient_chipseq/fresh/bw/GSM3934357_SKCM-M762-P008_E.bw \
/root/vivek/patient_chipseq/fresh/bw/GSM3934364_SKCM-M807-P010_E.bw \
/root/vivek/patient_chipseq/fresh/bw/GSM3934371_SKCM-M822-P010_E.bw \
/root/vivek/patient_chipseq/fresh/bw/GSM3934378_SKCM-M852-P008_E.bw \
/root/vivek/patient_chipseq/fresh/bw/GSM3934385_SKCM-M857-P010_E.bw \
-R /root/vivek/patient_chipseq/poised_kmeans_zmet_5k_3clusters.bed --referencePoint center \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out patient_fresh_H3K4me3_bs20.mat --outFileNameMatrix patient_fresh_H3K4me3_bs20_5k.txt

# H3K27me3 :: F

computeMatrix reference-point \
-S \
/root/vivek/patient_chipseq/fresh/bw/GSM3934253_SKCM-M028-P008_F.bw \
/root/vivek/patient_chipseq/fresh/bw/GSM3934260_SKCM-M035-P010_F.bw \
/root/vivek/patient_chipseq/fresh/bw/GSM3934267_SKCM-M137-P008_F.bw \
/root/vivek/patient_chipseq/fresh/bw/GSM3934274_SKCM-M233-P010_F.bw \
/root/vivek/patient_chipseq/fresh/bw/GSM3934281_SKCM-M263-P011_F.bw \
/root/vivek/patient_chipseq/fresh/bw/GSM3934288_SKCM-M275-P008_F.bw \
/root/vivek/patient_chipseq/fresh/bw/GSM3934295_SKCM-M305-P009_F.bw \
/root/vivek/patient_chipseq/fresh/bw/GSM3934302_SKCM-M306-P008_F.bw \
/root/vivek/patient_chipseq/fresh/bw/GSM3934309_SKCM-M357-P010_F.bw \
/root/vivek/patient_chipseq/fresh/bw/GSM3934316_SKCM-M399-P010_F.bw \
/root/vivek/patient_chipseq/fresh/bw/GSM3934323_SKCM-M409-P011_F.bw \
/root/vivek/patient_chipseq/fresh/bw/GSM3934330_SKCM-M527-P010_F.bw \
/root/vivek/patient_chipseq/fresh/bw/GSM3934337_SKCM-M642-P008_F.bw \
/root/vivek/patient_chipseq/fresh/bw/GSM3934344_SKCM-M721-P010_F.bw \
/root/vivek/patient_chipseq/fresh/bw/GSM3934351_SKCM-M749-P010_F.bw \
/root/vivek/patient_chipseq/fresh/bw/GSM3934358_SKCM-M762-P008_F.bw \
/root/vivek/patient_chipseq/fresh/bw/GSM3934365_SKCM-M807-P010_F.bw \
/root/vivek/patient_chipseq/fresh/bw/GSM3934372_SKCM-M822-P010_F.bw \
/root/vivek/patient_chipseq/fresh/bw/GSM3934379_SKCM-M852-P008_F.bw \
/root/vivek/patient_chipseq/fresh/bw/GSM3934386_SKCM-M857-P010_F.bw \
-R /root/vivek/patient_chipseq/poised_kmeans_zmet_5k_3clusters.bed --referencePoint center \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out patient_fresh_H3K27me3_bs20.mat --outFileNameMatrix patient_fresh_H3K27me3_bs20_5k.txt



##### stored
# H3K4me3 :: E

computeMatrix reference-point \
-S \
/root/vivek/patient_chipseq/stored/bw/GSM3934170_M-12_E.bw \
/root/vivek/patient_chipseq/stored/bw/GSM3934175_M-22_E.bw \
/root/vivek/patient_chipseq/stored/bw/GSM3934180_M-48_E.bw \
/root/vivek/patient_chipseq/stored/bw/GSM3934185_M-52_E.bw \
/root/vivek/patient_chipseq/stored/bw/GSM3934190_M-57_E.bw \
/root/vivek/patient_chipseq/stored/bw/GSM3934195_M-61_E.bw \
/root/vivek/patient_chipseq/stored/bw/GSM3934200_M-84_E.bw \
/root/vivek/patient_chipseq/stored/bw/GSM3934205_M-940_E.bw \
/root/vivek/patient_chipseq/stored/bw/GSM3934210_M-96_E.bw \
/root/vivek/patient_chipseq/stored/bw/GSM3934215_M-A2058_E.bw \
/root/vivek/patient_chipseq/stored/bw/GSM3934220_M-G361_E.bw \
/root/vivek/patient_chipseq/stored/bw/GSM3934225_M-HS934_E.bw \
/root/vivek/patient_chipseq/stored/bw/GSM3934230_M-WM115_E.bw \
/root/vivek/patient_chipseq/stored/bw/GSM3934235_M-WM165_E.bw \
/root/vivek/patient_chipseq/stored/bw/GSM3934240_M-WM266_E.bw \
/root/vivek/patient_chipseq/stored/bw/GSM3934245_M-WM793B_E.bw \
-R /root/vivek/patient_chipseq/poised_kmeans_zmet_5k_3clusters.bed --referencePoint center \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out patient_stored_H3K4me3_bs20.mat --outFileNameMatrix patient_stored_H3K4me3_bs20_5k.txt


# H3K27me3 :: F

computeMatrix reference-point \
-S \
/root/vivek/patient_chipseq/stored/bw/GSM3934171_M-12_F.bw \
/root/vivek/patient_chipseq/stored/bw/GSM3934176_M-22_F.bw \
/root/vivek/patient_chipseq/stored/bw/GSM3934181_M-48_F.bw \
/root/vivek/patient_chipseq/stored/bw/GSM3934186_M-52_F.bw \
/root/vivek/patient_chipseq/stored/bw/GSM3934191_M-57_F.bw \
/root/vivek/patient_chipseq/stored/bw/GSM3934196_M-61_F.bw \
/root/vivek/patient_chipseq/stored/bw/GSM3934201_M-84_F.bw \
/root/vivek/patient_chipseq/stored/bw/GSM3934206_M-940_F.bw \
/root/vivek/patient_chipseq/stored/bw/GSM3934211_M-96_F.bw \
/root/vivek/patient_chipseq/stored/bw/GSM3934216_M-A2058_F.bw \
/root/vivek/patient_chipseq/stored/bw/GSM3934221_M-G361_F.bw \
/root/vivek/patient_chipseq/stored/bw/GSM3934226_M-HS934_F.bw \
/root/vivek/patient_chipseq/stored/bw/GSM3934231_M-WM115_F.bw \
/root/vivek/patient_chipseq/stored/bw/GSM3934236_M-WM165_F.bw \
/root/vivek/patient_chipseq/stored/bw/GSM3934241_M-WM266_F.bw \
/root/vivek/patient_chipseq/stored/bw/GSM3934246_M-WM793B_F.bw \
-R /root/vivek/patient_chipseq/poised_kmeans_zmet_5k_3clusters.bed --referencePoint center \
--sortRegions descend -bs 20 -a 5000 -b 5000 -p max -out patient_stored_H3K27me3_bs20.mat --outFileNameMatrix patient_stored_H3K27me3_bs20_5k.txt

####
###
#
