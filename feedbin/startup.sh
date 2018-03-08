#!/bin/bash

GEM_HOME=~/.gems
PATH=$PATH:$GEM_HOME

cd /opt/feedbin
bundle exec foreman start &
rackup -o 0.0.0.0 
