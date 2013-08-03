#!/bin/bash

# Script to simplify the configuration of sendgmail.sh
#
# @author B. Schauerte
# @date   2013

# Known problems:
# - the default Bash's read command on Mac OS X 10.8 does not support the -i option
#
# ToDo
# - make it work on Mac OS, right now it just works on my Linux machine

# Source the config, if it exists
if [ -f ~/.sendgmail ]; then
    . ~/.sendgmail
fi

# 1. Set the GMail address
read -e -p "Please enter your GMail address (e.g., foo@gmail.com): " -i "$FROM_EMAIL_ADDRESS" FROM_EMAIL_ADDRESS

# 2. Set the password
read -e -p "Please enter your password: " -i "$EMAIL_ACCOUNT_PASSWORD" EMAIL_ACCOUNT_PASSWORD

# 3. Search for the mail program
KNOWN_MAILX="heirloom-mailx mailx"
for MX in $KNOWN_MAILX; do
    MAILX_BIN=$(which $MX)
    if [ -n "$MAILX_BIN" ]; then
        #echo Found $MAILX_BIN
        break
    fi
done
read -e -p "Specify your mail program: " -i "$MAILX_BIN" MAILX_BIN

# 4. Search for the NSS files/folder
NSS_CONFIG_DIR=$(ls -d ~/.mozilla/firefox/*.default)
read -e -p "Specify the NSS folder: " -i "$NSS_CONFIG_DIR" NSS_CONFIG_DIR

# Write to stdout
echo FROM_EMAIL_ADDRESS=$FROM_EMAIL_ADDRESS
echo EMAIL_ACCOUNT_PASSWORD=$EMAIL_ACCOUNT_PASSWORD
echo MAILX_BIN=$MAILX_BIN
echo NSS_CONFIG_DIR=$NSS_CONFIG_DIR

# Store to file
echo FROM_EMAIL_ADDRESS=$FROM_EMAIL_ADDRESS > ~/.sendgmail
echo EMAIL_ACCOUNT_PASSWORD=$EMAIL_ACCOUNT_PASSWORD >> ~/.sendgmail
echo MAILX_BIN=$MAILX_BIN >> ~/.sendgmail
echo NSS_CONFIG_DIR=$NSS_CONFIG_DIR >> ~/.sendgmail

# Make the config file private
chmod 700 ~/.sendgmail
