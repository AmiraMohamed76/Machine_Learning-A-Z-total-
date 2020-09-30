# Naive Bayes

# importing Dataset
dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[ ,3:5] # select columns that used in process

# Encoding the target feature as factor
dataset$Purchased = factor(dataset$Purchased ,levels = c(0, 1))
# We do this because we got error that y_pred is factor and this factor is empty 
# and cm got error because size of y_pred not like the y_test 

#Splitting the dataset
#install.packages('caTools') this used to install libraries

library(caTools) # to import libraries
split = sample.split(dataset$Purchased ,SplitRatio = 0.75) # SplitRatio means ratio for training set 
training_set = subset(dataset , split == TRUE)
test_set = subset(dataset , split == FALSE)

# feature scaling 
training_set[ ,1:2] = scale(training_set[ ,1:2]) #we choose col 2 and 3 because col 1and 4 aren't numerical values  
test_set[ ,1:2] = scale(test_set[ ,1:2])


# Fitting Naive Bayes to The Training set
library(e1071)
classifier = naiveBayes(x = training_set[-3],
                        y = training_set$Purchased)

# Predicting the test set result
y_pred = predict(classifier, newdata = test_set[-3])

# Making the Confusion Matrix (Evaluation)
cm = table(test_set[,3], y_pred)
# Visualising the Training set results
#install.packages('ElemStatLearn')
library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3],
     main = 'Naive Bayes (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))


# Visualising the Test set results
#library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3],
     main = 'Naive Bayes (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))