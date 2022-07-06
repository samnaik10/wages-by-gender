library(tidyverse)
library(distill)
library(ggthemes)
library(knitr)
library(tigris)
library(rvest)
library(janitor)

tab2 <- read_rds("table.rds") 

women_graph2 <- tab2 |>
  mutate(gap = women_salary - men_salary) |>
  filter(gap >= 0) |>
  arrange(desc(gap)) |>
  slice(1:10) |>
  ggplot(aes(x = occupation, y = gap)) +
  geom_col(fill = "pink") +
  theme(axis.text.x = element_text(angle = 30, vjust = 0.8, hjust = 0.8)) +
  labs(title = "Occupations with the Highest Median Salary Gap with Women Earning More",
       subtitle = "Healthcare Social Workers have the highest median salary gap",
       x = "Occupation", y = "Gap in Salary",
       caption = "Source: U.S. DOL, Women's Bureau")


men_graph2 <- tab2 |>
  mutate(gap = men_salary - women_salary) |>
  filter(gap >= 0) |>
  arrange(desc(gap)) |>
  slice(1:10) |>
  ggplot(aes(x = occupation, y = gap)) +
  geom_col(fill = "mediumorchid2") +
  theme(axis.text.x = element_text(angle = 30, vjust = 0.8, hjust = 0.8)) +
  labs(title = "Occupations with the Highest Median Salary Gap with Men Earning More",
       subtitle = "Securities, Commodities, and Financial Sevices Sales Agents have the highest median salary gap",
       x = "Occupation", y = "Gap in Salary",
       caption = "Source: U.S. DOL, Women's Bureau")


ggsave("women-graph2.png", women_graph2)
ggsave("men-graph2.png", men_graph2)

