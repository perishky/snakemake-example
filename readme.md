## Snakemake example for toy methyl-seq analysis

Aims to demonstrate roughly how a snakemake pipeline
could be set up for methyl-seq analysis.

<img src="dag.png" width="400" height="300"/>

Instructions for preparing and running the pipeline
are the same as those of the
['minimal template'](minimal/readme.md).

## Three ways to run the pipeline

1. using [mamba](minimal/readme-mamba.md)

```
snakemake --snakefile Snakefile all
```

2. using [apptainer](minimal/readme-apptainer.md)

```
snakemake --use-singularity --snakefile Snakefile all
```

3. on a [slurm cluster](minimal/readme-slurm.md)

```
module load languages/python/3.12.3
module load apptainer/1.3.1
snakemake --snakefile Snakefile --profile cluster/bc4.yaml all
```

## Contents

- [config.env](config.env) configuration file for paths and parameters

- [Snakefile](Snakefile) pipeline instructions

- [rules/](rules) snakemake rules loaded by [Snakefile](Snakefile)

- [docker/Dockerfile_r](docker/Dockerfile_r) instructions for generating docker image for running R scripts

- [scripts/](scripts) toy scripts run by the pipeline

- [cluster/bc4.yaml](cluster/bc4.yaml) settings for running the pipeline on a cluster called 'bc4'

- [minimal/](minimal/readme.md) Minimal template pipeline that may be a bit easier to adapt for other projects 

## Learning 

https://snakemake.readthedocs.io/en/stable/tutorial/basics.html

1. Creating and applying simple rules
2. Generalizing with wildcards
3. Sequence of two rules
4. Rule with list of inputs
5. Complex DAG
6. Target rule

https://snakemake.readthedocs.io/en/stable/tutorial/advanced.html
1. Config file
2. Parameters
3. Threads
4. Logging
5. Temporary files

https://snakemake.readthedocs.io/en/stable/tutorial/additional_features.html
1. Modularization
2. Software dependencies
3. Containerizing
4. SLURM



