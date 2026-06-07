import pandas as pd
import numpy as np

chars = list('abcedfghijklmnopqrstuvwxyz')
values = np.arange(26)
mapping = dict(zip(chars, values))

s1 = pd.Series(chars)
s2 = pd.Series(values)
s3 = pd.Series(mapping)

print(s3.head())