library(tidyverse)
library(distill)
library(ggthemes)
library(knitr)
library(tigris)
library(rvest)
library(janitor)


web_table <- "https://www.dol.gov/agencies/wb/data/occupations" |>
  read_html() |>
  html_elements("table") |>
  html_table()

table <- web_table[[1]]

imp_table <- web_table[[1]] |>
  clean_names() |>
  mutate(men_salary = as.numeric(gsub(",", "", table$'Median earnings men'))) |>
  mutate(women_salary = as.numeric(gsub(",", "", table$'Median earnings women'))) |>
  mutate(women_num = as.numeric(gsub(",", "", table$'Number of women'))) |>
  mutate(men_num = as.numeric(gsub(",", "", table$'Number of men')))
  

write_rds(imp_table, file = "table.rds")

