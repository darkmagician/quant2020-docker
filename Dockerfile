FROM continuumio/anaconda3:2020.02


# TA-Lib
RUN apt-get update -y &&\
  apt install build-essential wget -y && \
  wget http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz && \
  tar -xvzf ta-lib-0.4.0-src.tar.gz && \
  cd ta-lib/ && \
  ./configure --prefix=/usr && \
  make && \
  make install  && \
  cd .. && rm -R ta-lib ta-lib-0.4.0-src.tar.gz && rm -rf /var/lib/apt/lists/*

ADD requirements.txt /tmp/
RUN pip install -r /tmp/requirements.txt

ENV PYTHONIOENCODING=UTF-8
ENV TZ=Asia/Shanghai