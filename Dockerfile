# Dockerfile

FROM ubuntu:20.04
RUN apt-get update
RUN apt-get install -y emacs

COPY ./entrypoint.sh /

WORKDIR /opt/emacs
COPY . /opt/emacs
RUN chmod a+x /opt/emacs

CMD ["/entrypoint.sh"]
