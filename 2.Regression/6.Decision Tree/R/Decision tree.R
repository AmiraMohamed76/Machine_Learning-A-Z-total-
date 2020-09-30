# Decision Tree 

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

# Fitting the Regression Model to the dataset
# install.packages('rpart') 
library(rpart)
regressor = rpart(formula = Salary ~.,
                  data = dataset,
                  control = rpart.control(minsplit = 1) )
# control = rpart.control(minsplit = 1) we use this condition to remove constat line in plot

# Predicting a new result  
y_pred_2 = predict(regressor , data.frame(Level = 6.5))

# Visualizing Decision tree result
library(ggplot2) 
ggplot() +
  geom_point(aes(x = dataset$Level ,y = dataset$Salary),
             colour ='red') + 
  geom_line(aes(x = dataset$Level ,y = predict(regressor ,newdata = dataset)),
            colour ='blue') +
  ggtitle('Truth and Bluff( Decision tree )') +
  xlab('Level') +
  ylab('Salary')

# Visualizing t Decision tree  result(for higher resolution and smoother curve)
library(ggplot2)
x_grid = seq(min(dataset$Level),max(dataset$Level),0.01)
ggplot() +
  geom_point(aes(x = dataset$Level ,y = dataset$Salary),
             colour ='red') + 
  geom_line(aes(x = x_grid ,y = predict(regressor ,newdata = data.frame(Level = x_grid))),
            colour ='blue') +
  ggtitle('Truth and Bluff(  Decision tree )') +
  xlab('Level') +
  ylab('Salary') 