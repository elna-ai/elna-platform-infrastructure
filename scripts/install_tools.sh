#!/bin/bash

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs >rust_installer.sh
chmod +x rust_installer.sh
./rust_installer.sh -y
rm -rf rust_installer.sh

rustup target add wasm32-unknown-unknown
