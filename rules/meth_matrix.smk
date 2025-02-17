with open('samples.txt') as f:
     samples = f.read().splitlines()
count_filenames = expand("{id}.csv", id=samples)
count_filenames = [f"{outdir}/counts/" + name for name in count_filenames]

rule meth_matrix:
    ""
    input:
        filenames=count_filenames
    output:
        "{outdir}/matrix/meth.csv",
        "{outdir}/matrix/total.csv"
    shell:
        """
        cat {input.filenames} > meth_count_files.txt
        Rscript scripts/meth_matrix.r meth_count_files.txt {outdir}/matrix
        rm meth_count_files.txt
        """
