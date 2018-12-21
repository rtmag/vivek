# Boxplot TFAP2C
data <- read_excel("hunterRNAseq.xlsx", sheet = 3)

data = data.frame(data)

expr = data[3:22463,6:47]
sample_name = data[2,6:47]

ix = !1:dim(sample_name)[2] %in% 
c(grep("T21",as.character(sample_name)),grep("JJS13",as.character(sample_name)),grep("JJS17",as.character(sample_name)))

expr = expr[,ix]

group_name = as.character(sample_name[ix])
colnames(group_name) = NULL
group_name[grep("Nev",as.character(group_name))] = "Nev"
group_name[grep("Mel",as.character(group_name))] = "Mel"

colnames(expr) = group_name
