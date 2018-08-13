import pyBigWig
bw = pyBigWig.open("/root/vivek/chip-seq/bw/NHM_H3K27ac.bw")
for line in open("/root/vivek/chip-seq/ROSE/heatmap/superEnhancer_merged.bed"):
    cols = line.strip().split()
    vals1 = bw.values(cols[0], int(cols[1]), int(cols[2]))

bw.close()

bw = pyBigWig.open("/root/vivek/chip-seq/bw/BRAF_H3K27ac.bw")
for line in open("/root/vivek/chip-seq/ROSE/heatmap/superEnhancer_merged.bed"):
    cols = line.strip().split()
    vals2 = bw.values(cols[0], int(cols[1]), int(cols[2]))

bw.close()

bw = pyBigWig.open("/root/vivek/chip-seq/bw/CDKN2A+BRAF_H3K27ac.bw")
for line in open("/root/vivek/chip-seq/ROSE/heatmap/superEnhancer_merged.bed"):
    cols = line.strip().split()
    vals3 = bw.values(cols[0], int(cols[1]), int(cols[2]))

bw.close()

import numpy
matrix = numpy.array([vals1,vals2,vals3])

import csv
from itertools import izip

matrix = zip(*matrix)

numpy.savetxt("superenhancer_BW_counts.csv", matrix, delimiter=",")
