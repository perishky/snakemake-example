# Minimal example of a snakemake pipeline

This folder provides a basic working template for creating an analysis
pipeline using snakemake.

## Three ways to run the pipeline

The pipeline can be run in three ways,
each managing pipeline software dependencies a different way:

1. [mamba](readme-mamba.md)

2. [apptainer containers](readme-apptainer.md)

3. [slurm compute cluster](readme-slurm.md)

## Contents

- [config.env](config.env) configuration file for paths and parameters

- [Snakefile](Snakefile) pipeline

- [data/input.txt](data/input.txt) toy data file for script

- [docker/Dockerfile_r](docker/Dockerfile_r) instructions for generating docker image for running R scripts

- [rules/example_rule.smk](rules/example_rule.smk) example rule that uses `script.r` to generate output

- [scripts/script.r](scripts/script.r) toy script 
