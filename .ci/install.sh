#!/usr/bin/env bash

set -e
set -o pipefail

if [[ -n "${CI_TARGET}" ]]; then
  exit
fi

if [[ "${TRAVIS_OS_NAME}" == osx ]]; then
  brew install gettext
elif [[ "${BUILD_MINGW}" == ON ]]; then
  # TODO: When Travis gets a recent version of Mingw-w64 use packages:
  # binutils-mingw-w64-i686 gcc-mingw-w64-i686 g++-mingw-w64-i686 mingw-w64-dev mingw-w64-tools

  echo "Downloading MinGW..."
  wget -q -O - "http://downloads.sourceforge.net/project/mingw-w64/Toolchains%20targetting%20Win32/Personal%20Builds/rubenvb/gcc-4.8-release/i686-w64-mingw32-gcc-4.8.0-linux64_rubenvb.tar.xz" | tar xJf - -C "${HOME}/.local"
fi

compgen -c | grep pip
compgen -c | grep python
python3.4 --version
#curl -O https://bootstrap.pypa.io/get-pip.py
#ls
#python3 get-pip.py --user
pip --version
pip install --user --upgrade cpp-coveralls neovim
pip3 --version
pip3 install --user --upgrade neovim

