#!/bin/bash
mkdir -p downloads
cd downloads
#wget https://corretto.aws/downloads/latest/amazon-corretto-11-x64-linux-jdk.tar.gz
wget -q https://corretto.aws/downloads/resources/11.0.8.10.1/amazon-corretto-11.0.8.10.1-linux-x64.tar.gz
tar xzf amazon-corretto-11.0.8.10.1-linux-x64.tar.gz
