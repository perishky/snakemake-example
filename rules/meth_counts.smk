rule meth_counts:
    ""
    input:
        r1="{outdir}/trimmed/{id}_R1.fastq",
        r2="{outdir}/trimmed/{id}_R2.fastq",
        genome="{genomedir}/{assembly}.fa"
    output:
        "{outdir}/counts/{id}.csv"
    shell:
        "Rscript scripts/meth_counts.r {id} {input.r1} {input.r2} {input.genome} {output}"

