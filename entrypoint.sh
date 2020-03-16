#!/bin/bash

echo 'Initiaing website mirroring'
apt-get update
apt install wget curl git -y
export LANG=en_US.UTF-8
REPO=$( echo "$URL" | sed -e "s/[^/]*\/\/\([^@]*@\)\?\([^:/]*\).*/\2/")
curl \
	-H "Authorization: token $GITHUB_TOKEN" https://api.github.com/user/repos \
	-d '{"name":"${REPO}-Website","private":false}'
wget --mirror -o download.log -p --convert-links $URL
cd $URL
git init
git config --global user.name "$USER_NAME"
git config --global user.email "$USER_EMAIL"
git add .
git commit -m "init website repo"
git push -f https://$GITHUB_TOKEN:x-oauth-basic@github.com/$USER/Mirror-Website.git master