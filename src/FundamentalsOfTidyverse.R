#-------------------------------------------------------------------------------
# Fundamentals of Tidyverse
#
# Sean Nesdoly
# Data Wrangling Workshop
# McGill initiative in Computational Medicine
# 2021-04-15
#-------------------------------------------------------------------------------

# install.packages("tidyverse") # @TODO: uncomment & run if not yet installed
library(tidyverse)

# @TODO: Set working directory to where the 'MiCM-Data-Wrangling-Workshop'
# GitHub repository is located ('-main' might be appended to the end).
setwd("~/path/to/working/directory/MiCM-Data-Wrangling-Workshop")

#-------------------------------------------------------------------------------
# tibble: An alternative to the base R 'data.frame()'
#-------------------------------------------------------------------------------
# Column-wise tibble creation: x & y are variables (columns)
tibble(x = 1:5,
       y = 5:1)

# Scalars (vectors of length 1 in R) are copied down a column
tibble(x = 1:5,
       y = 99)

# Heterogeneous data. 'LETTERS' is a built-in R constant
tibble(x = 1:5,
       y = LETTERS[1:5])


# Create a formula 'f' to create a new variable (column) based on existing ones
tibble(x = 1:5,
       y = 99,
       f = x + y)

tibble(x = 1:5,
       y = 2,
       f = x^y)

tibble(x = 1:5,
       y = LETTERS[1:5],
       f = paste(x, y, sep=""))

# Row-wise tibble creation: the TRansposed tibble ('tribble')
tribble(~item,    ~n,
        "Apple",  1,
        "Banana", 2,
        "Carrot", 3)

# Fixing variable (column) names
tibble(x = 1:5,
       x = 5:1,
       .name_repair = "unique")

# Coerce a data frame (or other base R object) to a tibble
?iris
iris_tibble <- as_tibble(iris)
head(iris_tibble)
iris_tibble

# Printing & viewing tibbles
t <- tibble(x = 1:10,
            y = 99)

print(t, n = 3)
View(t)

#-------------------------------------------------------------------------------
# readr: Read & Write Data
#-------------------------------------------------------------------------------
# Read files with Comma Separated Values (*.csv)
readr::read_csv("./data/in1.csv",
                col_names = FALSE)

# Read files with Tab Separated Values (*.tsv)
readr::read_tsv("./data/in1.tsv",
                col_names = FALSE)

# Read in a file, replacing specified values with 'NA'
readr::read_csv("./data/in1.csv",
                col_names = FALSE,
                na = c("FALSE"))

# Read files with any delimiter
file_in1_tsv <- readr::read_delim("./data/in1.tsv",
                                  delim = "\t",
                                  col_names = FALSE)
file_in1_tsv

# Write file as Comma Separated Values (*.csv), with header (by default)
readr::write_csv(file_in1_tsv,
                 "./out/out1.csv")

# Write file as Tab Separated Values (*.tsv), without header
readr::write_tsv(file_in1_tsv,
                 "./out/out1.tsv",
                 col_names = FALSE)

# Write files with any delimiter
readr::write_delim(file_in1_tsv,
                   "./out/out1.txt",
                   delim = "\n")


#-------------------------------------------------------------------------------
# dplyr: The Core of Data Wrangling
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
# lubridate: Dates & Time
#-------------------------------------------------------------------------------
# Try Sys.timezone() if 'tz' parameter is not recognized
tz1 <- lubridate::ymd_hms("2021-03-26 23:00:30", tz = "America/Montreal")
tz1
lubridate::with_tz(tz1, "America/Vancouver")

times <- c("2021.02.05 14:52:29", "19820924090000")
lubridate::ymd_hms(times)
lubridate::ymd_hms(times, tz = "America/Montreal")

#-------------------------------------------------------------------------------
# Preparing Data for Downstream Analyses
#-------------------------------------------------------------------------------
# Append timestamps to your ouput
time <- function() {
  gsub('-', '', Sys.time()) %>% gsub('\\s+', '-', .) %>% gsub(':', '', .)
}

time() # append to output filenames, plots
