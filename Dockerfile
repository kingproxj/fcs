FROM python:3.7.5-alpine3.10

RUN apk update \
        && apk upgrade \
        && apk add --no-cache bash bash-doc bash-completion \
        bzip2 gcc g++ freetype-dev gfortran musl-dev libgcc libquadmath musl libgfortran lapack-dev linux-headers freetds-dev \
	    git zip curl \
        && rm -rf /var/cache/apk/* \
        && /bin/bash \
        && mkdir -p /fcs /score /score/model_file/loan /score/model_pkl/loan 

# Install conda
ENV CONDA_DIR /opt/conda
ENV PATH $CONDA_DIR/bin:$PATH

RUN wget --quiet --no-check-certificate https://repo.continuum.io/miniconda/Miniconda3-4.7.12.1-Linux-x86_64.sh && \
    ###echo "81c773ff87af5cfac79ab862942ab6b3 *Miniconda3-4.7.12.1-Linux-x86_64.sh" | md5sum -c - && \
    /bin/bash /Miniconda3-4.7.12.1-Linux-x86_64.sh -f -b -p $CONDA_DIR && \
    rm Miniconda3-4.7.12.1-Linux-x86_64.sh && \
    echo export PATH=$CONDA_DIR/bin:'$PATH' > /etc/profile.d/conda.sh

RUN pip3 install --upgrade pip -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
        && pip3 install setuptools==41.0.0 -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	&& pip3 install Cython==0.29.14 -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	&& pip3 install anaconda  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	###&& pip3 install conda==4.3.16  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	&& pip3 install cx_Oracle==7.2.0  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	&& pip3 install python-dateutil==2.8.0  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	&& pip3 install django==2.2.5  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	&& pip3 install gensim==3.7.0  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	&& pip3 install hyperopt==0.2.2  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	&& pip3 install Imblearn==0.0  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	&& pip3 install IPython==6.5.0  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	&& pip3 install jieba==0.39  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	&& pip3 install numpy==1.16.4  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	&& pip3 install joblib==0.13.2  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	&& pip3 install simplejson  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	###&& pip3 install keras==2.3.0  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	&& pip3 install matplotlib==3.0.3  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	&& pip3 install pandas==0.25.1  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	&& pip3 install py2neo==4.3.0  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	&& pip3 install pydotplus==2.0.2  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	&& pip3 install requests==2.22.0  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	###&& pip3 install scikit-image==0.14.0  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	&& pip3 install scikit-learn==0.20.2  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	&& pip3 install scikit-surprise==1.0.6  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	&& pip3 install scipy==1.2.1  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	&& pip3 install seaborn==0.9.0  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	&& pip3 install sklearn  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	&& pip3 install SQLAlchemy==1.2.11  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	&& pip3 install sqlalchemy==1.3.3  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	###&& pip3 install tensorflow==1.14.0  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	&& pip3 install tornado==5.1  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	###&& pip3 install xgboost==0.90  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    	&& pip3 install uwsgi -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com

ADD . /score
ADD urllib-demo.py /fcs

CMD ["/bin/sh", "-c", "sleep 360000"]
