library(readr)
library(dplyr)
library(ggplot2)
library(purrr)

forest_fires <- read_csv("forestfires.csv")

fires_by_month <- forest_fires %>%
  group_by(month) %>%
  summarize(total_fires = n())
ggplot(data = fires_by_month) +
  aes(x = month, y = total_fires) +
  geom_bar(stat = "identity")  +
  theme(panel.background = element_rect(fill = "white"), 
        axis.line = element_line(size = 0.25, 
                                 colour = "black"))

fires_by_DOW <- forest_fires %>%
  group_by(day) %>%
  summarize(total_fires = n())
ggplot(data = fires_by_DOW) +
  aes(x = day, y = total_fires) +
  geom_bar(stat = "identity") +
  theme(panel.background = element_rect(fill = "white"), 
        axis.line = element_line(size = 0.25, 
                                 colour = "black")) 

forest_fires <- forest_fires %>%
  mutate(month = factor(month, levels = c("jan", "feb", "mar", "apr", "may", "jun", "jul", "aug", "sep", "oct", "nov", "dec")), 
         day = factor(day, levels = c("sun", "mon", "tue", "wed", "thu", "fri", "sat")))
