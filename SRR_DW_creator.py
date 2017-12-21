f=open("/Users/wone/Downloads/SRR_Acc_List.txt")

line=f.readline()

while line:

    print "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/"+line[0:6]+"/00"+line[9:]+"/"+line+"/"+line+"_1.fastq.gz"

    line=f.readline()


f.close()
