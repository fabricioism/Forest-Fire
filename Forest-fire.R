#Libraries
library(readr)
library(dplyr)
library(ggplot2)
#Load Data
forest_fire_data <- read.csv('forestfires.csv')

#Group by day
forest_fires_day <- forest_fire_data %>%
  group_by(day) %>%
  summarise(total_fires = n())

#reordered
forest_fires_day<- forest_fires_day %>% 
  mutate(day = factor(day, levels = c("sun", "mon", "tue", "wed", 
  "thu", "fri", "sat")))

#Graph
ggplot(data = forest_fires_day) +
  aes(x = day, y = total_fires) +
  geom_bar(stat = 'identity') +
  labs(title = "Fires by Day", x = "Day", y = "Total fires") +
  theme(panel.background = element_rect(fill = 'white'))


#Group by month
forest_fires_month <- forest_fire_data %>%
  group_by(month) %>%
  summarise(total_fires = n())

#reordered
forest_fires_month<- forest_fires_month %>% 
  mutate(month = factor(month, levels = c("jan", "feb", "mar", 
  "apr", "may", "jun", "jul", "aug", "sep", "oct", "nov", "dec")))

#Graph
ggplot(data = forest_fires_month) +
  aes(x = month, y = total_fires) +
  geom_bar(stat = 'identity') +
  labs(title = "Fires by Month", x = "Month", y = "Total fires") +
  theme(panel.background = element_rect(fill = 'white'))
