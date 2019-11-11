FROM centos:7

LABEL org.label-schema.schema-version="1.0" \
    org.label-schema.name="MFC node" \
    org.label-schema.vendor="Sergio Barvenko" \
    org.label-schema.livence="MIT" \
    org.label-schema.build-data="20191111"

MAINTAINER MFCoin <twitter.com/MFC_tech>

ARG MFC_VERSION=0.7.10
ARG MFC_TAG=v.3.0.0.2

RUN yum install -y --setopt=tsflags=nodocs wget unzip

RUN cd /root \
    && wget https://github.com/MFrcoin/MFCoin/releases/download/${MFC_TAG}/mfcoin-${MFC_VERSION}-linux.zip \
    && mkdir .MFC \
    && unzip mfcoin-${MFC_VERSION}-linux.zip \
    && mv mfcoin-${MFC_VERSION}/* .MFC/ \
    && rm -rf mfcoin-${MFC_VERSION}*

RUN yum remove -y wget unzip git \
    && yum clean all \
    && rm -rf /var/cache/yum

COPY mfcoin.conf /root/.MFC/mfcoin.conf

EXPOSE 22825

RUN cd /root/.MFC/bin/
WORKDIR /root/.MFC/bin
RUN chmod +x /root/.MFC/bin/mfcoind

ENTRYPOINT ["./mfcoind", "-conf=/root/.MFC/mfcoin.conf"]
