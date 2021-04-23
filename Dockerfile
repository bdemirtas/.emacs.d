# Dockerfile

FROM ubuntu:20.04
RUN apt-get update
RUN apt-get install -y emacs

COPY ./entrypoint.sh /

WORKDIR /root/.emacs.d
COPY . /root/.emacs.d

CMD ["/entrypoint.sh"]
