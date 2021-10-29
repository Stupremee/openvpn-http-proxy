# OpenVPN Http Proxy

A docker image which will start a HTTP Web Server and then forwards all incoming requests
on a specific host to a machine in your OpenVPN network.

## Why?

Imagine you have the url `foobar.com` which you want to access. However, the web server for the URL
runs on a private server inside your OpenVPN network. To solve this you can add a `/etc/hosts` entry that
redirects `foobar.com` to your private server. But that requires every machine you want to access the URL from
to be part of your OpenVPN network. This image solves this problem, by providing a single machine which
is in your VPN and you can make the requests to this container which will redirect it to the private machine.

## Usage

For a working example have a look at the `docker-compose.yaml` which provides a running environment that will
redirect `foobar.com` to whatever address you specify in your `.env` file using the `PROXY_PASS_ADDRESS` variable.

### Mounts

The only required file to mount is the OpenVPN configuration, whose default location is `/config/config.ovpn` inside the
container.

### Environment Variables

| Variable | Required | Example | Description |
|----------|----------|---------|-------------|
| `OPENVPN_CONFIG_FILE` | no | The path to the OpenVPN configuration file (default is `/config/config.ovpn). |
| `OPENVPN_USERNAME` | no | The username which will be used to authenticate in the OpenVPN network. |
| `OPENVPN_PASSWORD` | no | The password which will be used to authenticate in the OpenVPN network. |
| `PROXY_HOST` | yes | The hostname which will be proxied to the `PROXY_PASS_ADDRESS`. |
| `PROXY_PASS_ADDRESS` | yes | The IP address or hostname which NGINX will proxy the HTTP requests to. |


### Ports

This image only exposes port 80 which is the NGINX web server.
