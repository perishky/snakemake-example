## Snakemake example for toy methyl-seq data

Aims to demonstrate roughly how a snakemake pipeline
could be set up for methyl-seq data.

<img src="dag.png" width="400" height="300"/>


### Installation

Ensure that [Miniforge](https://github.com/conda-forge/miniforge) is installed, e.g. for linux

```
curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
bash Miniforge3-$(uname)-$(uname -m).sh
export PATH="~/miniforge3/bin:$PATH"
mamba init
## logout 
## login
export PATH="~/miniforge3/bin:$PATH"
mamba activate ~/miniforge3
```

The mamba environment is created as follows:

```
mamba create -c conda-forge -c bioconda -n snakemake_example snakemake
mamba activate snakemake_example
pip3 install python-dotenv
```

Alternatively, the same could have been created using [mamba.yml](mamba.yml).

```
mamba env create -n snakemake_example -f mamba.yml
```

### Running the pipeline

Perform all steps in the pipeline
```
mamba activate snakemake_example
snakemake all -np ## dry run
snakemake all     ## full run
snakemake --dag all | dot -Tpng > dag.png ## visualize 
```

###  Useful info

Reference:
https://snakemake.readthedocs.io/en/stable/

Nice example:
https://github.com/ccbskillssem/snakemake_fa23/

### Learning 

1. Creating and applying simple rules
2. Generalizing with wildcards
3. Sequence of two rules
4. 

### TODO

* Add containerization
* Add slurm


