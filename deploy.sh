#!/bin/bash
# run in MASTER_DIR
set -x
set -e

MESSAGE=$1

PROGRAM="samuelson-economics"
GITBOOK_DIR="/Users/weihuanghu/hexo/gitbook"
MASTER_DIR="${GITBOOK_DIR}/economics-notes/${PROGRAM}"
GHPAGE_DIR="${GITBOOK_DIR}/${PROGRAM}"
# CODING_DIR="${GITBOOK_DIR}/${PROGRAM}-coding-pages"

# build
gitbook build

# clean GHPAGE_DIR
rm -fr ${GHPAGE_DIR}/*
# rm -fr ${CODING_DIR}/*

# copy _book to GHPAGE_DIR
cp -fr ${MASTER_DIR}/_book/* ${GHPAGE_DIR}
cp -fr ${MASTER_DIR}/README.md ${GHPAGE_DIR}
# cp -fr ${MASTER_DIR}/_book/* ${CODING_DIR}
# cp -fr ${MASTER_DIR}/README.md ${CODING_DIR}

# git commit
cd ${GHPAGE_DIR}
git add --all
git commit -m "${MESSAGE}"
git push origin master

# cd ${CODING_DIR}
# git add --all
# git commit -m "${MESSAGE}"
# git push origin coding-pages
