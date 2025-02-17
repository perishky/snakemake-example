## Snakemake example for toy methyl-seq data

Aims to demonstrate roughly how a snakemake pipeline
could be set up for methyl-seq data.

```
pip3 install python-dotenv
```

Perform all steps in the pipeline
```
snakemake all -np ## dry run
snakemake all     ## full run
snakemake --dag all | dot -Tpng > dag.png ## visualize 
```

Reference:
https://snakemake.readthedocs.io/en/stable/

Nice example:
https://github.com/ccbskillssem/snakemake_fa23/

TODO
* Add containerization
* Add slurm
