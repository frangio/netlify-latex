#!/usr/bin/env bash

INPUT=main.tex

set -o errexit

scripts/install.sh

# We use $DEPLOY_URL to detect the Netlify environment.
if [ -v DEPLOY_URL ]; then
  : ${NETLIFY_BUILD_BASE="/opt/buildhome"}
else
  : ${NETLIFY_BUILD_BASE="$PWD/buildhome"}
fi

TEXLIVE="$NETLIFY_BUILD_BASE/cache/texlive/2018"

TEXLIVE_BIN="$TEXLIVE/bin/x86_64-linux"

TEXLIVEONFLY="$TEXLIVE/texmf-dist/scripts/texliveonfly/texliveonfly.py"

export PATH="$TEXLIVE_BIN:$PATH"

python "$TEXLIVEONFLY" -c latexmk -a "-g -pdf -synctex=1 -interaction=nonstopmode" "$INPUT"

mkdir -p dist

cp *.pdf dist
