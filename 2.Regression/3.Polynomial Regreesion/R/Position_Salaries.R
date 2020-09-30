# Polynomial Regression 
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


# Fitting Linear Regression to the dataset
lin_regressor = lm(formula = Salary ~ ., # . represent level col (indepentant variable)
                   data = dataset)

# Fitting polynomial Linear Regression to the dataset
dataset$Level2 = dataset$Level^2 # create new column in dataset
dataset$Level3 = dataset$Level^3
dataset$Level4 = dataset$Level^4
poly_regressor = lm(formula = Salary ~ ., # . represent level, level2, level3 col (indepentant variable)
                    data = dataset)
# Visualizing the linear regression result
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$Level ,y = dataset$Salary),
             colour ='red') + 
  geom_line(aes(x = dataset$Level ,y = predict(lin_regressor ,newdata = dataset)),
            colour ='blue') +
  ggtitle('Truth and Bluff(Linear Regression)') +
  xlab('Level') +
  ylab('Salary')

# Visualizing the Polynomial linear regression result
ggplot() +
  geom_point(aes(x = dataset$Level ,y = dataset$Salary),
             colour ='red') + 
  geom_line(aes(x = dataset$Level ,y = predict(poly_regressor ,newdata = dataset)),
            colour ='blue') +
  ggtitle('Truth and Bluff(polynomial Regression)') +
  xlab('Level') +
  ylab('Salary')
# Predicting a new result with linear Regression
y_pred = predict(lin_regressor , data.frame(Level = 6.5))

# Predicting a new result with Polynomial Regression
y_pred_2 = predict(poly_regressor , data.frame(Level = 6.5,
                                            Level2 = 6.5^2,
                                            Level3 = 6.5^3,
                                            Level4 = 6.5^4))