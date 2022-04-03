# qmk_container
[![Docker Image CI](https://github.com/jsanchez0x/qmk_container/actions/workflows/docker-image.yml/badge.svg)](https://github.com/jsanchez0x/qmk_container/actions/workflows/docker-image.yml)

Dockerfile to generate a container with everything needed to use QMK.

## Building the image
```bash
docker build --rm --tag qmk_container:1.0 .
```

## Runing the container with shared folder
```bash
docker run --rm -it -v $(pwd):/shared_folder qmk_container:1.0
```

### First steps inside the container
```bash
qmk setup
```

## Credits
Official [QMK base container](https://github.com/qmk/qmk_base_container)
