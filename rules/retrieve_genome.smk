rule retrieve_genome:
    "download genome fasta file"
    output:
        fasta="{genomedir}/{assembly}.fa"
    shell:
        "Rscript scripts/simulate_genome.r {output.fasta}"

