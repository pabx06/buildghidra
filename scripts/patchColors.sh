#!/bin/bash
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
patch ./Ghidra/Framework/Docking/src/main/java/docking/widgets/filechooser/GhidraFileChooser.java ../patch/GhidraFileChooser.patch
patch ./Ghidra/Features/FunctionID/src/main/java/ghidra/feature/fid/plugin/ActiveFidConfigureDialog.java  ../patch/ActiveFidConfigureDialog.patch
