import pandas as pd

data = pd.read_csv('/code/titanic/train.csv')

size = data['Ticket'].shape
size = int(size[0])

for i in range(size):
    print(data['Ticket'][i])