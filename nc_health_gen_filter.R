library(readr)
library(dplyr)
library(rstudioapi)
path <- dirname(rstudioapi::getActiveDocumentContext()$path)

nc_health <- read_delim(paste(path, "/county-healthy-indicators-2001-2015.csv", sep = ""), 
                                                  ";", escape_double = FALSE, trim_ws = TRUE)

nc_dentists <- nc_health %>%
  select("County", "Dentists per 10,000 pop: 2014")

head(nc_dentists)

small_pop <- nc_health %>%
  filter(`2015 NCHS Bridged Pop: total pop` < 50000)

head(small_pop)

most_preterm <- nc_health %>%
  filter(!`Preterm Births : 2011-2015` < 10)

head(most_preterm)