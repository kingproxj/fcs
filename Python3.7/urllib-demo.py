import urllib

print("downloading with urllib")
DATA_URL = 'https://raw.githubusercontent.com/kingproxj/fcs/master/index.py'
filename = DATA_URL.split('/')[-1]
urllib.urlretrieve(DATA_URL, filename)
