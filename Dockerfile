FROM ubuntu:14.04
MAINTAINER Oleg Serdyukov <oleg@ctrld.me>
LABEL Description="Provides fb2conv utility"

ENV KINDLEGEN http://kindlegen.s3.amazonaws.com/kindlegen_linux_2.6_i386_v2_9.tar.gz
ENV FB2CONV https://www.dropbox.com/s/osb88m4m0t8qf3a/fb2conv-1.5.4.src.zip?dl=1
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y locales

RUN echo 'en_US.UTF-8' > /etc/default/locale && \
    echo 'LANGUAGE=en_US.UTF-8' >> /etc/environment && \
    echo 'LC_ALL=en_US.UTF-8' >> /etc/environment && \
    echo 'LANG=en_US.UTF-8' >> /etc/environment && \
    echo 'LC_TYPE=en_US.UTF-8' >> /etc/environment && \
    locale-gen en_US.UTF-8 && \
    update-locale

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV LC_TYPE en_US.UTF-8

RUN apt-get install -y \
        python2.7 \
        python-lxml \
        python-setuptools && \
    easy_install pip && \
    pip install cssutils lxml

RUN apt-get install -y unzip wget

RUN cd /tmp && \
    wget -q -O /tmp/kindlegen.tar.gz $KINDLEGEN && \
    tar -C /usr/local/bin -xzf kindlegen.tar.gz kindlegen && \
    chmod 755 /usr/local/bin/kindlegen && \
    chown root:root /usr/local/bin/kindlegen && \
    rm -f /tmp/kindlegen.tar.gz

RUN cd /tmp && \
    wget -q -O /tmp/fb2conv.zip "$FB2CONV" && \
    mkdir -p /app && \
    unzip -qqo /tmp/fb2conv.zip -d /app && \
    rm -f /tmp/fb2conv.zip

RUN mkdir -p /root/.fb2conv && \
    cp /app/fb2conv.config /root/.fb2conv/fb2conv.config && \
    cp -r /app/profiles /root/.fb2conv/profiles && \
    rm -Rf /app/fb2conv.config /app/profiles

RUN mkdir -p /data

ADD convert.sh /convert.sh

VOLUME ["/root/.fb2conv", "/data"]

CMD [""]
ENTRYPOINT ["/convert.sh"]
