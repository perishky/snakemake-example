
rule meth_sum:
    ""
    input:
        f"{outdir}/matrix/meth.csv"
    output:
        f"{outdir}/matrix/sum.csv"
    shell:
        "Rscript scripts/meth_sum.r {input} {output}"
