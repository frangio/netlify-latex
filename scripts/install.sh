#!/usr/bin/env bash

set -o errexit

rm -rf install-tl-20190227

tar xf install-tl-unx.tar.gz

echo_texvars() {
  echo TEXDIR $PWD/texlive/2018
  echo TEXMFLOCAL $PWD/texlive/texmf-local
  echo TEXMFSYSCONFIG $PWD/texlive/2018/texmf-config
  echo TEXMFSYSVAR $PWD/texlive/2018/texmf-var
}

install-tl-20190227/install-tl --profile=<(cat texlive.profile <(echo_texvars))
