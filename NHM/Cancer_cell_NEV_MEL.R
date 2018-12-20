# Boxplot TFAP2C
data <- read_excel("hunterRNAseq.xlsx", sheet = 3)

data = data.frame(data)

expr = data[3:22463,6:47]
moko = data[2,6:47]
