#!/bin/bash

# SPDX-FileCopyrightText: © 2024 Xronos Inc.
# SPDX-License-Identifier: BSD-3-Clause

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

echo running application
source env.sh
source bin/app
