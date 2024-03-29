import urllib.request
import os

os.environ['CodeUri'] = 'https://raw.githubusercontent.com/kingproxj/fcs/master/Dockerfile'

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
        print('当前下载进度：%d' % per)

if "CodeUri" in os.environ:
    codeUris = (os.getenv('CodeUri')).split(',')
    for code_url in codeUris:
        filename = code_url.split('/')[-1]
        print("开始下载", filename)
        urllib.request.urlretrieve(code_url, filename, Schedule)
