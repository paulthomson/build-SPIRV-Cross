#!/bin/bash
set -x
set -e
set -u

INSTALL_DIR="${BUILD_PLATFORM}-${CMAKE_BUILD_TYPE}"
BUILD_DIR="${INSTALL_DIR}-build"

mkdir -p "${BUILD_DIR}"
mkdir -p "${INSTALL_DIR}/bin"
mkdir -p "${INSTALL_DIR}/lib"

cd "${BUILD_DIR}"
cp -R ../SPIRV-Cross/. .
make -j2
cd ..

cp "${BUILD_DIR}/spirv-cross" "${INSTALL_DIR}/bin/"
cp "${BUILD_DIR}"/libspirv-cross.* "${INSTALL_DIR}/lib/"
find "${INSTALL_DIR}"

