#!/bin/bash

codesign --verify --sign "Developer ID Application: Sony Semiconductor Solutions Corporation (HZ79995QJL)" --deep --force --verbose --options runtime --entitlements entitlements.plist $1
