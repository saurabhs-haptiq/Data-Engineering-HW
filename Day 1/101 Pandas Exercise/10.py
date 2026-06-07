import numpy as np
import pandas as pd

np.random.seed(100)
data_series = pd.Series(np.random.randint(1, 5, [12]))

print("Top 2 Freq:", data_series.value_counts())

data_series[~data_series.isin(data_series.value_counts().index[:2])] = 'Other'

print(data_series)