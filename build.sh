#!/usr/bin/env sh

set -o errexit

./latexdockercmd.sh latexmk -pdf journal.tex

mkdir -p dist
cp journal.pdf dist
