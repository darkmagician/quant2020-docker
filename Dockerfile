FROM continuumio/anaconda3:2020.02


# TA-Lib
RUN wget http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz && \
  tar -xvzf ta-lib-0.4.0-src.tar.gz && \
  cd ta-lib/ && \
  ./configure --prefix=/usr && \
  make && \
  make install  &&\
  rm -R ta-lib ta-lib-0.4.0-src.tar.gz

ADD requirements.txt /tmp/
RUN pip install -r /tmp/requirements.txt

ENV PYTHONIOENCODING=UTF-8
ENV TZ=Asia/Shanghai