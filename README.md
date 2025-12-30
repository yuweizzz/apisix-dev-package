# apisix-dev-package

APISIX development environment package, used for testing plugins.

## docker

```bash
docker pull ghcr.io/yuweizzz/apisix-dev-package:latest
docker run -d ghcr.io/yuweizzz/apisix-dev-package:latest | xargs -I {} docker exec {} bin/apisix start
```
