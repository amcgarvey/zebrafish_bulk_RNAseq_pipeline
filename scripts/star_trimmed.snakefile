rule star_se_trimmed:
    input: 
        fq1=get_flexbar_inputs
    output: 
        # see STAR manual for additional output files
        #"mapped/{sample}/Aligned.out.sam"
        join(OUT_DIR,'mapped_trimmed','{sample}','{sample}.Aligned.out.bam'),
        #prefix=join(OUT_DIR,'mapped','{sample}','{sample}.')
    log:
        #"logs/mapped/{sample}.log"
        join(OUT_DIR,'mapped_trimmed','{sample}','aligned.log')
    params:
        # path to STAR reference genome index
        index="/fast/AG_Ohler/Alison/reference_genomes/danrer11",
        prefix=join(OUT_DIR,'mapped_trimmed','{sample}','{sample}.')
        # optional parameters
        # extra=""
    threads: 8
#    shell: "star --runThreadN 8 --genomeDir {params.index} --readFilesIn {input.fq1}"
#    wrapper:
#        "0.60.0/bio/star/align"
    run:
        cmd = "STAR --runThreadN {threads} --genomeDir {params.index} --readFilesIn {input.fq1}"
        cmd += " --outFileNamePrefix {params.prefix} --outSAMtype BAM Unsorted"
        shell(cmd)

INPUT_ALL.append(expand(rules.star_se_trimmed.output, sample=samples.Name.tolist()))
