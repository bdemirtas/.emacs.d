# Dockerfile

FROM ubuntu:20.04
RUN apt-get update
RUN apt-get install -y emacs

COPY ./entrypoint.sh /

WORKDIR /tmp/.emacs.d
COPY . /tmp/.emacs.d

CMD ["/entrypoint.sh"]
