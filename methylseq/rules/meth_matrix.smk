with open('samples.txt') as f:
     samples = f.read().splitlines()

rule meth_matrix:
    "assemble sample methylation data into a matrix"
    input:
        filenames=expand("{dir}/counts/{id}.csv",dir=outdir,id=samples)
    output:
        f"{outdir}/matrix/meth.csv",
        f"{outdir}/matrix/total.csv"
    singularity:
        "r_methylseq.sif"
    resources:
        mem="100M",
        time="01:00:00"
    shell:
        """
        echo "{input.filenames}" > meth_count_files.txt
        Rscript scripts/meth_matrix.r meth_count_files.txt {outdir}/matrix
        rm meth_count_files.txt
        """
