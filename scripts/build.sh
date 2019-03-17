#!/usr/bin/env sh

set -o errexit

scripts/install.sh

texlive/2018/bin/x86_64-linux/pdflatex journal.tex

mkdir dist

cp journal.pdf dist
