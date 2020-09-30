# Random Forest

# importing Dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[ ,2:3]  #remove position column

#Splitting the dataset
#install.packages('caTools') this used to install libraries

# library(caTools) # to import libraries
# split = sample.split(dataset$Purchased ,SplitRatio = 0.8) # SplitRatio means ratio for training set 
# training_set = subset(dataset , split == TRUE)
# test_set = subset(dataset , split == FALSE)

# feature scaling 
# training_set[ ,2:3] = scale(training_set[ ,2:3]) #we choose col 2 and 3 because col 1and 4 aren't numerical values  
# test_set[ ,2:3] = scale(test_set[ ,2:3])

# Fitting the Random Forest to the dataset
# install.packages('randomForest')
library(randomForest)
set.seed(1234)
regressor = randomForest(x = dataset[1], # return dataframe
                         y = dataset$Salary, # return vector
                         ntree = 500)

# Predicting a new result  
y_pred_2 = predict(regressor , data.frame(Level = 6.5))

# Visualizing the Random Forest result(for higher resolution and smoother curve)
library(ggplot2)
x_grid = seq(min(dataset$Level),max(dataset$Level),0.01)
ggplot() +
  geom_point(aes(x = dataset$Level ,y = dataset$Salary),
             colour ='red') + 
  geom_line(aes(x = x_grid ,y = predict(regressor ,newdata = data.frame(Level = x_grid))),
            colour ='blue') +
  ggtitle('Truth and Bluff(Random Forest)') +
  xlab('Level') +
  ylab('Salary') 