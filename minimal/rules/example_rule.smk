rule example_rule:
    "example"
    input:
        text=f"{datadir}/input.txt"
    output:
        text=f"{resultsdir}/output.txt"
    container:
        "r_minimal.sif"
    resources:
        mem="100M",     ## M=megabytes G=gigabytes
        time="01:00:00" ## hh:mm:ss
    shell:
        """
	Rscript {scriptsdir}/script.r {input.text} {output.text}
	"""
