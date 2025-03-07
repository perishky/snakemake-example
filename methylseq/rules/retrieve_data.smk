rule retrieve_data:
    "download sequencing data"
    input:
        f"{genomedir}/{assembly}.fa"
    output:
        files=expand("{dir}/{id}_{pair}.fastq",dir=fastqdir,id=samples,pair=["R1","R2"])
    container:
        "r_methylseq.sif"
    shell:
        """
        Rscript scripts/simulate_reads.r {fastqdir} {input}
        """
