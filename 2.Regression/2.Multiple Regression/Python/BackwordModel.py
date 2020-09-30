#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Sep 18 23:06:54 2020

@author: amiramohamed
"""

# Multiple Regression 

#Importing libraries
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

#Importing dataset
dataset = pd.read_csv('50_Startups.csv')
#creating matrix with 3 features without last col
X = dataset.iloc[: ,:-1].values
y = dataset.iloc[: ,4].values
# Encoding categorical data
# encoding for indepentant variables
from sklearn.preprocessing import LabelEncoder , OneHotEncoder
from sklearn.compose import ColumnTransformer

labelencoder_x = LabelEncoder()
X[:,3] = labelencoder_x.fit_transform(X[:,3])
transform = ColumnTransformer([("State", OneHotEncoder(),[3])], remainder="passthrough")
X = transform.fit_transform(X)

# Avoiding dummy variable trap 
X = X[: ,1:] # to remove one dummy variable

# Splitting the dataset 
from sklearn.model_selection import train_test_split
X_train,X_test,y_train,y_test = train_test_split(X, y, test_size =0.2 ,random_state =0)

# Fitting multiple Linear Regression in training set
from sklearn.linear_model import LinearRegression
regressor = LinearRegression() # creating object
regressor.fit(X_train ,y_train)

# Predicting the test set result
y_pred = regressor.predict(X_test)

# Buliding the optimal model using backword Elimation
import statsmodels.api as sm
X = np.append(arr = np.ones((50, 1)).astype(int) , values = X ,axis = 1)
X_opt = X[:,[0,1,2,3,4,5]]
X_opt = np.array(X_opt, dtype=float)
regressor_OLS = sm.OLS(y,X_opt).fit()
print(regressor_OLS.summary())

X_opt = X[:,[0,1,3,4,5]]
X_opt = np.array(X_opt, dtype=float)
regressor_OLS = sm.OLS(y,X_opt).fit()
print(regressor_OLS.summary())

X_opt = X[:,[0,3,4,5]]
X_opt = np.array(X_opt, dtype=float)
regressor_OLS = sm.OLS(y,X_opt).fit()
print(regressor_OLS.summary())

X_opt = X[:,[0,3,5]]
X_opt = np.array(X_opt, dtype=float)
regressor_OLS = sm.OLS(y,X_opt).fit()
print(regressor_OLS.summary())

X_opt = X[:,[0,3]]
X_opt = np.array(X_opt, dtype=float)
regressor_OLS = sm.OLS(y,X_opt).fit()
print(regressor_OLS.summary())

