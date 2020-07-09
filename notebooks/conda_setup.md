# Creating conda environment
first environment for notebooks and r work

``
conda create --name panakovaRNAseq
```
I broke this so set up

```
conda create --name pannotebooks
```

second environment for pipeline (mainly because snakemake has conflicting dependencies)

``
conda create --name pansnakemake
```
third environment for multiqc with python

```
conda create --name py3.7 python=3.7
conda activate py3.7
conda install -c bioconda -c conda-forge multiqc
```

## Package Plan ##

  environment location: /home/amcgarv/miniconda3/envs/panakovaRNAseq



## locale error fix
in ~/.bashrc added

```
export LANG=en_US.UTF-8 
export LC_ALL=en_US.UTF-8
```

## panakovaRNAseq and pannotebooks
###installation

conda install -c conda-forge r-base=4.0.0
conda install -c conda-forge r-irkernel jupyterlab
conda install -c anaconda nb_conda

## installation in R
before opening the notebooks, activate the environment, open R and install all the packages first:

install. packages("devtools")
- biocmanager
- rsubread
- deseq2
BiocManager::install("vsn")
install.packages("dplyr")
install.packages("ggplot2")
install.packages("pheatmap")
install.packages("RColorBrewer")
install.packages("PoiClaClu")
devtools::install_github("willtownes/glmpca")
BiocManager::install("apeglm")


## pansnakemake
### installation
conda install -c bioconda snakemake
conda install -c bioconda fastqc
conda install -c bioconda star

