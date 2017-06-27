FROM opensuse

WORKDIR ./
EXPOSE 8080

RUN  zypper --ignore-unknown --quiet  --non-interactive --no-gpg-checks update --no-confirm --replacefiles --force-resolution --skip-interactive --auto-agree-with-licenses
RUN  zypper --ignore-unknown --quiet  --non-interactive --no-gpg-checks install --no-confirm --replacefiles --force-resolution python-Twisted python-zope.interface python-six python-solv python-xml python-pyserial python-pycrypto python-pyOpenSSL python-pyasn1 python-ipaddress python-idna python-cryptography python-cffi 

COPY . ./

ENTRYPOINT ["./eth-proxy.py"]
