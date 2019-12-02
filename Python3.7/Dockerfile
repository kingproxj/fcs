FROM python:3.7-buster
MAINTAINER silenceshell <silenceshell@datastart.cn>

COPY urllib-demo.py /tmp/
COPY start.sh /tmp/

RUN apt-get update && apt-get install -y --no-install-recommends \
		vim \
      && rm -rf /var/lib/apt/lists/* \
      && mkdir -p /fcs \
      && mkdir -p /score/model_file/loan \
      && mkdir -p /score/model_pkl/loan \
      && cp /tmp/urllib-demo.py /fcs/ \
      && && cp /tmp/start.sh /fcs/
WORKDIR /fcs

RUN curl -X GET --header 'Accept: application/octet-stream' "https://raw.githubusercontent.com/kingproxj/fcs/master/Python3.7/urllib-demo.py" -o urllib-demo.py

CMD ["/bin/sh", "-c", "sleep 360000"]
