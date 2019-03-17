#!/usr/bin/env bash

set -o errexit

# We use $DEPLOY_URL to detect the Netlify environment.
if [ -v DEPLOY_URL ]; then
  : ${NETLIFY_BUILD_BASE="/opt/buildhome"}
else
  : ${NETLIFY_BUILD_BASE="$PWD/buildhome"}
fi

NETLIFY_CACHE_DIR="$NETLIFY_BUILD_BASE/cache"

INSTALL_DIR="$NETLIFY_CACHE_DIR/texlive"

echo_texvars() {
  echo TEXDIR $INSTALL_DIR/2018
  echo TEXMFLOCAL $INSTALL_DIR/texmf-local
  echo TEXMFSYSCONFIG $INSTALL_DIR/2018/texmf-config
  echo TEXMFSYSVAR $INSTALL_DIR/2018/texmf-var
}

install_texlive() {
  if [ ! -d "$INSTALL_DIR" ]; then
    tar xf install-tl-unx.tar.gz
    install-tl-20190227/install-tl --profile=<(cat texlive.profile <(echo_texvars))
  fi
}

if ! install_texlive; then
  rm -rf "$INSTALL_DIR"
  exit 1
fi
