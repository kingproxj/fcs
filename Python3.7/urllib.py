import urllib

print("downloading with urllib")
url = 'https://raw.githubusercontent.com/kingproxj/fcs/master/index.py'
print("downloading with urllib")
urllib.urlretrieve(url, "index-urllib.py")
