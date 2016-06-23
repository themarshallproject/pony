#!/bin/bash
set -e
bundle exec rake db:migrate
echo "postdeploy.sh done"
