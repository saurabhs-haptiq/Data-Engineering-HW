import numpy as np
import pandas as pd

series_a = pd.Series([1, 2, 3, 4, 5])
series_b = pd.Series([4, 5, 6, 7, 8])

print(series_a[~series_a.isin(series_b)])