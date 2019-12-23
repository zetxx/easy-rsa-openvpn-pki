# easy-rsa-openvpn-pki

## Build

docker rmi -f pki && docker build -t pki .

## look arownd

docker run --rm -it pki bash

## Init ca

docker run --rm -it -v ${PWD}/ca:/etc/openvpn/keys pki

## Init server

docker run --rm -it -v ${PWD}/server:/etc/openvpn/keys pki ./init.server test-srv1

## Init client

docker run --rm -it -v ${PWD}/client:/etc/openvpn/keys pki ./init.client abc

## ca, server and client

rm -rf ./ca && rm -rf ./server && rm -rf ./client && \
mkdir ./ca && mkdir ./server && mkdir ./client && \
docker run --rm -it -v ${PWD}/ca:/etc/openvpn/keys pki && \
docker run --rm -it -v ${PWD}/server:/etc/openvpn/keys pki ./init.server test-srv1 && \
docker run --rm -it -v ${PWD}/client:/etc/openvpn/keys pki ./init.client abc && \
cp ./client/reqs/* ./ca/reqs/ && cp ./server/reqs/* ./ca/reqs/