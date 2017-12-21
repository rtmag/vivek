f=open("/Users/wone/Downloads/SRR_Acc_List.txt")

line=f.readline()
line=line.rstrip()

while line:
    print "wget ftp://ftp.sra.ebi.ac.uk/vol1/fastq/"+line[0:6]+"/00"+line[9:]+"/"+line+"/"+"*.fastq.gz"
    line=f.readline()
    line=line.rstrip()



f.close()

