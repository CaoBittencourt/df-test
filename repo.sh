#!/bin/bash

# # repo name
# repo="g"

# # repo desc
# desc="An Opinionated, Super Simplified, Streamlined Wrapper for Git."

# # create remote repo
# gh repo create "$repo" -d "$desc" --private

# create local repo
git init --initial-branch master .
git add .
git commit -m 'created repo'
git tag 0.0.1
# git remote add origin "https://github.com/"$(git config user.name)"/$repo.git"
# git push -u --follow-tags origin master

# # official release branch
# git checkout -b stable master
# git push -u origin stable

# # one dev branch per team
# git checkout -b dev master
# git push -u origin dev
