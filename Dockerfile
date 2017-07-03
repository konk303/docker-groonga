FROM debian:jessie
MAINTAINER Kimihiko NAKAMURA <nakamura.808@gmail.com>

# see http://groonga.org/ja/docs/install/debian.html#stretch

RUN apt-get update \
    && apt-get install -y apt-transport-https

RUN echo 'deb https://packages.groonga.org/debian/ jessie main\n\
deb-src https://packages.groonga.org/debian/ jessie main\n\
' > /etc/apt/sources.list.d/groonga.list

RUN apt-get update \
    && apt-get install -y --allow-unauthenticated groonga-keyring \
    && apt-get update \
    && apt-get install -y -V groonga

ENTRYPOINT ["groonga"]
