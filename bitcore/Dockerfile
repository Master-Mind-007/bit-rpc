FROM ubuntu:20.04

RUN apt-get -qy update && \
    apt-get -qy install python2.7 python2.7-dev python2.7-doc python-pip-whl python3 python3-dev python3-pip virtualenv virtualenvwrapper && \
    apt-get -qy clean

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -qy install git wget curl vim-tiny nano net-tools libssl-dev libgirepository1.0-dev gobject-introspection cairo-5c libcairo-gobject2 libcairo2-dev pkg-config && \
    apt-get -qy install libpq-dev postgresql-client-common postgresql-common && \
    apt-get -qy clean

WORKDIR /bitcore

COPY . .
RUN chmod +x run.sh

RUN wget https://bitcoincore.org/bin/bitcoin-core-25.1/bitcoin-25.1-x86_64-linux-gnu.tar.gz
RUN tar xzf bitcoin-25.1-x86_64-linux-gnu.tar.gz
RUN install -m 0755 -o root -g root -t /usr/local/bin bitcoin-25.1/bin/*
RUN bitcoind -daemon
RUN copy bitcoin.conf ~/.bitcoin/bitcoin.conf
RUN ls ~/.bitcoin

EXPOSE 8332

CMD ["bash", "/bitcore/run.sh"]
