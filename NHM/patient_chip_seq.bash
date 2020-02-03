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
--sortRegions descend -bs 1000 -a 1000 -b 1000 -p max -out patient_fresh_H3K4me3.mat --outFileNameMatrix patient_fresh_H3K4me3.txt

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
--sortRegions descend -bs 1000 -a 1000 -b 1000 -p max -out patient_fresh_H3K27me3.mat --outFileNameMatrix patient_fresh_H3K27me3.txt



