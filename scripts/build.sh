#!/usr/bin/env bash

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

python "$TEXLIVEONFLY" -c latexmk -a -pdf journal.tex

mkdir -p dist

cp *.pdf dist
