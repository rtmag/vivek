#more SraRunTable.txt |cut -f1,12,15,16,17|perl -pe 's/OTHER/ATAC-Seq/g'|perl -pe 's/\s\(.+\)\s/\t/g'|perl -pe 's/foreskin, //g'|awk -F"\t" {'print $2"\t"$1"_"$3"_"$4$5'}|grep -v "Assay_Type"|perl -pe 's/ChIP-Seq__/ChIP-Seq_input_/g'|perl -pe 's/__/_/g' > Sra_parsed_table.txt

# Sra_parsed_table.txt

import os
import re
from subprocess import call

dir.path=
dir = os.listdir("data/")

with open('Sra_parsed_table.txt') as f:
    line = f.readline()
    line = line.strip()
    line = line.split('\t')
    ind = [i for i, s in enumerate(dir) if line[0] in s]
    for ix in ind:
        new_name = re.sub(line[0], line[1], dir[ix])
