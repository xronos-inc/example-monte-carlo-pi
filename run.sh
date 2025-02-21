#!/bin/bash

# SPDX-FileCopyrightText: (c) 2024 Xronos Inc.
# SPDX-License-Identifier: BSD-3-Clause
# 
# SPDX-FileCopyrightText: (c) 2023 Jeff C. Jensen 
# SPDX-License-Identifier: MIT
# 
# This file contains portions from Jeff C. Jensen under MIT
# and modifications by Xronos Inc. under BSD-3-Clause.

set -e

# install and activate python virtual environment
if [ ! -f .venv/bin/activate ]; then
    echo creating python virtual environment
    python3.10 -m venv .venv
    source .venv/bin/activate
    echo installing python requirements
    pip3 install -r requirements.txt
else
    source .venv/bin/activate
fi

# compile application
echo lfc compile
lfc src/app.lf

echo running application
source env.sh
source bin/app
