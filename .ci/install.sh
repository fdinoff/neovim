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

compgen -c
printf "%s\n" "ls -la /home/travis/.local/bin/"
ls -la /home/travis/.local/bin/
#printf "%s\n" "ls -la /usr/local/lib/python3.3/dist-packages/"
#ls -la /usr/local/lib/python2.7/dist-packages/
curl -O https://raw.github.com/pypa/pip/master/contrib/get-pip.py
python3 get-pip.py
pip --version
pip install --user --upgrade cpp-coveralls neovim
pip3.3 --version
pip-3.3 install --user --upgrade neovim

