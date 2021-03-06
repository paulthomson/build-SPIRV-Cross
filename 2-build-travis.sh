#!/bin/bash
set -x
set -e
set -u

cd SPIRV-Cross

INSTALL_DIR="${BUILD_PLATFORM}-${CMAKE_BUILD_TYPE}"
BUILD_DIR="${INSTALL_DIR}-build"


if [ "$(uname)" == "Linux" ];
then
  sed -i 's/-Wshadow//g' CMakeLists.txt
fi

mkdir -p "${BUILD_DIR}"
cd "${BUILD_DIR}"
cmake -G "${CMAKE_GENERATOR}" .. "-DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}" -DCMAKE_CXX_STANDARD=11 ${CMAKE_OPTIONS}
cmake --build . --config "${CMAKE_BUILD_TYPE}"
cmake "-DCMAKE_INSTALL_PREFIX=../${INSTALL_DIR}" "-DBUILD_TYPE=${CMAKE_BUILD_TYPE}" -P cmake_install.cmake
cd ..
find "${INSTALL_DIR}"

