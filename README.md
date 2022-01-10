# OpenWRT SDK Container

This project allows the execution of multiple containers running different versions of the OpenWRT SDK.

The project aims to create a basic Linux docker container that provides the system dependencies for the SDK. 
The different SDK versions are installed in a base folder mounted at the container runtime. 


## Running Instructions

The container can download and install the SDK if it's not already installed. 

To enable this feature, first create a base directory (default: ./data) where the SDKs will be installed:
```bash
mkdir ./data
```

Then provide the configuration environment variables:

| Variable | Description |
| -------- | ----------- |
| SDK_URL  | URL link to the SDK |
| SDK_IDENTIFIER | string used to identify the subdirectory that will be created to hold the SDK installation. Do not use spaces or special characters |
| SDK_SHA256SUM | (optional) If present, the SHA256SUM of the download will be verified |
| COMPOSE_PROJECT_NAME | optional) Only when using docker-compose and when the running container identification is desired |

Example of environment file for the router TP-LINK Archer C7 V5 with OpenWRT SDK version 19.07.5:
> SDK_IDENTIFIER="19.07.5-ath79-generic"
> COMPOSE_PROJECT_NAME="openwrt-19.07.5-ath79-generic"
> SDK_SHA256SUM="3c78ba2b0d0179c14075f6f07b073004b18cf818ae420b4a584fbd5a13ea5c23"
>SDK_URL="`https://downloads.openwrt.org/releases/19.07.5/targets/ath79/generic/openwrt-sdk-19.07.5-ath79-generic_gcc-7.5.0_musl.Linux-x86_64.tar.xz`"

To use with the docker-compose just create a *.env* file with the above content in the project's root directory.