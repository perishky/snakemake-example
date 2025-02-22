args = commandArgs(trailingOnly=TRUE)

input = args[1]
output = args[2]

txt = readLines(input)

dir.create(dirname(output))
writeLines(txt, con=output)
