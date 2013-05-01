#!/bin/bash

unset GIT_DIR
git fetch origin && git reset --hard origin/master
bundle exec rake assets:precompile
touch tmp/restart.txt
