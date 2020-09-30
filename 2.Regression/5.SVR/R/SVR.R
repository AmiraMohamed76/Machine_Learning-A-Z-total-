# SVR

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
# install.packages('e1071')
library(e1071)
regressor = svm(formula = Salary ~ .,
                data = dataset,
                type = 'eps-regression')


# Predicting a new result  
y_pred_2 = predict(regressor , data.frame(Level = 6.5))
 

# Visualizing SVR result
library(ggplot2)
ggplot() +
geom_point(aes(x = dataset$Level ,y = dataset$Salary),
           colour ='red') + 
geom_line(aes(x = dataset$Level ,y = predict(regressor ,newdata = dataset)),
          colour ='blue') +
ggtitle('Truth and Bluff( SVR)') +
xlab('Level') +
ylab('Salary')
                                          
# Visualizing the SVR result(for higher resolution and smoother curve)
library(ggplot2)
x_grid = seq(min(dataset$Level),max(dataset$Level),0.1)
ggplot() +
geom_point(aes(x = dataset$Level ,y = dataset$Salary),
           colour ='red') + 
geom_line(aes(x = x_grid ,y = predict(regressor ,newdata = data.frame(Level = x_grid))),
          colour ='blue') +
ggtitle('Truth and Bluff(SVR)') +
xlab('Level') +
ylab('Salary')  