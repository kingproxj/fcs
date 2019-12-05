FROM python:3.7.5-alpine3.10

RUN apk update \
        && apk upgrade \
        && apk add --no-cache bash bash-doc bash-completion \
        bzip2 graphviz \
        ###gcc \
        autoconf g++ libtool freetype-dev gfortran musl-dev libgcc libquadmath musl libgfortran lapack-dev linux-headers freetds-dev \
	    git zip curl \
        && rm -rf /var/cache/apk/* \
        && /bin/bash \
        && mkdir -p /fcs /score /score/model_file/loan /score/model_pkl/loan

RUN pip3 install --upgrade pip -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
        && pip3 install --no-cache-dir setuptools==41.0.0 -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	&& pip3 install --no-cache-dir Cython==0.29.14 -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	&& pip3 install --no-cache-dir anaconda  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	###&& pip3 install --no-cache-dir conda==4.3.16  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	&& pip3 install --no-cache-dir cx_Oracle==7.2.0  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	&& pip3 install --no-cache-dir python-dateutil==2.8.0  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	&& pip3 install --no-cache-dir django==2.2.5  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	&& pip3 install --no-cache-dir gensim==3.7.0  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	&& pip3 install --no-cache-dir hyperopt==0.2.2  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	&& pip3 install --no-cache-dir Imblearn==0.0  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	&& pip3 install --no-cache-dir IPython==6.5.0  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	&& pip3 install --no-cache-dir jieba==0.39  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	&& pip3 install --no-cache-dir numpy==1.16.4  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	&& pip3 install --no-cache-dir joblib==0.13.2  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	&& pip3 install --no-cache-dir simplejson  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	###&& pip3 install --no-cache-dir keras==2.3.0  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	&& pip3 install --no-cache-dir matplotlib==3.0.3  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	&& pip3 install --no-cache-dir pandas==0.25.1  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	&& pip3 install --no-cache-dir py2neo==4.3.0  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	&& pip3 install --no-cache-dir pydotplus==2.0.2  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	&& pip3 install --no-cache-dir requests==2.22.0  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	###&& pip3 install --no-cache-dir scikit-image==0.14.0  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	&& pip3 install --no-cache-dir scikit-learn==0.20.2  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	&& pip3 install --no-cache-dir scikit-surprise==1.0.6  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	&& pip3 install --no-cache-dir scipy==1.2.1  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	&& pip3 install --no-cache-dir seaborn==0.9.0  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	&& pip3 install --no-cache-dir sklearn  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	&& pip3 install --no-cache-dir SQLAlchemy==1.2.11  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	&& pip3 install --no-cache-dir sqlalchemy==1.3.3  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	###&& pip3 install --no-cache-dir tensorflow==1.14.0  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	&& pip3 install --no-cache-dir tornado==5.1  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	###&& pip3 install --no-cache-dir xgboost==0.90  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	&& pip3 install --no-cache-dir uwsgi -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com

ADD . /score
ADD urllib-demo.py /fcs

CMD ["/bin/sh", "-c", "sleep 360000"]
