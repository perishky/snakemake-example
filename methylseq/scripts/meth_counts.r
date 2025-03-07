#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)

sampleid <- args[1]
left <- args[2]
right <- args[3]
genome <- args[4]
output <- args[5]

cat("RUNNING meth_counts.r", sampleid, left, right, genome, output, "\n")

dir.create(dirname(output), recursive=T)

seq <- readLines(genome)
cpos <- gregexpr('C',seq)[[1]]

reads <- paste(
    readLines(left),
    readLines(right),
    sep="")
reads <- do.call(rbind, strsplit(reads,""))
reads <- reads[,cpos]

counts <- data.frame(
    site=cpos,
    meth=apply(reads,2,function(site) sum(site!="C")),
    total=nrow(reads))

write.csv(counts, file=output, row.names=F)
