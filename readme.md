## Snakemake example for toy methyl-seq data

Aims to demonstrate roughly how a snakemake pipeline
could be set up for methyl-seq data.

### Installation

The mamba/conda environment was created with these three steps.

```
mamba create -c conda-forge -c bioconda -n snakemake snakemake
mamba activate snakemake
pip3 install python-dotenv
```

Alternatively, the same could be created using [environment.yml](environment.yml).

```
conda env create -f mamba.yml
```

### Running the pipeline

Perform all steps in the pipeline
```
snakemake all -np ## dry run
snakemake all     ## full run
snakemake --dag all | dot -Tpng > dag.png ## visualize 
```

###  Useful info

Reference:
https://snakemake.readthedocs.io/en/stable/

Nice example:
https://github.com/ccbskillssem/snakemake_fa23/

### TODO

* Add containerization
* Add slurm


