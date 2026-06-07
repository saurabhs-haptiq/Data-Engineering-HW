import numpy as np
import pandas as pd
import re

email_data = pd.Series([
    'buying books at amazom.com',
    'rameses@egypt.com',
    'matt@t.co',
    'narendra@modi.com'
])

email_pattern = r'[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}'

valid_mask = email_data.map(lambda text: bool(re.match(email_pattern, text)))
email_data[valid_mask]

email_data.str.findall(email_pattern, flags=re.IGNORECASE)

print([
    match[0]
    for match in [re.findall(email_pattern, entry) for entry in email_data]
    if len(match) > 0
])