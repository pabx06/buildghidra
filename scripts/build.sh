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
wget 'https://raw.githubusercontent.com/bdarmofal/proc_manual/master/ghidra_manuals/Armv7AR_errata.pdf' -O ./Ghidra/Processors/ARM/data/manuals/Armv7AR_errata.pdf
#todo take a look at https://github.com/rickhohler/ghidra_2020/blob/bfd123123eb886b65220571f5cbf60c64784d8d5/scripts/ghidra_processor_docs_downloader.py

#grep -r 'import db.\*;' *|awk -F':' '{print "sed -i " " \"s|import db.*;|import db.*;import db.Record;|g\" "$1}'|bash

gradle -q --init-script gradle/support/fetchDependencies.gradle init >/dev/null
cp -r ../ghidra-data/FunctionID/* Ghidra/Features/FunctionID/data
gradle -q buildNatives_linux64
gradle prepDev
gradle buildHelp
gradle eclipse -PeclipsePDE
gradle -q -x ip buildGhidra
