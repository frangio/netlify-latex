#!/usr/bin/env sh

set -o errexit

scripts/install.sh

buildhome/cache/texlive/2018/bin/x86_64-linux/pdflatex journal.tex

mkdir dist

cp journal.pdf dist
