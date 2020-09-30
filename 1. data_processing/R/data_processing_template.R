# importing Dataset
dataset = read.csv('Data.csv')
# dataset = dataset[ ,2:3]

#Splitting the dataset
#install.packages('caTools') this used to install libraries

library(caTools) # to import libraries
split = sample.split(dataset$Purchased ,SplitRatio = 0.8) # SplitRatio means ratio for training set 
training_set = subset(dataset , split == TRUE)
test_set = subset(dataset , split == FALSE)

# feature scaling 
# training_set[ ,2:3] = scale(training_set[ ,2:3]) #we choose col 2 and 3 because col 1and 4 aren't numerical values  
# test_set[ ,2:3] = scale(test_set[ ,2:3])
