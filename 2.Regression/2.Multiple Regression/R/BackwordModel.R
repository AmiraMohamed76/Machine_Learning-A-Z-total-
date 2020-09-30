# Multiple Regression

# importing Dataset
dataset = read.csv('50_Startups.csv')
# dataset = dataset[ ,2:3]

#Encoding categorical data 
dataset$State = factor(dataset$State,
                         levels = c('New York','California','Florida'),
                         labels = c(1, 2, 3))


#Splitting the dataset
#install.packages('caTools') this used to install libraries

library(caTools) # to import libraries
split = sample.split(dataset$Profit ,SplitRatio = 0.8) # SplitRatio means ratio for training set 
training_set = subset(dataset , split == TRUE)
test_set = subset(dataset , split == FALSE)

# Fitting multiple Linear Regression in training set
regressor = lm(formula = Profit~. ,  # . represent the all indepentant variables 
               data = training_set)
# we note that R language taking care of dummy trap by removing one of dummy variable


# Predicting the test set result
y_pred = predict(regressor , newdata = test_set)

# Buliding the optimal model using backword Elimation
# R language convert any space in column name od dataset by (.)
regressor = lm(formula = Profit~ R.D.Spend + Administration + Marketing.Spend + State , 
               data = training_set)
summary(regressor)

regressor = lm(formula = Profit~ R.D.Spend + Administration + Marketing.Spend , 
               data = training_set)
summary(regressor)

regressor = lm(formula = Profit~ R.D.Spend +  Marketing.Spend , 
               data = training_set)
summary(regressor)
