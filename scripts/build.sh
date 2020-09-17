#!/bin/bash
export PATH="${PWD}/downloads/amazon-corretto-11.0.8.10.1-linux-x64/bin/:$PATH"
git clone https://github.com/NationalSecurityAgency/ghidra.gi
tcd ghidra
gradle -q --init-script gradle/support/fetchDependencies.gradle init >/dev/null
gradle -q buildGhidra
