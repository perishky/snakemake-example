# Snakemake pipeline on a slurm compute cluster

We have chosen to run the containerized pipeline
on the cluster to minimize the number of software dependencies
that must be satisfied by the cluster.

Two additions are required to run the pipeline on a slurm compute cluster:

1. Cluster-specific settings in yaml format: [cluster/bc4.yaml](cluster/bc4.yaml)

2. Optionally, time and memory specifications for each rule, see
   e.g. the 'resources' keyword in [rules/example_rule.smk](rules/example_rule.smk)

More details can be found [here](https://github.com/snakemake/snakemake-executor-plugin-slurm/tree/main). 

## Install snakemake

On a cluster login node, load the python module
and install snakemake and any python modules it imports. 

```
module load languages/python/3.12.3
pip3 install snakemake==8.28.0
pip3 install python-dotenv==1.0.1
```

## Create container image

Create the container image as
[previously described](readme-apptainer.md#-Create-container-image). 

## Run the pipeline 

On a cluster login node, load the python and apptainer modules
and run the pipeline with cluster-specific settings.

```
module load languages/python/3.12.3
module load apptainer/1.3.1
snakemake --snakefile Snakefile --profile cluster/bc4.yaml all
```