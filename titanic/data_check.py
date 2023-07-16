from matplotlib import pyplot as plt
import pandas as pd
import os

print(os.getcwd())
data = pd.read_csv('/code/titanic/train.csv')

print(data.head())
print(data.describe())
print(data.info())

# Plotting the data
number_data = data.select_dtypes(include=['int64', 'float64'])

print('=====================')
print(number_data.head())
print(number_data.describe())



number_data.hist(figsize=(20, 10),bins=50, xlabelsize=8, ylabelsize=8)
plt.show()