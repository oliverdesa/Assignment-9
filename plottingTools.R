# Name: Oliver De Sa
# SciNet username: tmp_odesa
# Description:
#   Functions to be used for Assignment 9

library(ggplot2)
library(ggsignif)

Boxplot <- function(dataframe){
  ggplot(data = dataframe, aes(x = Day, y = Corrected.OD655, fill = Treatment)) +
    geom_boxplot() +
    geom_signif(
      annotations = c('*', '*'),
      y_position = c(0.55, 0.5), xmin = c(0.8, 1.8), xmax = c(1.2, 2.2)) +
    labs(x = 'Day Post Treatment',
         y = 'Optical Density (650nm)',
         fill = 'Treatment') +
    theme_bw()
  ggsave('Boxplot.pdf', scale = 2)
}

Scatter_quadratic <- function(dataframe){
  ggplot(data = dataframe, aes(x = Conc, y = OD)) +
    geom_point() +
    stat_smooth(aes(y = OD), method = lm, formula = y~x + I(x^2)) +
    labs(x = '[MDP] (ng/mL)',
         y = 'Optical Density (650nm)') +
    theme_bw()
  ggsave('Scatterplot.pdf', scale = 2)
}


