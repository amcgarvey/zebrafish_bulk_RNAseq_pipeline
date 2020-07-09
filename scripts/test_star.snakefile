#rule all:
#    input:
#        "../data/mapped/R1_pasted_AGCTAGTC.aligned.out.sam"

rule star_se:
    input:
        fq1 = "/fast/AG_Ohler/Alison/panakova_CM_RNAseq/raw/R1_pasted_CTATAGTA.fastq"
    output:
        # see STAR manual for additional output files
        "/fast/AG_Ohler/Alison/panakova_CM_RNAseq/data/mapped/R1_pasted_CTATAGTA.Aligned.out.sam"
    log:
        "/fast/AG_Ohler/Alison/panakova_CM_RNAseq/data/mapped/R1_pasted_CTATAGTA.log"
    params:
        # path to STAR reference genome index
        index="/fast/AG_Ohler/Alison/reference_genomes/danrer11",
        # optional parameters
        extra=""
    threads: 8
    wrapper:
        "0.60.0/bio/star/align"
