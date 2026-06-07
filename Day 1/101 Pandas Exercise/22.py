import numpy as np
import pandas as pd
from dateutil.parser import parse

date_series = pd.Series([
    '01 Jan 2010',
    '02-02-2011',
    '20120303',
    '2013/04/04',
    '2014-05-05',
    '2015-06-06T12:20'
])

parsed_dates = date_series.map(lambda item: parse(item))

print("Date: ", parsed_dates.dt.day.tolist())
print("Week number: ", parsed_dates.dt.isocalendar().week.tolist())
print("Day num of year: ", parsed_dates.dt.dayofyear.tolist())
print("Day of week: ", parsed_dates.dt.day_name().tolist())