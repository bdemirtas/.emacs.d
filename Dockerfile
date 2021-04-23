# Dockerfile

FROM silex/emacs:27.2-dev

RUN apt-get update
RUN apt-get install sqlite3

COPY ./entrypoint.sh /

WORKDIR /root/.emacs.d
COPY . /root/.emacs.d

CMD ["/entrypoint.sh"]
