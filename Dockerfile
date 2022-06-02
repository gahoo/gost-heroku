FROM alpine:3.6

ENV VER=2.11.2 USER=gost PASSWORD=gost
ENV TLS_PORT=433

RUN apk add --no-cache curl \
  && curl -sL https://github.com/ginuerzh/gost/releases/download/v2.11.2/gost-linux-amd64-${VER}.gz \
  gunzip gost-linux-amd64-${VER}.gz && mv gost-linux-amd64-${VER} gost && chmod a+x gost

WORKDIR /gost
EXPOSE ${TLS_PORT} $PORT

CMD exec /gost/gost -L=https+mwss://$USER:$PASSWORD@:$TLS_PORT

