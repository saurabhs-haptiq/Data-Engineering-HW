import numpy as np
import pandas as pd

data_frame = pd.DataFrame(
    np.random.randint(1, 30, 30).reshape(10, -1),
    columns=list('abc')
)

rank_position = 5

print(data_frame['a'].argsort()[::-1][rank_position])