#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Sep 16 23:10:32 2020

@author: amira_mohamed
"""
# Simple Linear Regression

#Importing libraries
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

#Importing dataset
dataset = pd.read_csv('Salary_Data.csv')
#creating matrix with 3 features without last col
X = dataset.iloc[: ,:-1].values
y = dataset.iloc[: ,1].values

# Splitting the dataset 
from sklearn.model_selection import train_test_split
X_train,X_test,y_train,y_test = train_test_split(X, y, test_size =1/3 ,random_state =0)

# feature scaling 
"""from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.fit_transform(X_test)"""

# Fitting simple linear regression to training set
from sklearn.linear_model import LinearRegression
regressor = LinearRegression()
regressor.fit(X_train, y_train)

""" 
1. First we import class from the library of each algorithm
2. Create object of this class
3. Fit data By this object
"""

# predicting the test set result
y_pred = regressor.predict(X_test)

# visualizing the training set result
plt.scatter(X_train, y_train, color ='red')
plt.plot(X_train, regressor.predict(X_train),color ='blue')
plt.title('Salary Vs Experience')
plt.xlabel('Experience')
plt.ylabel('Salary')
plt.show()