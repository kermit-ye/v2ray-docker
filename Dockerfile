FROM alpine:latest

ENV V2RAY_VERSION v4.19.1
ENV PATH ${PATH}:/v2ray/

RUN apk add bash wget
RUN mkdir -p /v2ray/
RUN wget -O /v2ray/v2ray-linux-64.zip https://github.com/v2ray/v2ray-core/releases/download/${V2RAY_VERSION}/v2ray-linux-64.zip
RUN unzip /v2ray/v2ray-linux-64.zip -d /v2ray/
RUN rm -f /v2ray/config.json
RUN rm -f /v2ray/v2ray-linux-64.zip

ADD config-temp.json /v2ray/config-temp.json
ADD startup.sh /startup.sh

RUN chmod +x /startup.sh

EXPOSE 8001 8002

ENTRYPOINT ["/startup.sh"]
