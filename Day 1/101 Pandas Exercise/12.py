import numpy as np
import pandas as pd

random_series = pd.Series(np.random.randint(1, 10, 35))

result_df = pd.DataFrame(random_series.values.reshape(7, 5))

print(result_df)