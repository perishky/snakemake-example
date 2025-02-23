# Snakemake pipeline installation using apptainer containers

A pipeline can be containerized by running the entire pipeline within a
container.  The upside of this approach is simplicity, everything runs inside
the container so all software dependencies can be handled inside a single container.
The downside is the loss of flexibility
and possible conflicting dependencies between rules.

We have implemented the pipeline so that it is fairly easy to
use rule-specific containers (even though in this minimal example we
use the same container for each). To support this approach to containerization,
there are two additions to the pipeline:

1. Instructions for creating a container,
   [docker/Dockerfile_r](docker/Dockerfile_r).
   Here we just have instructions for one container, however, in general,
   there will be one such file for each different container required.

2. For each rule, the name of the container image file for applying the rule.
   This appears in the rule definition next to the keyword "container",
   see e.g. [rules/example_rule.smk](rules/example_rule.smk).

**Important:** File paths used by scripts, e.g. those in
[config.env](config.env), cannot lead outside the working directory
or its descendent directories unless they have been specifically
[mapped to the container](https://apptainer.org/docs/user/main/bind_paths_and_mounts.html).

## Install mamba

Mamba will be used to install snakemake and apptainer,
so ensure that [mamba](readme-install-mamba.md) is installed.

## Install snakemake

```
mamba create --name "snakemake_example" python=3.12.8
mamba activate snakemake_example
pip3 install snakemake==8.28.0
pip3 install python-dotenv==1.0.1
```

## Install apptainer

Containerization with apptainer has a few system requirements
that unfortunately cannot be installed by normal users:

* [docker](https://www.docker.com) will be used
  to create container images

* `fuse2fs` and `gocryptfs` will be used to access files
  outside of the container, e.g. data files

With these installed, apptainer can be installed by mamba:

```
mamba activate snakemake_example
mamba install conda-forge::apptainer=1.3.6
```

## Create container image

Create the apptainer container image (`r_minimal.sif`)
by creating a docker image and then converting
it to apptainer format:

```
IMAGE="r_minimal"
docker build -t ${IMAGE} -f docker/Dockerfile_r .
docker save ${IMAGE} -o ${IMAGE}.tar
apptainer build ${IMAGE}.sif docker-archive://${IMAGE}.tar
```

If running docker requires elevated system privileges, then
these steps will be slightly different:

```
sudo docker build -t ${IMAGE} -f docker/Dockerfile_r .
sudo docker save ${IMAGE} -o ${IMAGE}.tar
sudo chown $USER ${IMAGE}.tar
apptainer build ${IMAGE}.sif docker-archive://${IMAGE}.tar
```



