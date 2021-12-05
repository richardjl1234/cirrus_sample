FROM registry.access.redhat.com/ubi8/python-38:1-68
USER 0

ARG DEBIAN_FRONTEND=noninteractive

EXPOSE 5000
RUN mkdir -p /app
WORKDIR /app
COPY ./requirements.txt  .
RUN pip3 install -r requirements.txt

COPY .  .

USER 1001
CMD python main.py
