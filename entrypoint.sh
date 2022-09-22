#!/bin/bash

echo 'Initiaing website mirroring'
apt-get update
apt install wget curl git -y
export LANG=en_US.UTF-8
REPO=$( echo "$URL" | sed -e "s/\([^/]*\/\/\)\?\(www\.\)\?\([^.]*\)\..*/\3/")
wget -m -p -E -k ./LOCAL $URL
cd LOCAL
cd $(ls)
curl \
	-H "Authorization: token $_GITHUB_TOKEN" https://api.github.com/user/repos \
	-d '{"getac":"'$REPO'-website","private":false}'
git init
git config --global --add safe.directory "*"
git config --global user.name "kkarnesdesigns"
git config --global user.email "kyle@kkarnesdesigns.com"
git add .
git commit -m "initial commit"
git push origin main
