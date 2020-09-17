#!/bin/bash
export PATH="${PWD}/downloads/amazon-corretto-11.0.8.10.1-linux-x64/bin/:$PATH"
git clone https://github.com/NationalSecurityAgency/ghidra.git
cd ghidra

#patching colors
patch ./Ghidra/Framework/Docking/src/main/java/docking/widgets/AbstractGCellRenderer.java  ../patch/AbstractGCellRenderer.patch
patch ./Ghidra/Framework/Docking/src/main/java/docking/widgets/filter/FilterTextField.java  ../patch/FilterTextField.patch
patch ./Ghidra/Framework/Docking/src/main/java/docking/widgets/table/GTableHeaderRenderer.java ../patch/GTableHeaderRenderer.patch
patch ./Ghidra/Framework/Docking/src/main/java/ghidra/docking/util/DockingWindowsLookAndFeelUtils.java ../patch/DockingWindowsLookAndFeelUtils.patch
#patch launch.sh
patch ./Ghidra/RuntimeScripts/Common/support/launch.properties  ../patch/launch.properties.patch
patch ./Ghidra/RuntimeScripts/Linux/support/launch.sh ../patch/launch.sh.patch

#flatlaf
patch ./Ghidra/Framework/Docking/build.gradle ../patch/build.gradle.patch
patch ./gradle/support/fetchDependencies.gradle ../patch/fetchDependencies.gradle.patch

gradle -q --init-script gradle/support/fetchDependencies.gradle init >/dev/null
gradle -q buildGhidra
