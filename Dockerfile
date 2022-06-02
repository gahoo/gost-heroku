FROM alpine:3.12

ENV VER=2.11.2 USER=gost PASSWORD=gost
ENV TLS_PORT=433

RUN apk add --no-cache wget \
  && wget https://github.com/ginuerzh/gost/releases/download/v2.11.2/gost-linux-amd64-${VER}.gz \
  && gunzip gost-linux-amd64-${VER}.gz && mv gost-linux-amd64-${VER} gost && chmod a+x gost

EXPOSE ${TLS_PORT} $PORT

CMD exec /gost -L=https+mwss://$USER:$PASSWORD@:$TLS_PORT

