#Libraries
library(readr)
library(dplyr)
library(ggplot2)
library(purrr)

#Load Data
forest_fire_data <- read.csv('forestfires.csv')

#BOX PLOTS
#Function by Month
box_plot_month<- function(x, y){
  ggplot(data = forest_fire_data) +
    aes_string(x = x, y = y) +
    geom_boxplot() +
    labs(title = "Distribution by month") +
    theme(panel.background = element_rect(fill = 'white'))
}

#Function by Day
box_plot_day<- function(x, y){
  ggplot(data = forest_fire_data) +
    aes_string(x = x, y = y) +
    geom_boxplot() +
    labs(title = "Distribution by Day") +
    theme(panel.background = element_rect(fill = 'white'))
}

#Variables
x_var_day<- names(forest_fire_data)[4]
x_var_month<- names(forest_fire_data)[3]
y_var<- names(forest_fire_data)[5:12] 


#Mapping
fires_by_month <- map2(x_var_month, y_var, box_plot_month)
fires_by_day <- map2(x_var_day, y_var, box_plot_day)

