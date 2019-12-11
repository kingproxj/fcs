import urllib.request
import os

from multiprocessing import Process
import time

os.environ['CodeUri'] = 'https://raw.githubusercontent.com/kingproxj/fcs/master/Python3.7/test.py,https://raw.githubusercontent.com/kingproxj/fcs/master/Python3.7/start.sh'

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
        print('%s当前下载进度：%d' % (filename, per))

if "CodeUri" in os.environ:
    codeUris = (os.getenv('CodeUri')).split(',')
    start_time=time.time()
    p_l=[]
    for code_url in codeUris:
        filename = code_url.split('/')[-1]
        print("开始下载", filename)
        #urllib.request.urlretrieve(code_url, filename, Schedule)

        p=Process(target=urllib.request.urlretrieve,args=(code_url, filename, Schedule))
        p_l.append(p)
        p.start()

    for p in p_l:
        p.join()

    print('主线程运行时间: %s'%(time.time()-start_time))
