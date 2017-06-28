FROM hiroyukionaka/pandoc-redpen-ja
MAINTAINER Hiroyuki Onaka

RUN apt-get -y update

RUN apt-get install -y openjdk-8-jdk

RUN (cd /opt && wget https://github.com/redpen-cc/redpen/releases/download/redpen-1.9.0/redpen-1.9.0.tar.gz)

RUN (cd /opt && tar xvf redpen-*.tar.gz)

RUN mkdir -p /tmp/code
ADD . /tmp/code/
RUN rm -rf /tmp/code/target
RUN mkdir -p /tmp/code/target

WORKDIR /tmp/code

CMD bash /tmp/code/build.sh
