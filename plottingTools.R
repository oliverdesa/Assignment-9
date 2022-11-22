# Name: Oliver De Sa
# SciNet username: tmp_odesa
# Description:
#   Functions to be used for Assignment 9

library(ggplot2)
library(ggsignif)

mouse_data <- read.csv('141122GBRepeat(IL8).csv')

Boxplot <- function(dataframe){
  sig_test <- function
  
  ggplot(data = dataframe, aes(x = Day, y = Corrected.OD655, fill = Treatment)) +
    geom_boxplot() +
    geom_signif(
      annotations = c('*', '*'),
      y_position = c(0.55, 0.5), xmin = c(0.8, 1.8), xmax = c(1.2, 2.2)) +
      
    #geom_signif(comparisons = list(c('D14', 'D30')), 
                #y_position = 0.5, tip_length = 0, vjust = 0.2)+
    labs(x = 'Day Post Treatment',
         y = 'Response Ratio (650nm)',
         title = 'Effect of SaGA Supplementation on MDP Levels of Fecal Samples',
         fill = 'Treatment') +
    theme_bw()
         
}
