---
title: "How to Read Data using Python?"
draft: false
---

## Read From Text File
Suppose we have an example data file

```
symbol,date,time,high,low
appl,20000101,15:00,100.1,90.5
appl,20000102,15:00,100.1,90.5
intc,20000101,15:00,30.1,28.5
```

## Use Python Built-in I/O

If the csv data file is clean and ready to be used (pure numeric, no delimiter messing up, no quote problem), we can use the simple Python I/O interface to read it.

**Method One**: Loop the data file line by line. This method is more efficient and recommended. "line" is a string. strip() and split() are used to clean string and delimit the data.

```
with open('data', 'r') as f:
  data = []
  header = f.readline().strip().split(',')
  for line in f:           # line is a string
    linelist = line.split(',') # linelist is a string list, split it first
    fields = []
    for lineitem in linelist:
      fields.append( lineitem.strip() ) # strip item by item
      data.append( fields )
```

**Method Two**: Read all the lines one time into a list. Loop the list and parse the data item by item. This method is not as fast as the previous one.

```
with open('data', 'r') as f:
  data = []
  header = f.readline().strip().split(',')
  lines = f.readlines()
  for line in lines:     # line is a string
    linelist = line.split(',') # linelist is a string list, split it first
    fields = []
    for lineitem in linelist:
      fields.append( lineitem.strip() ) # strip item by item
      data.append( fields )
```

## Post-processing for Python Built-in I/O

You can split the string and convert the list elements to numbers, date, time or any type you want. What I usually do is convert them to foat, insert them into a Python list as a feature/field/column record.

```
with open('data', 'r') as f:
  data = []
  header = f.readline().strip().split(',')
  for line in f:           # line is a string
    linelist = line.split(',') # linelist is a string list, split it first
    fields = []
    for i,stritem in enumerate(linelist):
#clean data item by item
      if( header[i]=="high" ):
        item = float( stritem.strip() )
      elif( header[i]=="low" ):
        item = float( stritem.strip() )
      else:
        item = stritem.strip()
      fields.append( item ) # set list item
    data.append( fields )
```

Or you can convert them to a Python dictionary

```
with open('data', 'r') as f:
  data = []
  header = f.readline().strip().split(',')
  for line in f: # line is a string
    linelist = line.split(',') # linelist is a string list, split it first

    fields = {}
    for i,stritem in enumerate(linelist):
#clean data item by item
      if( header[i]=="high" ):
        item = float( stritem.strip() )
      elif( header[i]=="low" ):
        item = float( stritem.strip() )
      else:
        item = stritem.strip()
      fields[header[i]]=item # set dictionary item
    data.append( fields )
```

## Use Python csv Module

If the data are not clean enough (including messing up characters), you had better use Python csv module because it will do most of the cleaning itself.

**Method One**: Use reader from csv module. This reader automatically knock out any unnecessary characters and delimit the data.

```
import csv
with open('data', 'r') as f:
  header = f.readline().strip().split(',')
  csvreader = csv.reader(f) # add optional arguments delimiter=','
  for strlist in csvreader: # line is a string list
    #do something to strlist
```

**Method Two**: Use DictReader from csv module. This reader automatically cleans any unnecessary characters and delimit the data. It reads the first line headers as dictionary keys and returns a dictionary each time. Keys are the header names.

```
import csv
with open('data', 'r') as f:
  csvreader = csv.DictReader(f) # add optional arguments delimiter=','
  for strdict in csvreader:     # line is a string dictionary
    #do something to strdict
```

## Use Python pandas Module

For stock data, it would be useful to convert them into pandas data type Series or DataFrame because it has an "index" feature that can automatically calculate aligned data.

```
import pandas as pd
df = pd.read_csv( 'data' ) # add optional arguments sep/delimiter=',', header=None/nrow
```

Read From SQL Database