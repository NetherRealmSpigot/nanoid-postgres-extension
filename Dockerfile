ARG BASE_IMAGE=postgres:16.9-alpine3.22
FROM $BASE_IMAGE

COPY . /tmp/ext

RUN <<EOS
apk --no-cache add build-base postgresql16-dev clang16 llvm16 ca-certificates openssl tar bash git
cd /tmp/ext
chmod +x ./install.sh
bash ./install.sh
apk del build-base postgresql16-dev clang16 llvm16 ca-certificates openssl tar bash git
apk del .fetch-deps .build-deps
rm -rf /tmp/ext
EOS
