library(tidyverse)
library(distill)
library(ggthemes)
library(knitr)
library(tigris)
library(rvest)
library(janitor)

tab1 <- read_rds("table.rds") 

#Graph that displays the top ten highest paying occupations for men 
men_graph1 <- tab1 |>
  arrange(desc(men_salary)) |> 
  slice(1:10) |>
  ggplot(aes(x = occupation, y = men_salary)) +
  geom_col(fill = "sky blue") +
  theme(axis.text.x = element_text(angle = 30, vjust = 0.8, hjust = 0.8)) +
  labs(title = "Occupations with the Highest Median Salaries for Men",
       subtitle = "Nurse Anesthetists earn the highest median salary of $182,499",
       x = "Occupation", y = "Salary",
       caption = "Source: U.S. DOL, Women's Bureau") 

#Graph that displays the top ten highest paying occupations for women 
women_graph1 <- tab1 |>
  arrange(desc(women_salary)) |> 
  slice(1:10) |>
  ggplot(aes(x = occupation, y = men_salary)) +
  geom_col(fill = "light blue") +
  theme(axis.text.x = element_text(angle = 30, vjust = 0.8, hjust = 0.8)) +
  labs(title = "Occupations with the Highest Median Salaries for Women",
       subtitle = "Nurse Anesthetists earn the highest median salary of $171,149",       
       x = "Occupation", y = "Salary",
       caption = "Source: U.S. DOL, Women's Bureau")


#Saving the graphs as images
ggsave("women-graph1.png", women_graph1)
ggsave("men-graph1.png", men_graph1)

