# Snakemake pipeline templates that can be executed

Two examples are provided:

1. [minimal](minimal): a basic pipeline that loads data from an
   external directory and copies it to a local results folder. 

2. [methylseq](methylseq): a slightly more elaborate pipeline
   that mimics a methyl-sequencing pipeline that processes
   sequencing reads from a set of samples and uses them to calculate
   DNA methylation levels that are merged into a final matrix
   for analysis.

Each is a working pipeline that is designed to be used as
templates for real pipelines.

Each pipeline can be run in three ways:

1. on an individual computer with software dependencies managed by mamba,

2. on an individual computer with software dependencies managed by containerization, and

3. on a slurm compute cluster.
