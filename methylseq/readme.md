## Snakemake example for toy methyl-seq analysis

Aims to demonstrate roughly how a snakemake pipeline
could be set up for methyl-seq analysis.

<img src="dag.png" width="400" height="300"/>

## Three ways to run the pipeline

1. using mamba,  [setup instructions](../minimal/readme-mamba.md)
   same as for 'minimal' example

```
snakemake --snakefile Snakefile --configfile=config/mamba.yaml all
```

2. using apptainer containers,  [setup instructions](../minimal/readme-apptainer.md)
   same as for 'minimal' example but creating image file
   `r_methylseq.sif` instead of `r_minimial.sif`

```
snakemake --snakefile Snakefile --configfile=config/apptainer.yaml all
```

3. on a slurm cluster, [setup instructions](../minimal/readme-slurm.md)
   same as for 'minimal' example

```
module load languages/python/3.12.3
module load apptainer/1.3.1
snakemake --snakefile Snakefile --configfile=config/bc4.yaml all
```

## Cleanup

```
rm -rf example-results
rm -rf /tmp/snakemake-example-methylseq-data
rm r_methylseq.{tar,sif}
```

## Contents

- [Snakefile](Snakefile) pipeline instructions

- [rules/](rules) snakemake rules loaded by [Snakefile](Snakefile)

- [docker/Dockerfile_r](docker/Dockerfile_r) script for generating a docker image that can run R

- [scripts/](scripts) toy scripts run by the pipeline

- [config/](config) snakemake configuration files for the different ways of running the pipeline

## More information 

https://carpentries-incubator.github.io/snakemake-novice-bioinformatics/

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



