from os.path import join
import os
# os is a python 3 library with functions on pathnames https://docs.python.org/3/library/os.path.html

#def is_paired(wildcards):
#    if os.path.exists(samples[samples.Name == wildcards.sample].read2.tolist()[0]):
#        return True
#    else:
#        return False

def get_flexbar_inputs(wildcards):
    prefix = join(OUT_DIR,'trimmed', wildcards.sample, wildcards.sample)
    return [prefix + '.fastq']
#    sam = samples[samples.Name == wildcards.sample]
#    in_ = sam.read1.tolist()
#    if is_paired(wildcards):
#    #        in_ += sam.read2.tolist()
#        return in_

def get_trim_inputs(wildcards):
    sam = samples[samples.Name == wildcards.sample]
    in_ = sam.read1.tolist()
#    if is_paired(wildcards):
#        in_ += sam.read2.tolist()
    return in_
