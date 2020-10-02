## ghidra dark look and feel

[![Build Status](https://travis-ci.com/pabx06/buildghidra.svg?branch=master)](https://travis-ci.com/pabx06/buildghidra)

[Ghidra](https://github.com/NationalSecurityAgency/ghidra) master branch build relase wit color dark theme + colors patch

![ghidra_dark](/Screenshot.png?raw=true)

### how to
1. Download  a release 
⋅⋅* [v1.0.3](https://github.com/pabx06/buildghidra/releases/tag/v1.0.3) ghidra 0cdc722921cef61b7ca1b7236bdc21079fd4c03e
⋅⋅* [v1.0.2](https://github.com/pabx06/buildghidra/releases/tag/v1.0.2) ghidra 7e5f015d651b9c5e7825cb10bc50338b5af67538
2. Patch _code_browser.tcd if not already done `~/.ghidra/.ghidra_9.2_DEV/tools/_code_browser.tcd` to `~/.ghidra/.ghidra_9.2_DEV/tools/_code_browser_dark_night.tcd`  with [ghidra_darknight](https://github.com/elliiot/ghidra_darknight)

### ChangeLog
- v1.1.0  Color About,Tips of the day, Bytes Viewer, save data,  CodeBrowser Tooltip, ARM manual