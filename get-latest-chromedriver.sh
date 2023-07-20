#!/bin/bash

# Download chromedriver based on your current google-chrome version. unzip, delete the zip file
CHROME_VERSION=$(google-chrome --version | cut -d ' ' -f3)

# Construct the URL for corresponding google-chrome version
CHROMEDRIVER_URL="https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/${CHROME_VERSION}/linux64/chromedriver-linux64.zip"

# Download chromedriver into $HOME directory
echo "Downloading chromedriver version ${CHROME_VERSION}..."
wget -P $HOME $CHROMEDRIVER_URL

# Unzipping chromedriver
echo "Unzipping chromedriver..."
unzip -q $HOME/chromedriver-linux64.zip -d $HOME

# Install chromedriver(replace existing chromedriver with the one matching chrome version)
echo "Installing chromedriver..."
sudo mv $HOME/chromedriver-linux64/chromedriver /usr/bin/chromedriver
sudo chmod +x /usr/bin/chromedriver

# Cleanup temporary files
echo "Cleaning up...."
rm $HOME/chromedriver-linux64.zip
rm -rf $HOME/chromedriver-linux64

echo "Chromedriver version ${chrome_version} has been installed successfully!"
