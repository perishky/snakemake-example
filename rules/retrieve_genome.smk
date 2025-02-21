rule retrieve_genome:
    "download genome fasta file"
    output:
        fasta=f"{genomedir}/{assembly}.fa"
    singularity:
        "r_docker.sif"
    shell:
        "Rscript {input.script} {output.fasta}"

