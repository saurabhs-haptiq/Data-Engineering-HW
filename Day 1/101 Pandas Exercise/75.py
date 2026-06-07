import numpy as np
import pandas as pd

data_frame = pd.DataFrame([
    "STD, City State",
    "33, Kolkata West Bengal",
    "44, Chennai Tamil Nadu",
    "40, Hyderabad Telengana",
    "80, Bangalore Karnataka"
], columns=['row'])

split_data = data_frame.row.str.split(',\s+', expand=True)

header_row = split_data.iloc[0]
split_data = split_data[1:]
split_data.columns = header_row

print(split_data)