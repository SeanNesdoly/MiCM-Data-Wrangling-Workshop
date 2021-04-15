# Practical Assignment
#
# This script shows the power of using the dplyr package for data manipulation.
# Specifically, this example uses a gene location file that contains the
# following variables/columns: chr, txStart, txEnd, gene
#
# Sean Nesdoly
# 2021-04-15

# install.packages("tidyverse")
library(tidyverse)

# read in data
hglocs <- readr::read_tsv("./data/HumanGeneLocations.tsv")

# mutate data (create a new variable as a function of existing ones)
hglocs %>% dplyr::mutate(length = txEnd - txStart)

# select data (the gene column)
hglocs %>% dplyr::select(gene)

# filter data (keep only genes on chromosome 1 with txStart<100,000)
hglocs %>% dplyr::filter(chr == "chr1" & txStart < 100000)

# arrange data (sort by txStart site in a descending order)
hglocs %>% dplyr::arrange( desc(txStart) )

# all together, using pipes
hglocs_modified <- readr::read_tsv("./data/HumanGeneLocations.tsv") %>%
    dplyr::mutate(length = txEnd - txStart) %>%
    dplyr::select(chr, gene, length) %>%
    dplyr::filter(chr == "chr1" & length <= 80) %>%
    dplyr::arrange(desc(length)) %>%
    readr::write_tsv(path = "./out/GeneLocs_modified.txt")
