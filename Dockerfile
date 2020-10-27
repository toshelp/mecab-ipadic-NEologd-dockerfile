FROM ubuntu:bionic
MAINTAINER toshelp

WORKDIR /root
RUN apt-get update && apt-get install -y wget sudo
RUN apt-get install -y mecab libmecab-dev mecab-ipadic-utf8 git make curl xz-utils file
RUN git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git

WORKDIR /root/mecab-ipadic-neologd
RUN echo yes | ./bin/install-mecab-ipadic-neologd -n -a

ENTRYPOINT mecab -d /usr/lib/x86_64-linux-gnu/mecab/dic/mecab-ipadic-neologd
