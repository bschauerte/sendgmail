# sendgmail

sendgmail let's you send GMail e-mails via the command line and Matlab.

## Installation

*Note:* The current version is not very user friendly, I will try to integrate a better configuration as soon as I find some time.

Copy the files where you want and then do the following ...

### sendgmail.sh

You have to set the variables/constants in the *CONFIGURATION* section of the script.

### sendgmail.m

Set *sendgmail_skript_path* to the correct path of *sendgmail.sh*.

### Prerequisites

You might need to install [Heirloom Mailx aka nail](http://heirloom.sourceforge.net/mailx.html) and the correct certificates, which however are often part of other programs such as Firefox.

## Usage

### sendgmail.sh

... will update this part of the README sometime soon ... but it's simple, just look in the code

### sendgmail.m

The interface should imitate Matlab's sendmail script (which I never got to work properly with my GMail account, despite the example).

## Why?

Because sometimes you have to work on a badly configured server or behind nasty firewall, but you still want to receive notification/status/crash-report e-mails when your program (e.g., week-long machine learning and evaluation tasks) finishes or crashes.

## Contribute

You are welcome to send patches or pull requests.

## Contact

B. Schauerte &lt;schauerte aht acm doht org&gt;  
Karlsruhe Institute of Technology  
[Boris Schauerte](http://cvhci.anthropomatik.kit.edu/~bschauer/ "Boris Schauerte, Homepage")