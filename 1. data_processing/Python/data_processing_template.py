#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Sep 16 22:43:47 2020

@author: amira_mohamed 
"""
#Importing libraries
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

#Importing dataset
dataset = pd.read_csv('Data.csv')
#creating matrix with 3 features without last col
X = dataset.iloc[: ,:-1].values
y = dataset.iloc[: ,3].values

# Splitting the dataset 
from sklearn.model_selection import train_test_split
X_train,X_test,y_train,y_test = train_test_split(X, y, test_size =0.2 ,random_state =0)

# feature scaling 
"""from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.fit_transform(X_test)"""

