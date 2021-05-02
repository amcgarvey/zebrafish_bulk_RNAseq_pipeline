# Creating conda environments

To avoid clashing dependencies and to ensure reproducibility of results, the analysis was performed with conda environments. For this project I used the following environments.

## Environment for notebooks and r work

```
conda create --name pannotebooks
```
Can be recreated from pannotebooks_environment.yml with:
```
conda env create -n pannotebooks -f pannotebooks_environment.yml
```

## Second environment for pipeline 

(Mainly because snakemake has conflicting dependencies)

```
conda create --name pansnakemake
```
Can be recreated from pansnakemake_environment.yml

## locale error fix
in ~/.bashrc added

```
export LANG=en_US.UTF-8 
export LC_ALL=en_US.UTF-8
```

## pannotebooks
### installation
Basic installation so that r can be used within jupyter notebooks

```
conda install -c conda-forge r-base=4.0.0
conda install -c conda-forge r-irkernel jupyterlab
conda install -c anaconda nb_conda
```

### installation in R
Before opening the notebooks, activate the environment, open R and install all the packages first:
```
install. packages("devtools")
BiocManager::install("vsn")
install.packages("dplyr")
install.packages("ggplot2")
install.packages("pheatmap")
install.packages("RColorBrewer")
install.packages("PoiClaClu")
devtools::install_github("willtownes/glmpca")
BiocManager::install("apeglm")
```
Also install
- biocmanager
- rsubread
- deseq2

### Saving envrionment
To ensure environment can be recreated save as a yml file

```
conda activate pannotebooks
conda env export > pannotebooks_environment.yml
```

## pansnakemake
### installation
Within envrionment install packages with:

```
conda install -c bioconda snakemake
conda install -c bioconda fastqc
conda install -c bioconda star
```
### Saving envrionment
To ensure environment can be recreated save as a yml file

```
conda activate pansnakemake
conda env export > pansnakemake_environment.yml
```
