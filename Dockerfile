FROM alpine:latest

LABEL maintainer="Elin Angelov <zetxx@belogradchik.biz>"

RUN apk add --update openvpn bash easy-rsa && \
    rm -f /var/cache/apk/*

ENV OPENVPN /etc/openvpn
ENV EASYRSA /usr/share/easy-rsa
ENV EASYRSA_PKI $OPENVPN/pki
ENV EASYRSA_VARS_FILE $OPENVPN/vars
ENV PATH $PATH:$EASYRSA
ENV EASYRSA_ALGO ec
ENV EASYRSA_CURVE secp521r1
ENV EASYRSA_DIGEST sha512

ENV EASYRSA_REQ_COUNTRY Bulgaria
ENV EASYRSA_REQ_PROVINCE Sofia
ENV EASYRSA_REQ_CITY Sofia
ENV EASYRSA_REQ_ORG zetxx
ENV EASYRSA_CA_EXPIRE 8000
ENV EASYRSA_CERT_EXPIRE 4000
ENV EASYRSA_CRL_DAYS 4000

COPY ./init.ca /etc/openvpn/
COPY ./init.server /etc/openvpn/
COPY ./init.client /etc/openvpn/

WORKDIR /etc/openvpn/

CMD ["easyrsa"]
