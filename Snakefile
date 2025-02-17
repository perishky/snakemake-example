from dotenv import dotenv_values

config = dotenv_values("config.env")

basedir = config['basedir']
assembly = config['assembly']

datadir = f"{basedir}/data"
fastqdir = f"{datadir}/fastq"
genomedir = f"{basedir}/genome"
outdir = f"{basedir}/output"

##include: "rules/retrieve_genome.smk"
##include: "rules/retrieve_data.smk"
##include: "rules/trim_reads.smk"
##include: "rules/meth_counts.smk"
##include: "rules/meth_matrix.smk"
##include: "rules/meth_sum.smk"

##rule all:
##     input:
##	"{outdir}/matrix/sum.csv"

## mamba install 'tabulate=0.8.10'
## snakemake -c1 /home/ms13525/snakemake-example/genome/hg19.fa

print(f"{genomedir}/{assembly}.fa")

rule retrieve_genome:
    "download genome fasta file"
    output:
        fasta=f"{genomedir}/{assembly}.fa"
    shell:
        "Rscript scripts/simulate_genome.r {output.fasta}"
