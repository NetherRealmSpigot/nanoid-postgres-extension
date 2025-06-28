ARG BASE_IMAGE=postgres:16.9-alpine3.22
FROM $BASE_IMAGE

COPY . /tmp/ext
RUN apk --no-cache add bash ca-certificates
RUN bash <<EOS
set -ex

apk --no-cache add build-base postgresql16-dev clang16 llvm16 openssl tar git
cd /tmp/ext
chmod +x ./install.sh
bash ./install.sh
apk del build-base postgresql16-dev clang16 llvm16 openssl tar git
rm -rf /tmp/ext

EOS
