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
