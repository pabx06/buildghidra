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
patch ./Ghidra/Features/Base/src/main/java/ghidra/app/plugin/core/function/editor/FunctionEditorDialog.java ../patch/FunctionEditorDialog.java.bis

patch ./Ghidra/Framework/Project/src/main/java/ghidra/framework/main/SaveDataDialog.java ../patch/SaveDataDialog.patch
patch ./Ghidra/Features/Base/src/main/java/ghidra/app/plugin/core/hover/AbstractReferenceHover.java  ../patch/AbstractReferenceHover.patch
patch ./Ghidra/Features/Base/src/main/java/ghidra/app/plugin/core/totd/TipOfTheDayDialog.java  ../patch/TipOfTheDayDialog.patch
patch ./Ghidra/Features/Base/src/main/java/ghidra/framework/main/InfoPanel.java  ../patch/InfoPanel.patch
patch ./Ghidra/Features/ByteViewer/src/main/java/ghidra/app/plugin/core/byteviewer/ByteViewerPanel.java  ../patch/ByteViewerPanel.patch
patch ./Ghidra/Features/ByteViewer/src/main/java/ghidra/app/plugin/core/byteviewer/ByteViewerComponent.java  ../patch/ByteViewerComponent.patch

patch ./Ghidra/Features/Base/src/main/java/ghidra/app/plugin/core/interpreter/InterpreterPanel.java ../patch/InterpreterPanel.patch
patch ./Ghidra/Features/Base/src/main/java/ghidra/app/plugin/core/function/editor/FunctionSignatureTextField.java  ../patch/FunctionSignatureTextField.patch

patch ./Ghidra/Framework/Docking/src/main/java/docking/widgets/DropDownTextField.java  ../patch/DropDownTextField.patch
patch ./Ghidra/Features/Base/src/main/java/ghidra/framework/main/ConsoleTextPane.java  ../patch/ConsoleTextPane.patch

#patch launch.sh
patch ./Ghidra/RuntimeScripts/Common/support/launch.properties  ../patch/launch.properties.patch
patch ./Ghidra/RuntimeScripts/Linux/support/launch.sh ../patch/launch.sh.patch

#flatlaf
patch ./Ghidra/Framework/Docking/build.gradle ../patch/build.gradle.patch
patch ./gradle/support/fetchDependencies.gradle ../patch/fetchDependencies.gradle.patch
patch ./Ghidra/Framework/Docking/Module.manifest ../patch/Docking.Module.manifest

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
