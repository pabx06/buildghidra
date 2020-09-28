#!/bin/bash
export PATH="${PWD}/downloads/amazon-corretto-11.0.8.10.1-linux-x64/bin/:$PATH"
export JAVA_HOME="${PWD}/downloads/amazon-corretto-11.0.8.10.1-linux-x64"
git clone https://github.com/NationalSecurityAgency/ghidra.git
git clone https://github.com/NationalSecurityAgency/ghidra-data
cd ghidra
git log|head -n1

#patching colors

patch ./Ghidra/Framework/Docking/src/main/java/docking/widgets/AbstractGCellRenderer.java  ../patch/AbstractGCellRenderer.patch
patch ./Ghidra/Framework/Docking/src/main/java/docking/widgets/filter/FilterTextField.java  ../patch/FilterTextField.patch
patch ./Ghidra/Framework/Docking/src/main/java/docking/widgets/table/GTableHeaderRenderer.java ../patch/GTableHeaderRenderer.patch
patch ./Ghidra/Framework/Docking/src/main/java/ghidra/docking/util/DockingWindowsLookAndFeelUtils.java ../patch/DockingWindowsLookAndFeelUtils.patch
patch ./Ghidra/Features/Base/src/main/java/ghidra/app/plugin/core/function/editor/FunctionEditorDialog.java ../patch/FunctionEditorDialog.java
#patch launch.sh
patch ./Ghidra/RuntimeScripts/Common/support/launch.properties  ../patch/launch.properties.patch
patch ./Ghidra/RuntimeScripts/Linux/support/launch.sh ../patch/launch.sh.patch

#flatlaf
patch ./Ghidra/Framework/Docking/build.gradle ../patch/build.gradle.patch
patch ./gradle/support/fetchDependencies.gradle ../patch/fetchDependencies.gradle.patch
patch ./Ghidra/Framework/Docking/Module.manifest ../patch/Docking.Module.manifest

#grep -r 'import db.\*;' *|awk -F':' '{print "sed -i " " \"s|import db.*;|import db.*;import db.Record;|g\" "$1}'|bash

gradle -q --init-script gradle/support/fetchDependencies.gradle init >/dev/null
cp -r ../ghidra-data/FunctionID/* Ghidra/Features/FunctionID/data
gradle -q buildNatives_linux64
gradle prepDev
gradle buildHelp
gradle eclipse -PeclipsePDE
gradle -q -x ip buildGhidra
