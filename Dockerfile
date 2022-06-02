FROM alpine:3.16

ENV VER=2.11.2
ENV GOST_ARGS=https+wss://gost:42bio@:443?probe_resist=code:400&knock=42bio.com
ENV TLS_PORT=443 PORT=80

RUN apk add --no-cache wget \
  && wget https://github.com/ginuerzh/gost/releases/download/v2.11.2/gost-linux-amd64-${VER}.gz \
  && gunzip gost-linux-amd64-${VER}.gz && mv gost-linux-amd64-${VER} gost && chmod a+x gost

EXPOSE ${TLS_PORT} ${PORT}

CMD exec /gost -L ${GOST_ARGS}

