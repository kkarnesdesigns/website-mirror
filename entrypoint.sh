#!/bin/bash

echo 'Initiaing website mirroring'
apt-get update
apt install wget curl git -y
export LANG=en_US.UTF-8
REPO=$( echo "$URL" | sed -e "s/\([^/]*\/\/\)\?\(www\.\)\?\([^.]*\)\..*/\3/")
wget --mirror -p --convert-links $URL
curl \
	-H "Authorization: token $_GITHUB_TOKEN" https://api.github.com/user/repos \
	-d '{"name":"'$REPO'-website","private":false}'
cd $URL
git init
git config --global user.name "$USER_NAME"
git config --global user.email "$USER_EMAIL"
git add .
git commit -m "init website repo"
git push -f https://$_GITHUB_TOKEN:x-oauth-basic@github.com/$USER_NAME/$REPO-website.git master