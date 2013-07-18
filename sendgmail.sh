#!/bin/sh

#  sendgmail - send GMails via command line & Matlab
#  Copyright (C) 2012  Boris Schauerte
#
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see <http://www.gnu.org/licenses/>.

#
# DEFAULT CONFIGURATION
#

FROM_EMAIL_ADDRESS="MY_LOGIN@gmail.com"          # YOUR GMail address
EMAIL_ACCOUNT_PASSWORD="MY_PASSWORD"             # YOUR GMail password
NSS_CONFIG_DIR="/home/bschauer/.mozilla/firefox/rnkg2jlf.default/" # YOUR NSS config dir, use Firefor for your convenience
MAILX_BIN="heirloom-mailx"                       # Ubuntu's default mailx is a stripped down version without the necessary features

# Source the config, if it exists
if [ -f ~/.sendgmail ];
then
   . ~/.sendgmail
fi

#
# Default mail values
#

EMAIL_SUBJECT="test"                             # Mail subject
FRIENDLY_NAME="Command Line GMail"               # Friendly name will be shown as the sender's name
TO_EMAIL_ADDRESS="test@account.de"               # To-Address

#
# MAIN CODE
#

if [ ! -f $NSS_CONFIG_DIR ]; then
    echo "Error: NSS configuration directory not found"
fi

VARMAILXOPT="";

#Process the arguments
while getopts F:t:s: opt
do
   case "$opt" in
      F) FRIENDLY_NAME=$OPTARG;;                # set sender's friendly name (what is shown as name of the sender)
      t) TO_EMAIL_ADDRESS=$OPTARG;;             # set To-Address
      s) EMAIL_SUBJECT=$OPTARG;;                # set e-Mail subject
      a) VARMAILXOPT="VARMAILXOPT -a $OPTARG";; # set attachment
   esac
done


mailx -v -s "$EMAIL_SUBJECT" -S smtp-use-starttls -S ssl-verify=ignore -S smtp-auth=login -S smtp=smtp://smtp.gmail.com:587 -S from="$FROM_EMAIL_ADDRESS($FRIENDLY_NAME)" -S smtp-auth-user=$FROM_EMAIL_ADDRESS -S smtp-auth-password=$EMAIL_ACCOUNT_PASSWORD  -S ssl-verify=ignore -S nss-config-dir=NSS_CONFIG_DIR $TO_EMAIL_ADDRESS
