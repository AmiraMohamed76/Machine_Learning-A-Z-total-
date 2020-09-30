# Simple Linear Regression

# importing Dataset
dataset = read.csv('Salary_Data.csv')
# dataset = dataset[ ,2:3]

#Splitting the dataset
#install.packages('caTools') this used to install libraries

library(caTools) # to import libraries
split = sample.split(dataset$Salary ,SplitRatio = 2/3) # SplitRatio means ratio for training set 
training_set = subset(dataset , split == TRUE)
test_set = subset(dataset , split == FALSE)

# feature scaling 
# training_set[ ,2:3] = scale(training_set[ ,2:3]) #we choose col 2 and 3 because col 1and 4 aren't numerical values  
# test_set[ ,2:3] = scale(test_set[ ,2:3])

# Fitting simple linear regression to training set
regressor = lm(formula = Salary ~ YearsExperience
               ,data = training_set)

# predicting the test set result
y_pred = predict(regressor, newdata = test_set)

# visualizing the training set result
# install.packages('ggplot2')
library(ggplot2)
ggplot() +
  geom_point(aes(x = training_set$YearsExperience ,y = training_set$Salary),
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience ,y = predict(regressor, newdata = training_set)),
            colour = 'blue') + 
  ggtitle('Salary vs Experience') +
  xlab('Years Of Experience') +
  ylab('Salary')

# visualizing the test set result
# install.packages('ggplot2')
library(ggplot2)
ggplot() +
  geom_point(aes(x = test_set$YearsExperience ,y = test_set$Salary),
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience ,y = predict(regressor, newdata = training_set)),
            colour = 'blue') + 
  ggtitle('Salary vs Experience') +
  xlab('Years Of Experience') +
  ylab('Salary')


