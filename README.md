# easy-rsa-openvpn-pki

## Build

docker rmi pki && docker build -t pki .

## look arownd

docker run --rm -it pki bash

## Init ca

docker run --rm -it \
-v ${PWD}:/etc/openvpn/pki \
pki

## Init server

## Init client
