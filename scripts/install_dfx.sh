#!/bin/bash

export DFXVM_INIT_YES=true
curl -fsSL https://smartcontracts.org/install.sh >install.sh
chmod +x install.sh
./install.sh
rm -rf install.sh
