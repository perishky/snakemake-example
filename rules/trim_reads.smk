rule trim_reads:
    "trim junk from sequencing reads"
    input:
        r1=f"{fastqdir}/" + "{id}_R1.fastq",
        r2=f"{fastqdir}/" + "{id}_R2.fastq"
    output:
        r1=f"{outdir}/trimmed/" + "{id}_R1.fastq",
        r2=f"{outdir}/trimmed/" + "{id}_R2.fastq"
    singularity:
        "r_docker.sif"
    resources:
        mem="100M",
        time="01:00:00"
    shell:
        """
        Rscript scripts/trim_reads.r {input.r1} {input.r2} {outdir}/trimmed
        """
