#!/bin/sh

# Initialize a new MultiMarkdown-CMS site inside the `www` directory

# Create new git repo in www
cd www
git init

# Get the MMD-CMS framework
git remote add "source" https://github.com/fletcher/MultiMarkdown-CMS.git

# use the advanced version
git pull source advanced

# Create separate branch for the source repository
git branch source

git checkout master
