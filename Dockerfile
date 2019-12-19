FROM alpine:latest

LABEL maintainer="Elin Angelov <zetxx@belogradchik.biz>"

RUN apk add --update openvpn bash easy-rsa && \
    rm -f /var/cache/apk/*

ENV OPENVPN /etc/openvpn
ENV EASYRSA /usr/share/easy-rsa
ENV EASYRSA_PKI $OPENVPN/pki
ENV EASYRSA_VARS_FILE $OPENVPN/vars
ENV PATH $PATH:$EASYRSA

CMD ["easyrsa"]
