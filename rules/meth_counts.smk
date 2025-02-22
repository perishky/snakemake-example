rule meth_counts:
    "count methylated/unmethylated reads per dnam site"
    input:
        r1=f"{outdir}/trimmed/" + "{id}_R1.fastq",
        r2=f"{outdir}/trimmed/" + "{id}_R2.fastq",
        genome=f"{genomedir}/{assembly}.fa"
    output:
        f"{outdir}/counts/" + "{id}.csv"
    singularity:
        "r_docker.sif"
    resources:
        mem="100M",     
        time="01:00:00" 
    shell:
        """
        Rscript scripts/meth_counts.r {wildcards.id} {input.r1} {input.r2} {input.genome} {output}
        """
