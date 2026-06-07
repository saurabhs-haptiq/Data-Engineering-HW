import numpy as np
import pandas as pd

data_table = pd.DataFrame(
    np.random.randint(1, 10, 20).reshape(-1, 4),
    columns=list('abcd')
)

print(pd.value_counts(data_table.values.ravel()))