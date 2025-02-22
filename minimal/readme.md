
```
sudo docker build -t r_minimal -f Dockerfile .
sudo docker save r_minimal -o r_minimal.tar
sudo chown $USER r_minimal.tar
apptainer build r_minimal.sif docker-archive://r_minimal.tar
```

```
snakemake -c1 -s Snakefile all
```


```
snakemake --use-singularity -c1 -s Snakefile all
```