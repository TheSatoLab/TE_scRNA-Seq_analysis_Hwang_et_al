#!/usr/bin/env python

import sys
import numpy as np
argvs = sys.argv

count_f = open(argvs[1])
TE_name_f = open(argvs[2])

TE_name_f.next()

convert_d = {}
for line in TE_name_f:
  line = line.strip().split()
  locus = line[1]
  locus = locus.replace('_','-')
  group = line[-2]
  convert_d[locus] = group 

#print convert_d


line1 = count_f.next().strip()

count_d = {}
for line in count_f:
  line = line.strip().split(",")
  gene = line[0]
  count_l = line[1:]
  count_l = [float(j) for j in count_l]
  count_a = np.array(count_l)
  if (":" not in gene):
    count_d[gene] = count_a
  else:
    group = convert_d[gene]
    if group not in count_d:
      count_d[group] = np.array([0.0]*len(count_l))
    #if np.percentile(count_a, 90) >= 10:
    count_d[group] += count_a

print line1
for gene in sorted(count_d):
  count_l = list(count_d[gene])
  print gene + "," + ",".join([str(i) for i in count_l])
