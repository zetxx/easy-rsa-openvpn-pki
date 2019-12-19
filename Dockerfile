FROM alpine:latest

LABEL maintainer="Elin Angelov <zetxx@belogradchik.biz>"

RUN apk add --update openvpn bash easy-rsa

ENV OPENVPN /etc/openvpn
ENV EASYRSA /usr/share/easy-rsa
ENV EASYRSA_PKI $OPENVPN/pki
ENV EASYRSA_VARS_FILE $OPENVPN/vars

CMD ["easyrsa"]
