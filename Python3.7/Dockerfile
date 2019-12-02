FROM python:3.7-buster
MAINTAINER silenceshell <silenceshell@datastart.cn>

RUN apt-get update && apt-get install -y --no-install-recommends \
		vim \
      && rm -rf /var/lib/apt/lists/* \
      && mkdir -p /fcs \
      && mkdir -p /score/model_file/loan \
      && mkdir -p /score/model_pkl/loan 

ADD . /fcs
WORKDIR /fcs

CMD ["/bin/sh", "-c", "sleep 360000"]
