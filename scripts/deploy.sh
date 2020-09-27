#!/bin/bash
TRAVIS_TAG=${TRAVIS_TAG:-$(git tag|tail -n1 )}
tar czvf ghidra-dist-${TRAVIS_TAG}.tgz ghidra/build/
