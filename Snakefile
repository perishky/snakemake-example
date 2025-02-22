from dotenv import dotenv_values
import os

config = dotenv_values("config.env")

basedir = config['basedir']

# uncomment the following line if the
# data files/outputs are on a non-relative 
# path to the pipeline working directory
# (will not work for containers!)
#basedir = os.path.expanduser(basedir)

assembly = config['assembly']

datadir = f"{basedir}/data"
fastqdir = f"{datadir}/fastq"
genomedir = f"{basedir}/genome"
outdir = f"{basedir}/output"

onstart:
    print("##### Running example snakemake pipeline #####")

rule all:
    input:
        f"{outdir}/matrix/sum.csv"

include: "rules/retrieve_genome.smk"
include: "rules/retrieve_data.smk"
include: "rules/trim_reads.smk"
include: "rules/meth_counts.smk"
include: "rules/meth_matrix.smk"
include: "rules/meth_sum.smk"




