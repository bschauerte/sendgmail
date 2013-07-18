# sendgmail

sendgmail let's you send GMail e-mails via the command line and Matlab.

## Installation

Copy the files somewhere and then do the following ...

### sendgmail.sh

You have to create a ~/.sendgmail file containing the configuration in your home folder. See *example.sendgmail* for a configuration example.

*NOTE* Currently, the configuration file is sourced. This allows for a lot of flexibility, but it also poses a potential security risk. Take care!

Variables:

* *FROM_EMAIL_ADDRESS*: Set your login name/mail
* *EMAIL_ACCOUNT_PASSWORD*: Set your password (don't forget to make the config private, i.e. "chmod 700 ~/.sendgmail"!)
* *NSS_CONFIG_DIR*: Set the path of the NSS folder (you can use your Firefox profile folder).
* *MAILX_BIN*: Specify the mail user agent (such as, e.g., mailx or heirloom-mailx)

Questions?

* [Where is the Firefox profile folder](http://kb.mozillazine.org/Profile_folder_-_Firefox#Navigating_to_the_profile_folder)
* [What is mailx](http://en.wikipedia.org/wiki/Mailx)
* ... and [Heirloom mailx](http://heirloom.sourceforge.net/mailx.html)

### sendgmail.m

Set *sendgmail_skript_path* to the correct path of *sendgmail.sh*.

### Prerequisites

You might need to install [Heirloom Mailx aka nail](http://heirloom.sourceforge.net/mailx.html) or another mail user agent that allows secure connections and certificates. The script relies on [NSS](https://developer.mozilla.org/en-US/docs/NSS) for this purpose, which is part of - e.g. - Firefox.

## Usage

### sendgmail.sh

*sendgmail.sh* basically allows to use a subset of arguments that mail and mailx provide. Currently, supported are "Ftsa":

* *F*: set sender's friendly name (what is shown as name of the sender)
* *t*: set To-Address
* *s*: set e-Mail subject
* *a*: set attachment

If you have a look at the code, you will notice that it is easy to extend the list of supported arguments. Just adapt it towards your needs ... and if you do something great, don't forget to issue a pull request.

### sendgmail.m

The interface should imitate Matlab's sendmail command (which I never got to work properly with my GMail account, despite the example).

## Why?

Because sometimes you have to work on a badly configured server or behind a nasty firewall, but you still want to receive notification/status/crash-report e-mails when your program (e.g., week-long machine learning and evaluation tasks) finishes or crashes. Also, it is very convenient to send short e-mails directly from your command line.

## Contribute

You are welcome to send patches or pull requests.

## Contact

[Boris Schauerte](http://cvhci.anthropomatik.kit.edu/~bschauer/ "Boris Schauerte, Homepage") &lt;schauerte aht acm doht org&gt;  
Karlsruhe Institute of Technology  