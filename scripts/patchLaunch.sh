#!/bin/bash

patch ./Ghidra/RuntimeScripts/Common/support/launch.properties  ../patch/launch.properties.patch
patch ./Ghidra/RuntimeScripts/Linux/support/launch.sh ../patch/launch.sh.patch
