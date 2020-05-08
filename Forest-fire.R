#Libraries
library(readr)
library(dplyr)
library(ggplot2)
library(purrr)

#Load Data
forest_fire_data <- read.csv('forestfires.csv')


affect_forest_scatter <- function(x,y){
  ggplot2::ggplot(data = forest_fire_data) +
    aes_string(x = x, y = y) +
    geom_point(alpha = 0.3) +
    theme(panel.background = element_rect(fill = "white"))
}

#Variables
x_var <- names(forest_fire_data)[5:12] 
y_var<- names(forest_fire_data)[13] 


#Mapping
affect_forest <- purrr::map2(x_var, y_var, affect_forest_scatter)