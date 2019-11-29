FROM python:3.7-buster
MAINTAINER silenceshell <silenceshell@datastart.cn>
RUN apt-get update && apt-get install -y --no-install-recommends \
		vim \
      && rm -rf /var/lib/apt/lists/* \
      && mkdir -p /fcs
WORKDIR /fcs
COPY urllib-demo.py .
CMD ["/bin/sh", "-c", "sleep 360000"]
