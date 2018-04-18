#!/bin/bash

# Extract rome binary
tar xzf rome.tgz -C ~

mkdir -p ~/.aws
echo "[default]" > ~/.aws/config
echo "region = us-west-2" >> ~/.aws/config

# download missing frameworks
~/rome download --platform iOS

# list what is missing and update/build if needed
~/rome list --missing --platform ios | awk '{print $1}' | xargs carthage update --platform ios

# upload what is missing
~/rome list --missing --platform ios | awk '{print $1}' | xargs ~/rome upload --platform ios


echo "listing build dir in prebuild"
echo $BUDDYBUILD_PRODUCT_DIR
ls $BUDDYBUILD_PRODUCT_DIR
