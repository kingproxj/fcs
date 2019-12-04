FROM python:3.7.5-alpine3.10

RUN apk update \
        && apk upgrade \
        && apk add --no-cache bash \
        gcc \
        g++ \
        bash-doc \
        bash-completion \
	    git \
	    zip \
	    curl \
        && rm -rf /var/cache/apk/* \
        && /bin/bash \
        && mkdir -p /fcs /score /score/model_file/loan /score/model_pkl/loan 
        
RUN pip3 install --upgrade pip -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com \
    && pip3 install gensim==3.7.0  -i http://pypi.douban.com/simple/ --trusted-host pypi.douban.com

ADD . /score
ADD urllib-demo.py /fcs

CMD ["/bin/sh", "-c", "sleep 360000"]
