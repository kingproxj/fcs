FROM python:3.7-buster

RUN apt-get update && apt-get install -y --no-install-recommends \
		vim \
      && rm -rf /var/lib/apt/lists/* \
      && mkdir -p /fcs \
      && mkdir -p /score \
      && mkdir -p /score/model_file/loan \
      && mkdir -p /score/model_pkl/loan 

ADD . /fcs
ADD urllib-demo.py /fcs
COPY urllib-demo.py /fcs
COPY index.py /fcs
WORKDIR /fcs

CMD ["/bin/sh", "-c", "sleep 360000"]
