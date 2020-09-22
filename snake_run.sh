#!/bin/bash

#$-m baes
#$-pe smp 1
#$-l h_vmem=80G,os=centos7
#$-cwd
#$-V
#$-j yes #merge the stderr with the stdout
#$-o logs/ #stdout, job log
#$-M alisonclare.mcgarvey@mdc-berlin.de
#$-N 'main.snake'

source activate pansnakemake

snakemake -j 10 -s main.snake --local-cores 10

exit 0

