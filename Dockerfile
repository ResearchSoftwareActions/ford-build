FROM python:3.7

RUN apt-get update &&\
    apt-get install --no-install-recommends -y \
    build-essential \
    graphviz
RUN pip install --no-cache-dir ford

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
