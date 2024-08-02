#! /bin/bash

# Get the latest artifact URL
ZIP_URL=$(curl -L -H "Accept: application/vnd.github+json" -H "X-GitHub-Api-Version: 2022-11-28" https://api.github.com/repos/littlepazienza/pazienza-tech/actions/artifacts | jq -r '.artifacts[0].archive_download_url')
echo $ZIP_URL

# Download the artifact to a local file called zip
curl -L -H "Accept: application/vnd.github+json" -H "Authorization: Bearer $GITHUB_TOKEN" -H "X-GitHub-Api-Version: 2022-11-28" $ZIP_URL -O

PAZIENZA_TECH=$(pwd)/var/www/html/paz.ienza.tech/master
ZIP_FILE=zip
TAR_FILE=website.tar.gz

# Ensure any of our setup is cleaned up
rm -rf $PAZIENZA_TECH/tmp

# Move the zip into the target dir for my website, extract the relevant files, remove all the clutter
mkdir $PAZIENZA_TECH/tmp
mv $ZIP_FILE $PAZIENZA_TECH/tmp/
cd $PAZIENZA_TECH/tmp
unzip $ZIP_FILE
tar -xzvf $TAR_FILE
mv * $PAZIENZA_TECH

# Cleanup out folders
cd $PAZIENZA_TECH
rm -rf $PAZIENZA_TECH/tmp

