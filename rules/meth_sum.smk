rule meth_sum:
    ""
    input:
        "{outdir}/matrix/meth.csv"
    output:
        "{outdir}/matrix/sum.csv"
    shell:
        "Rscript scripts/meth_sum.r {input} {output}"
