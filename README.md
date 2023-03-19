# Podman API
This implementation uses the [API version 4](https://docs.podman.io/en/latest/_static/api.html)
## Up service
### Unix socket service:
```sh
podman --log-level=debug system service -t 0
```
### TCP service:
```sh
podman --log-level=debug system service -t 0 tcp:0.0.0.0:2376
```
