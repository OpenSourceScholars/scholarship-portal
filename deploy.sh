#!/bin/bash

unset GIT_DIR
git fetch origin && git reset --hard origin/master
touch tmp/restart.txt
