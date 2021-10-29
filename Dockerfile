FROM alpine:3.14.2

RUN apk --no-cache add \
    # The web server to proxy the requests
    nginx \ 
    # The VPN client
    openvpn \
    # Used for starting all applications in parallel
    runit \ 
    # Required for `envsubst` program
    gettext

COPY app /app

ENV OPENVPN_CONFIG_FILE=/config/config.ovpn
ENV OPENVPN_USERNAME=
ENV OPENVPN_PASSWORD=

ENV PROXY_HOST=
ENV PROXY_PASS_ADDRESS=

CMD ["runsvdir", "/app"]
