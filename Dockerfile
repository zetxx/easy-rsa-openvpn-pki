FROM alpine:latest

LABEL maintainer="Elin Angelov <zetxx@belogradchik.biz>"

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
ENV EASYRSA_REQ_CN vpn.belogradchik.biz

COPY ./runable/* /etc/openvpn/

WORKDIR /etc/openvpn/

RUN apk add --update openvpn bash easy-rsa && \
    rm -f /var/cache/apk/* && \
    chmod +x ./init.ca && chmod +x ./init.server && chmod +x ./init.client && \
    mkdir ./pki

VOLUME ["/etc/openvpn/pki"]

CMD ["./init.ca"]
