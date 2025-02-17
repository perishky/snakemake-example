#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)

assembly.file <- args[1]

cat("RUNNING simulate_genome.r", assembly.file, "\n")

set.seed(20240328)

dir.create(dirname(assembly.file), recursive=T)

seq <- paste(sample(c('A','C','T','G'), size=200, replace=T), collapse="")
writeLines(seq, con=assembly.file)
