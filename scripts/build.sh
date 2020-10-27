#!/bin/bash
export PATH="${PWD}/downloads/amazon-corretto-11.0.8.10.1-linux-x64/bin/:$PATH"
export JAVA_HOME="${PWD}/downloads/amazon-corretto-11.0.8.10.1-linux-x64"
git clone https://github.com/NationalSecurityAgency/ghidra.git
git clone https://github.com/NationalSecurityAgency/ghidra-data
pushd ghidra
git log|head -n1

#patching colors
echo "[+] Patching Colors Constants"
. ../scripts/patchColors.sh

#patch launch.sh
echo "[+] Patching Launch script"
. ../scripts/patchLaunch.sh

#flatlaf
echo "[+] Patching gradle script for FlatLaf"
. ../scripts/patchFlatLaf.sh

#Processors Manuals
echo "[+] Downloading ARM processor Manual"
wget -q 'https://raw.githubusercontent.com/bdarmofal/proc_manual/master/ghidra_manuals/Armv7AR_errata.pdf' -O ./Ghidra/Processors/ARM/data/manuals/Armv7AR_errata.pdf
wget -q 'https://docs.oracle.com/javase/specs/jvms/se8/jvms8.pdf' -O ./Ghidra/Processors/JVM/data/manuals/jvms8.pdf
#todo take a look at https://github.com/rickhohler/ghidra_2020/blob/bfd123123eb886b65220571f5cbf60c64784d8d5/scripts/ghidra_processor_docs_downloader.py



echo "[+] Downloading Build Dependencies"
gradle -q --init-script gradle/support/fetchDependencies.gradle init >/dev/null

echo "[+] Copying Function ID Databases"
cp -r ../ghidra-data/FunctionID/* Ghidra/Features/FunctionID/data

echo "[+] Building Linux Natives"
gradle -q buildNatives_linux64

echo "[+] prepDev"
gradle prepDev

echo "[+] buildHelp"
gradle buildHelp

echo "[+] PeclipsePDE"
gradle eclipse -PeclipsePDE

echo "[+] buildGhidra"
gradle -q -x ip buildGhidra
