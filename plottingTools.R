# Name: Oliver De Sa
# SciNet username: tmp_odesa
# Description:
#   Functions to be used for Assignment 9

library(ggplot2)
library(ggsignif)

csv2db <- function(csv){
  plotData <- read.csv(csv)
  return(plotData)
}


# This function takes 2 groups, the Day 14 and Day 30 groups, and then splits them 
# by treatment type to visualize the differences between the 2 treatments at
# different time points post treatment.

Boxplot <- function(dataframe){
  
  # Disclaimer: I calculated the significance values plotted on this graph using
  # the pandas and scipy packages in python. Because I had to manually add the 
  # significance values to the plot anyway I didnt assess these stats here, 
  # but I will reference the code used in python to calculate:
  
  ## T test
  
  # pbsD14 = np.array(SagAsupplement.iloc[0:4,1])
  # pbsD30 = np.array(SagAsupplement.iloc[4:8,1])
  # 
  # SagAD14 = np.array(SagAsupplement.iloc[8:12,1])
  # SagAD30 = np.array(SagAsupplement.iloc[12:16,1])
  
  # Check for closely related variances
  # print(np.var(pbsD14), np.var(SagAD14))
  # print(np.var(pbsD30), np.var(SagAD30))
  # 
  # Run 2 sample unpaired T-test w/ equivalent variances 
  # print(stats.ttest_ind(a=pbsD14, b=SagAD14, equal_var=True))
  # print(stats.ttest_ind(a=pbsD30, b=SagAD30, equal_var=True))
  
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

# This function plots the Optical Density at 655nm depending on the amount of 
# stimulant added to the assay in ng/ml. A quadratic fit is then applied to the
# generated standard curve that allows for the approximation of stimulant concentration
# for each sample depending on its respective optical density.

Scatter_quadratic <- function(dataframe){
  ggplot(data = dataframe, aes(x = Conc, y = OD)) +
    geom_point() +
    stat_smooth(aes(y = OD), method = lm, formula = y~x + I(x^2)) +
    labs(x = '[MDP] (ng/mL)',
         y = 'Optical Density (650nm)') +
    theme_bw()
  ggsave('Scatterplot.pdf', scale = 2)
}


