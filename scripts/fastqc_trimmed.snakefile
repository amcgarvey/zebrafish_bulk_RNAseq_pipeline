rule quality_control_trimmed:
    """Quality control with fastqc"""
    input: get_flexbar_inputs
    output: directory(join(OUT_DIR,'fastqc_raw_trimmed', '{sample}'))
    resources:
      mem_mb=10000
    threads: 1
    shell:
      "mkdir -p {output}; fastqc {input} -o {output}"

INPUT_ALL.append(expand(rules.quality_control_trimmed.output, sample=samples.Name.tolist()))
