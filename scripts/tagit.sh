#!/bin/bash
echo "************status**************"
git status
echo "********************************"
echo "tags are:"
git tag
echo "********************************"
echo "input a tag ie: v1.a.b"
read TAG
echo "will tag to ${TAG}"