#!/bin/bash
< "$1" zcat |
    cut -f 1-8 |
    grep -v -e "^#" -e "INDEL" |
    awk '{print($4$5)}'  |
    sed -E "s/(.)(.),(.)/\1\2\n\1\3/" |  sed -E "s/(.)(.),(.)/\1\2\n\1\3/" |
    awk '{if ($1 ==  "AG" || $1 == "GA" || $1 == "CT" || $1 =="TC") print($1, "transition"); else print($1, "transversion");}' |
    tr " " "\t" |
    sed -E "s/^(.)(.)/\1\t\2/" > results/substitution_type.tsv
Rscript data-analysis.R
