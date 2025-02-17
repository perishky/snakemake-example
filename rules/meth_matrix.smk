with open('samples.txt') as f:
     samples = f.read().splitlines()

rule meth_matrix:
    ""
    input:
        filenames=expand("{dir}/counts/{id}.csv",dir=outdir,id=samples)
    output:
        f"{outdir}/matrix/meth.csv",
        f"{outdir}/matrix/total.csv"
    shell:
        """
        echo "{input.filenames}" > meth_count_files.txt
        Rscript scripts/meth_matrix.r meth_count_files.txt {outdir}/matrix
        rm meth_count_files.txt
        """
