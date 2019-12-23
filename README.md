# easy-rsa-openvpn-pki

## Build

docker rmi -f pki && docker build -t pki .

## look arownd

docker run --rm -it pki bash

## Init ca

docker run --rm -it -v ${PWD}/ca:/etc/openvpn/keys pki

## Init server

docker run --rm -it -v ${PWD}/server:/etc/openvpn/keys pki ./init.server

## Init client

docker run --rm -it -v ${PWD}/client:/etc/openvpn/keys pki ./init.client abc