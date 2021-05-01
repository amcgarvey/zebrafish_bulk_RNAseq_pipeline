
# Analysis of bulk RNA-seq from zebrafish

This is the analysis of RNA-seq data generated from zebrafish cardiomyotes, prepared and sequenced with CEL-seq protocol.

## Project structure

### directories
data/ contains all processed data generated from the analysis pipeline (main.snake) e.g. fastq, bam
notebooks/ are the records of interactive analyses of data generated by the pipeline. Main analysis description in main notebook file and labnotes (dated)
raw/ raw data from the sequencer that is not to be touched
scripts/ functions or bits of code used in main pipeline or analysis notebooks e.g. snakemake rules or R functions

### files
* main.snake is the master snakemake file for the standard mapping pipeline
* pansnakemake_environment.yml is the conda environment used for the snakemake pipeline
* notebook.ipynb is the notebook describing the main downstream analysis steps. Tests, or versions of these are found in notebooks/ directory
* samplesheet.tsv contains all sample names and fastq paths
* samplesheet_aligning.tsv contains paired information for samples paired-end sequenced
