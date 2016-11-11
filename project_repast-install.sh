#!/usr/bin/env bash

if [ $# != 3 ]; then
  echo usage $0 install_dir build_dir '[ON|OFF]'
  exit
fi

INSTALL_DIR=$(readlink -f "${1}")
SOURCE_DIR=$(readlink -f "${2}")


[ -e "${INSTALL_DIR}/lib" ] || mkdir -p "${INSTALL_DIR}/lib"
[ -e "${INSTALL_DIR}/include" ] || mkdir -p "${INSTALL_DIR}/include"

if [ $3 = ON ]; then
# Install MPI
  cd "${SOURCE_DIR}/project_repast/ext/MPICH/lib";
  find . -type f -iname "*.a" -exec cp --parents {} "${INSTALL_DIR}/lib" \;

  cd "${SOURCE_DIR}/project_repast/ext/MPICH/include";
  find . -type f -iname "*.h" -exec cp --parents {} "${INSTALL_DIR}/include" \;
fi

# Install boost 
cd "${SOURCE_DIR}/project_repast/ext/Boost/Boost_1.54/lib";
find . -type f -iname "*.a" -exec cp --parents {} "${INSTALL_DIR}/lib" \;

cd "${SOURCE_DIR}/project_repast/ext/Boost/Boost_1.54/include";
find . -type f -iname "*.hpp" -exec cp --parents {} "${INSTALL_DIR}/include" \;

# Install repast
cd "${SOURCE_DIR}/project_repast/lib";
find . -type f -iname "*.a" -exec cp --parents {} "${INSTALL_DIR}/lib" \;

cd "${SOURCE_DIR}/project_repast/include";
find . -type f -iname "*.h" -exec cp --parents {} "${INSTALL_DIR}/include" \;
