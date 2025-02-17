rule meth_counts:
    ""
    input:
        r1=f"{outdir}/trimmed/" + "{id}_R1.fastq",
        r2=f"{outdir}/trimmed/" + "{id}_R2.fastq",
        genome=f"{genomedir}/{assembly}.fa"
    output:
        f"{outdir}/counts/" + "{id}.csv"
    shell:
        "Rscript scripts/meth_counts.r {wildcards.id} {input.r1} {input.r2} {input.genome} {output}"

