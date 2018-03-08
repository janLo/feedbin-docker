#!/bin/bash

GEM_HOME=~/.gems
PATH=$PATH:$GEM_HOME

cd /opt/app
bundle exec foreman start
