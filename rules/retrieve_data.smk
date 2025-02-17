rule retrieve_data:
    "download sequencing data"
    input:
        "{genomedir}/{assembly}.fa"
    output:
	"fastq/sample-1_R1.fa"
    shell:
        "Rscript scripts/simulate_reads.r {fastqdir} {input}"
