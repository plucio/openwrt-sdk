#!/bin/bash
set -e

function download_and_unpack {
  local download_filepath="/tmp/sdk.tar.xz"
  echo "starting download of sdk: ${OPENWRT_SDK_URL}"
  wget -q -c "${OPENWRT_SDK_URL}" -O $download_filepath

  echo "creating sdk directory: ${OPENWRT_SDK_DIR}"
  mkdir ${OPENWRT_SDK_DIR}

  echo "unpacking sdk"
  tar -C ${OPENWRT_SDK_DIR} -xJf $download_filepath

  if [ ! -z ${OPENWRT_SDK_SHA256SUM} ]
  then
    echo "Verifying checksum"
    echo "${OPENWRT_SDK_SHA256SUM} $download_filepath" |sha256sum -c
  fi

  echo "Removing temporary file"
  rm -f $download_filepath
}

# Download and unpack SDK only if the directory ${OPENWRT_SDK_DIR} does not exists
if [ ! -z ${OPENWRT_SDK_URL} ] && [ ! -z ${OPENWRT_SDK_IDENTIFIER} ] && [ ! -d ${OPENWRT_SDK_DIR}  ]
then
  download_and_unpack
else
  echo "NOT downloading SDK - Already exists on disk or invalid environment variables: OPENWRT_SDK_URL and OPENWRT_SDK_IDENTIFIER"
fi

exec "$@"