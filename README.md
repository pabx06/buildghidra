## ghidra dark look and feel

[![Build Status](https://travis-ci.com/pabx06/buildghidra.svg?branch=master)](https://travis-ci.com/pabx06/buildghidra)

[Ghidra](https://github.com/NationalSecurityAgency/ghidra) master branch build relase wit color dark theme + colors patch

![ghidra_dark](/Screenshot.png?raw=true)

### how to
1. Download a release [release](https://github.com/pabx06/buildghidra/releases) or build your own see `./scripts/` `./patch/`
2. Patch _code_browser.tcd . If not already done. Patch  `~/.ghidra/.ghidra_9.2_DEV/tools/_code_browser.tcd` to `~/.ghidra/.ghidra_9.2_DEV/tools/_code_browser_dark_night.tcd`  with [ghidra_darknight](https://github.com/elliiot/ghidra_darknight)
3. You know have a second code browser icon [dark](/dark_night.png). us it (drag and drop project file)

### ChangeLog
- v1.1.1 Color Console Interpreter
- v1.1.0  Color About,Tips of the day, Bytes Viewer, save data,  CodeBrowser Tooltip, ARM manual

### TODO List
- finish Bytes Browser color
- tweak  functionEditorDialogue DataTyper/Editor/CellEdit/Render
- slow Function tags plugins