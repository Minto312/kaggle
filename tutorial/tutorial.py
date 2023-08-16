import pandas as pd
from sklearn.tree import DecisionTreeRegressor
from sklearn.ensemble import RandomForestRegressor
from sklearn.model_selection import train_test_split
from sklearn.metrics import mean_absolute_error

def calc_mae(x,y,val_x,val_y,level):
    model = RandomForestRegressor(max_leaf_nodes=level, random_state=0)
    model.fit(x,y)
    pred = model.predict(val_x)
    mae = mean_absolute_error(val_y,pred)
    print(f'\n\nlevel : {level}\nmae : {mae}\n')

data = pd.read_csv('melb_data.csv')
print(data.describe())

# 欠損が1つでもある行を削除
# axis=0: 行方向, default: how='any'
data = data.dropna(axis=0)

# 目的変数
y = data.Price

# 説明変数
features = ['Rooms', 'Bathroom', 'Landsize', 'Lattitude', 'Longtitude']
x = data[features]

train_x, val_x, train_y, val_y = train_test_split(x, y, random_state=1)

# モデルの作成
# model = DecisionTreeRegressor(random_state=1)
# model.fit(train_x, train_y)

# 予測
levels = [5,25,50,200,400,500,1000,5000]

for l in levels:
    calc_mae(train_x,train_y,val_x,val_y,l)