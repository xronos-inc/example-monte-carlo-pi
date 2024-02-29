#!/bin/bash

set -e

# install and activate python virtual environment
if [ ! -f .venv/bin/activate ]; then
    if ! which python3.10; then
        echo "Error: python3.10 required"
        exit 1
    fi
    echo creating python virtual environment
    python3.10 -m venv .venv
    source .venv/bin/activate
    echo installing python requirements
    pip install -r requirements.txt
else
    source .venv/bin/activate
fi

# compile application
echo lfc compile
lfc src/app.lf

# symmlink website into the application folder
ln -sf ${PWD}/site/static src-gen/app
ln -sf ${PWD}/site/templates src-gen/app

echo running application
source bin/app