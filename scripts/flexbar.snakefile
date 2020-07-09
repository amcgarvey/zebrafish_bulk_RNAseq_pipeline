rule adapter_trimming_flexbar:
        """Trim adapters using flexbar"""
        input:
            reads=get_trim_inputs
        params:
            target=join(OUT_DIR, 'trimmed', '{sample}', '{sample}')
        output: join(OUT_DIR, 'trimmed', '{sample}', '{sample}.fastq')
#                join(OUT_DIR, '{sample}', 'trimmed', 'sample_1.fastq.gz'),
#                join(OUT_DIR, '{sample}', 'trimmed', 'sample_2.fastq.gz'),
#                join(OUT_DIR, '{sample}', 'trimmed', 'sample.fastq.gz')
        threads: 10
        resources:
           mem_mb=1000
        log: join(OUT_DIR, 'trimmed', '{sample}', 'flexbar_{sample}.log')
        run:
            cmd = 'flexbar '
            cmd += "-r {input.reads[0]} "
            cmd += " -t {params.target}"
            cmd += " -a scripts/truseqsmallRNA.fa"
#            cmd += " -f i1.8 -u 10 -ae RIGHT -at 1.0 --threads {threads} "
#            cmd += " --zip-output GZ "
            cmd += " --min-read-length 30 > {log}"
            shell(cmd)

INPUT_ALL.append(expand(rules.adapter_trimming_flexbar.output, sample=samples.Name.tolist()))
