FROM debian:buster
LABEL com.telegram-bot.vendor="Latino"
ARG DEBIAN_FRONTEND=noninteractive
WORKDIR /tmp
RUN apt update
RUN apt upgrade -qq -y
RUN apt install -y --assume-yes \
	apt-utils \
	dialog
RUN apt install -y git \
  build-essential \
  cmake \
  libreadline-dev
RUN git clone --recursive https://github.com/primitivorm/latino
WORKDIR latino
RUN cmake . && \
  make && \
  make install
