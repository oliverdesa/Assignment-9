# Name: Oliver De Sa
# SciNet username: tmp_odesa
# Description:
#   Driver script to plot the results of assignment 9

source('plottingTools.R')

args <- commandArgs(trailingOnly = TRUE)

if (length(args != 2)){
  print('please input 2 arguments')
} else if (as.character(args[1]) & length(args) != 1){
  print('Argument 1 must be a filename')
} else if(!(args %in% c('plot1', 'plot2'))){
  print('Argument 2 must be either plot1 or plot2')
}