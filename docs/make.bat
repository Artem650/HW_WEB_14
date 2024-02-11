#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"

# Command file for Sphinx documentation

if [ -z "$SPHINXBUILD" ]; then
    SPHINXBUILD=sphinx-build
fi

SOURCEDIR=source
BUILDDIR=build

"$SPHINXBUILD" > /dev/null 2>&1
if [ $? -eq 9009 ]; then
    echo -e "\nThe 'sphinx-build' command was not found. Make sure you have Sphinx"
    echo -e "installed, then set the SPHINXBUILD environment variable to point"
    echo -e "to the full path of the 'sphinx-build' executable. Alternatively you"
    echo -e "may add the Sphinx directory to PATH.\n"
    echo -e "If you don't have Sphinx installed, grab it from"
    echo -e "https://www.sphinx-doc.org/\n"
    exit 1
fi

if [ -z "$1" ]; then
    echo "Usage: $0 <target> [options]"
    echo "Available targets:"
    echo "  html       to make standalone HTML files"
    echo "  help       to show this message"
    exit 1
fi

"$SPHINXBUILD" -M "$1" "$SOURCEDIR" "$BUILDDIR" "$SPHINXOPTS" "$O"
