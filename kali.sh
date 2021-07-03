#!/bin/bash

TMPDIR="${TMPDIR-/tmp}"
cd "$TMPDIR"
git clone https://github.com/SecureAuthCorp/impacket.git
cd impacket
git checkout impacket_0_9_23
python3 -m pip install .
cd -
rm -rf ./impacket

