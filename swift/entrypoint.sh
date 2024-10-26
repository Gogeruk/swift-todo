#!/bin/bash

### build the Swift app in release mode
swift build -c release

### check if the build succeeded
if [ $? -ne 0 ]; then
    echo "Build failed. Exiting. LOL!"
    exit 1
fi

### run the Swift application
./.build/release/MySwiftApp

### keep the container running after completion
tail -f /dev/null
