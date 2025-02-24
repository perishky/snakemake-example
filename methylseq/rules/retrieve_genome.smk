rule retrieve_genome:
    "download genome fasta file"
    output:
        fasta=f"{genomedir}/{assembly}.fa"
    container:
        "r_methylseq.sif"
    shell:
        """
        Rscript scripts/simulate_genome.r {output.fasta}
        """

