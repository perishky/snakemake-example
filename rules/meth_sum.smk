
rule meth_sum:
    "calculate sample read depths for each site"
    input:
        f"{outdir}/matrix/meth.csv"
    output:
        f"{outdir}/matrix/sum.csv"
    singularity:
        "r_docker.sif"
    resources:
        mem="100M",
        time="01:00:00"
    shell:
        """
        Rscript scripts/meth_sum.r {input} {output}
        """
