#!/bin/bash
export PATH="${PWD}/downloads/amazon-corretto-11-x64-linux-jdk/bin:$PATH"
git clone git@github.com:NationalSecurityAgency/ghidra.git
cd ghidra
gradle --init-script gradle/support/fetchDependencies.gradle init 
gradle buildGhidra