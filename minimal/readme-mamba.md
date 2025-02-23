# Snakemake pipeline installation using mamba software management

## Install mamba

Ensure that [mamba](readme-install-mamba.md) is installed.

## Install snakemake

```
mamba create --name "snakemake_example" python=3.12.8
mamba activate snakemake_example
pip3 install snakemake==8.28.0
pip3 install python-dotenv==1.0.1
```

## Install pipeline software

If it is not already installed, R can be installed using mamba:

```
mamba install conda-forge::r-base=4.4.2
```











