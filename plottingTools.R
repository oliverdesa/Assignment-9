# Name: Oliver De Sa
# SciNet username: tmp_odesa
# Description:
#   Functions to be used for Assignment 9

library(ggplot2)
library(ggsignif)

mouse_data <- read.csv('141122GBRepeat(IL8).csv')

Boxplot <- function(dataframe){
  ggplot(data = dataframe, aes(x = Day, y = Corrected.OD655, fill = 'Treatment')) +
    geom_boxplot()+
    geom_signif(comparisons = list(c('D14', 'D30')),
                map_signif_level = TRUE, na.rm = TRUE)
    labs(x = 'Day Post Treatment',
         y = 'Response Ratio (650nm)',
         title = 'Effect of SaGA Supplementation on MDP Levels of Fecal Samples',
         fill = 'Treatment') +
    theme_bw()
         
}
