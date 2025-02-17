rule trim_reads:
    input:
        r1="{fastqdir}/{id}_R1.fastq",
        r2="{fastqdir}/{id}_R2.fastq"
    output:
        r1="{outdir}/trimmed/{id}_R1.fastq",
        r2="{outdir}/trimmed/{id}_R2.fastq"
    shell:
        "Rscript scripts/trim_reads.r {input.r1} {input.r2} {outdir}/trimmed"

