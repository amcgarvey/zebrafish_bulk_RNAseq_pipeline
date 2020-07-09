rule quality_control_raw:
    """Quality control with fastqc"""
    input: get_trim_inputs
    output: directory(join(OUT_DIR,'fastqc_raw', '{sample}'))
    resources:
      mem_mb=10000
    threads: 1
    shell:
      "mkdir -p {output}; fastqc {input} -o {output}"

INPUT_ALL.append(expand(rules.quality_control_raw.output, sample=samples.Name.tolist()))
