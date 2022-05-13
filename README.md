# qmk_container [![Docker Image CI](https://github.com/jsanchez0x/qmk_container/actions/workflows/docker-image.yml/badge.svg)](https://github.com/jsanchez0x/qmk_container/actions/workflows/docker-image.yml) [![Generic badge](https://img.shields.io/badge/Docker-Hub-blue.svg?logo=docker&logoColor=white)](https://hub.docker.com/r/jsanchez0x/qmk_container)


Dockerfile to generate a container with everything needed to use QMK(*Quantum Mechanical Keyboard*).  
The size of the extracted image is approximately 4.6GB.

## Geting the image

### OPTION 1: Pulling from Docker Hub (*recommended*)
```bash
docker pull jsanchez0x/qmk_container
```

### OPTION 2: Building the image manually
```bash
git clone https://github.com/jsanchez0x/qmk_container.git
docker build --rm --tag qmk_container:1.0 qmk_container
```


## Instructions

### 1.- Preparing the environment
It is necessary to create some working directories. For example:
```bash
mkdir -p $HOME/qmk/firmwares $HOME/qmk/keyboards
```

### 2.- Clone QMK firmware repository
You need to have the source code files. You can get them from the [official QMK repository](https://github.com/qmk/qmk_firmware) (keyboards directory) and copy it into the *$HOME/qmk/keyboards* directory.

For example:
```bash
git clone https://github.com/qmk/qmk_firmware.git
cp -r qmk_firmware/keyboards/ymdk/wings $HOME/qmk/keyboards/
```

### 3.- Compiling the firmware
Run the *qmk_compile* command for execute the compilation in the container. It is recommended to share a directory in order to have the project on the host machine and the compiled firmware is also generated on the host machine.

Following the previous example:
```bash
docker run --rm -it \
        --name qmk_container \
        -v $HOME/qmk/keyboards/:/qmk_firmware/keyboards/ \
        -v $HOME/qmk/firmwares/:/qmk_firmware/.build/ \
        qmk_container:1.0 qmk_compile
```

The keyboard and keymap will be requested. For example:
> *Keyboard (i.e. kbdfans/kbd67/mkiirgb/v2):*  
> **ymdk/wings**  
> *Keymap (i.e. via):*  
>**default**
>
>*Executing compilation...*


## More info
More information on how to use this image can be found in the official [QMK documentation](https://docs.qmk.fm/#/).


## Credits
Official [QMK base container](https://github.com/qmk/qmk_base_container)
