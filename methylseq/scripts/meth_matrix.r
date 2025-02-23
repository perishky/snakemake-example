#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)

filelist <- args[1]
out.dir <- args[2]

cat("RUNNING meth_matrix.r", readLines(filelist), out.dir, "\n")

dir.create(out.dir, recursive=T)

files <- readLines(filelist)
files = strsplit(files, " ")[[1]]
files = data.frame(filename=files)
files$sample = sub("\\.[^.]+$", "", basename(files$filename))

dat <- lapply(files$filename, read.csv)
names(dat) <- files$sample
meth <- sapply(dat, function(dat) dat$meth)
total <- sapply(dat, function(dat) dat$total)
meth <- meth/total

colnames(meth) <- colnames(total) <- sub(".csv", "", colnames(meth))
rownames(meth) <- rownames(total) <- paste("c", dat[[1]]$site, sep="")

write.csv(meth, file=file.path(out.dir, "meth.csv"))
write.csv(total, file=file.path(out.dir, "total.csv"))
