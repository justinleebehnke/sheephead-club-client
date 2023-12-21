#!/bin/bash

# Install Flutter
FLUTTER_CHANNEL="stable"
FLUTTER_VERSION="3.16.4"
git clone -b $FLUTTER_CHANNEL https://github.com/flutter/flutter.git
export PATH="$PATH:`pwd`/flutter/bin"

# Check Flutter version
flutter --version

# Run flutter doctor
flutter doctor

# Build the web app
flutter build web
