FROM alpine:3.14.2

RUN apk --no-cache add nginx openvpn runit

COPY app /app

ENV OPENVPN_CONFIG_FILE=/config/config.ovpn
ENV OPENVPN_USERNAME=
ENV OPENVPN_PASSWORD=
ENV PROXY_HOST=

CMD ["runsvdir", "/app"]
