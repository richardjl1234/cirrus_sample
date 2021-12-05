FROM ubuntu:latest

# the line which is commented out is for python3.6, and workable for byoi mode in cirrus
# while the python3.8 is workable for Dockerfile mode
#RUN apt-get update
RUN apt-get update --fix-missing \
  && apt-get install -y python3-pip python3.8-dev  \
  # && apt-get install -y python3-pip python3-dev \
  build-essential \
  make \
  gcc \
  swig \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y libpulse-dev
RUN apt-get clean

EXPOSE 5000

RUN pip3 install ibm_db
COPY ./common_func/db2consv_ee.lic  /usr/local/lib/python3.8/dist-packages/clidriver/license/
RUN chmod -R a+rwX '/usr/local/lib/python3.8/dist-packages/clidriver'
COPY ./common_func/db2consv_ee.lic  /usr/local/lib/python3.6/dist-packages/clidriver/license/
RUN chmod -R a+rwX '/usr/local/lib/python3.6/dist-packages/clidriver'

RUN mkdir -p /odm_modules
COPY ./common_func /odm_modules/common_func

RUN mkdir -p /app
WORKDIR /app
COPY ./requirements.txt  .
RUN pip3 install -r requirements.txt
COPY .  .
CMD python main.py
