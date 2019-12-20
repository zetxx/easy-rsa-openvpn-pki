# easy-rsa-openvpn-pki

## look arownd

docker run --rm -it pki bash

## Build

docker rmi pki

docker build -t pki .



### CA

easyrsa init-pki
dd if=/dev/urandom of=pki/.rnd bs=256 count=1
easyrsa build-ca nopass

### SERVER

easyrsa init-pki
dd if=/dev/urandom of=pki/.rnd bs=256 count=1
easyrsa gen-req server123 nopass
openvpn --genkey --secret ta.key

### CLIENT

easyrsa init-pki
dd if=/dev/urandom of=pki/.rnd bs=256 count=1
easyrsa gen-req server123 nopass
openvpn --genkey --secret ta.key