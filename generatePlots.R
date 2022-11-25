# Name: Oliver De Sa
# SciNet username: tmp_odesa
# Description:
#   Driver script to plot the results of assignment 9

## WARNING, Plot1 is meant to work with the SagAsupplement.csv file and plot2 is 
## meant to work with the standard.csv file!

source('plottingTools.R')

args <- commandArgs(trailingOnly = TRUE)

# Only accepts 2 arguments, the first must be either of the 2 datasets and 
# the second one must be either plot1 or plot2 
if (length(args)!= 2){
  print('please input 2 arguments')
} else if(!(args[2] %in% c('plot1', 'plot2'))){
  print('Argument 2 must be either plot1 or plot2')
} else if (args[1] == 'SagAsupplement.csv'){
    mouse_data <- csv2db(args[1])
    Boxplot(mouse_data)
    print('Image has been saved to directory as Boxplot.pdf')
} else if (args[1] == 'standard.csv'){
    standard_curve <- csv2db(args[1])
    Scatter_quadratic(standard_curve)
    print('Image has been saved to directory as Scatterplot.pdf')
} else{
    cat('Error:', args[1], 'is not a valid input file')
}
