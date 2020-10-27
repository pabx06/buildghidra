#!/bin/bash

patch ./Ghidra/Framework/Docking/build.gradle ../patch/build.gradle.patch
patch ./gradle/support/fetchDependencies.gradle ../patch/fetchDependencies.gradle.patch
patch ./Ghidra/Framework/Docking/Module.manifest ../patch/Docking.Module.manifest