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
DATE=$(date --iso-8601)
git tag -a "${TAG}" -m "${DATE}"
git push
git push --tags
