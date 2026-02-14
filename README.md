[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/SzF8zjrH)
# Unix Course Final Assignment: task 6

**Proportion of transitions (A -> G, G -> A, C -> T, T -> C) and transversions (A -> C/T, C -> A/G, G -> C/T, T -> A/G) in total and by type of nucleotide** 

The substitutions were classified using bash script `workflow.sh`. Usage:
```bash
# ./workflow.sh "path-to-data" eg.
./workflow.sh data/luscinia_vars.vcf.gz 
```
Explanation of the code:
* `< "$1" zcat`: Loading data from the file specified by first command line argument.
* `cut -f 1-8`:  Removing columns specifying allele variants in studied individuals.
* `grep -v -e "^#" -e "INDEL"`:  Removing headers and rows with indels.
* `awk '{print($4$5)}'`:  Joining of reference and alternative allele info.
* `sed -E "s/(.)(.),(.)/\1\2\n\1\3/" |  sed -E "s/(.)(.),(.)/\1\2\n\1\3/"`:  Splitting info about multiallelic loci into multiple lines (one per each alternative allele; `sed` called twice because of rpesence of loci with three alternative alleles).
* `awk '{if ($1 ==  "AG" || $1 == "GA" || $1 == "CT" || $1 =="TC") print($1, "transition"); else print($1, "transversion");}'`: Based on the combination of the reference and alternative alleles, the substitutions are classified as transitions and transversions.
* `tr " " "\t"`: Changing column separator to `\t`.
* `sed -E "s/^(.)(.)/\1\t\2/"`: Nucleotide types in reference and alternative alleles splitted into separate columns.

## R analalysis

What is in the graph?

![Your Graph](results/your-graph.jpeg)
