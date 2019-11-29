import urllib
import os

os.putenv('codeUri','https://raw.githubusercontent.com/kingproxj/fcs/master/index.py,https://raw.githubusercontent.com/kingproxj/fcs/master/Python3.7/test.py')

def Schedule(blocknum, blocksize, totalsize):
    '''
    :param blocknum: 已经下载的数据块
    :param blocksize: 数据块的大小
    :param totalsize: 远程文件的大小
    :return:
    '''
    per = 100.0*blocknum*blocksize/totalsize
    if per > 100:
        per = 100
        print('当前下载进度：%d') % per

codeUri = os.getenv('codeUri')
for code_url in codeUri:
    filename = code_url.split('/')[-1]
    print("开始下载%s", filename)
    urllib.request.urlretrieve(code_url, filename, Schedule)
