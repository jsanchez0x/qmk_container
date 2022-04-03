# qmk_container [![Docker Image CI](https://github.com/jsanchez0x/qmk_container/actions/workflows/docker-image.yml/badge.svg)](https://github.com/jsanchez0x/qmk_container/actions/workflows/docker-image.yml) [![Generic badge](https://img.shields.io/badge/Docker-Hub-blue.svg)](https://hub.docker.com/r/jsanchez0x/qmk_container)


Dockerfile to generate a container with everything needed to use QMK. The image size is 4.97GB.

## Get the image
### OPTION 1: Building the image manually
Use this on non-amd64 operating systems.
```bash
git clone https://github.com/jsanchez0x/qmk_container.git
docker build --rm --tag qmk_container:1.0 qmk_container
```

### OPTION 2: Pulling from Docker Hub
```bash
docker pull jsanchez0x/qmk_container
```

## Runing the container with shared folder
```bash
docker run --rm -it -v $(pwd):/shared_folder qmk_container:1.0
```

## First steps inside the container
```bash
qmk setup
```

## Credits
Official [QMK base container](https://github.com/qmk/qmk_base_container)
