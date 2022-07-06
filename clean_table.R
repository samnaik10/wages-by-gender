library(tidyverse)
library(distill)
library(ggthemes)
library(knitr)
library(tigris)
library(rvest)
library(janitor)


salary <- "https://www.dol.gov/agencies/wb/data/occupations" |>
  read_html() |>
  html_elements("table") |>
  html_table()

imp_table <- salary[[1]] |>
  clean_names() |>
  mutate(men_salary = as.numeric(gsub(",", "", tab1$median_earnings_men))) |>
  mutate(women_salary = as.numeric(gsub(",", "", tab1$median_earnings_women)))

write_rds(imp_table, file = "table.rds")

