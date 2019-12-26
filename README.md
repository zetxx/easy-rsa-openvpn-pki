# [easy-rsa-openvpn-pki](https://wiki.archlinux.org/index.php/Easy-RSA)

## Build

```bash
docker rmi -f pki && docker build -t pki .
```

## look around

```bash
docker run --rm -it pki bash
```

## Init ca

```bash
docker run --rm -it -v ${PWD}/ca:/etc/openvpn/keys pki
```

## Init server

```bash
docker run --rm -it -v ${PWD}/server:/etc/openvpn/keys pki ./init.server test-srv1
```

## Init client

```bash
docker run --rm -it -v ${PWD}/client:/etc/openvpn/keys pki ./init.client abc
```

## ca, server and client, then sign

```bash
rm -rf ./ca && rm -rf ./server && rm -rf ./client && \
mkdir ./ca && mkdir ./server && mkdir ./client && \
docker run --rm -it -v ${PWD}/ca:/etc/openvpn/keys pki && \
docker run --rm -it -v ${PWD}/server:/etc/openvpn/keys pki ./init.server test-srv1 && \
docker run --rm -it -v ${PWD}/client:/etc/openvpn/keys pki ./init.client abc && \
cp ./client/reqs/* ./ca/reqs/ && cp ./server/reqs/* ./ca/reqs/ && \
docker run --rm -it -v ${PWD}/ca:/etc/openvpn/keys -e PKI_DIRNAME=keys pki ./sign.server test-srv1 && \
docker run --rm -it -v ${PWD}/ca:/etc/openvpn/keys -e PKI_DIRNAME=keys pki ./sign.client abc
```
