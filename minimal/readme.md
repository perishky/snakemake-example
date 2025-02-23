# Minimal example of a snakemake pipeline

This folder provides a basic working template for creating an analysis
pipeline using snakemake.

## Prepare data

For the sake of realism, data will be accessed
from an external directory.
It will need to be copied there before running the pipeline.

```
cp -rv data /tmp/snakemake-minimal-example-data
```

## Three ways to run the pipeline

The pipeline can be run in three ways,
each managing pipeline software dependencies a different way:

1. using mamba,  [setup instructions](readme-mamba.md)

```
snakemake --snakefile Snakefile --configfile=config/mamba.yaml all
```

2. using apptainer containers,  [setup instructions](minimal/readme-apptainer.md)

```
snakemake --snakefile Snakefile --configfile=config/apptainer.yaml all
```

3. on a slurm cluster, [setup instructions](minimal/readme-slurm.md)

```
module load languages/python/3.12.3
module load apptainer/1.3.1
snakemake --snakefile Snakefile --configfile=config/bc4.yaml all
```

## Cleanup

```
rm -rf example-results
rm -rf /tmp/snakemake-minimal-example-data
rm r_minimal.{tar,sif}
```

## Contents

- [Snakefile](Snakefile) pipeline instructions

- [rules/](rules) snakemake rules loaded by [Snakefile](Snakefile)

- [docker/Dockerfile_r](docker/Dockerfile_r) script for generating a docker image that can run R

- [scripts/](scripts) toy script run by the pipeline

- [config/](config) snakemake configuration files for the different ways of running the pipeline

