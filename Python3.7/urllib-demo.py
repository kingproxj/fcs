import urllib.request
import os

os.environ['CodeUri'] = 'https://raw.githubusercontent.com/kingproxj/fcs/master/index.py,https://raw.githubusercontent.com/kingproxj/fcs/master/Python3.7/test.py,https://raw.githubusercontent.com/kingproxj/fcs/master/Python3.7/start.sh'

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

lst = os.listdir(os.getcwd())  # 获取当前目录下所有的文件名
for c in lst:
    if os.path.isfile(c) and c.endswith('.py') and c.find("run")== -1 and c.find("urllib-demo") == -1:  #判断文件名是以.py结尾的，并且去掉run.py文件
        print("开始执行", c)  #查看文件
        os.system('python {}'.format(c))  #相当于在终端执行文件  python main.py
    if os.path.isfile(c) and c.endswith('.sh'):
        print("开始执行", c)  #查看文件
        co = "sh " + c
        os.system(co)
