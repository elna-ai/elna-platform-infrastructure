#!/bin/bash

VERSION_TAG=$(curl https://api.github.com/repos/dfinity/quill/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
curl "https://github.com/dfinity/quill/releases/download/${VERSION_TAG}/quill-linux-x86_64" -o quill
chmod +x quill
mv quill /bin
