#!/usr/bin/env bash
previous=$(aws --version)

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install --update
rm -f ./awscliv2.zip
rm -rf ./aws

echo "Previous version was:"
echo "$previous"
echo "Current version is:"
aws --version
