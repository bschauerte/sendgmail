function [status,result] = sendgmail(to,subject,theMessage,attachments,friendlyname)
  # SENDGMAIL tries to send an e-Mail using a Google Mail account.
  # 
  # @author: B. Schauerte
  # @date:   2012
  # @url:    http://cvhci.anthropomatik.kit.edu/~bschauer/

  # sendgmail - send GMails via command line & Matlab
  # Copyright (C) 2012  Boris Schauerte
  #
  # This program is free software: you can redistribute it and/or modify
  # it under the terms of the GNU General Public License as published by
  # the Free Software Foundation, either version 3 of the License, or
  # (at your option) any later version.
  #
  # This program is distributed in the hope that it will be useful,
  # but WITHOUT ANY WARRANTY; without even the implied warranty of
  # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  # GNU General Public License for more details.
  #
  # You should have received a copy of the GNU General Public License
  # along with this program.  If not, see <http://www.gnu.org/licenses/>.

  sendgmail_skript_path='/usr/local/bin/sendgmail.sh'; % mailx wrapper to send mails through gmail

  if ~exist(sendgmail_skript_path,'file')
    error('Can not find sendgmail.sh');
  end
  
  if nargin < 3, theMessage = ''; end
  if nargin < 4, attachments = []; end
  if nargin < 5, friendlyname = 'Your Matlab Daemon'; end
  
# create the basic command
  command = sprintf('%s -s "%s" -F "%s" -t "%s"', sendgmail_skript_path, subject, friendlyname,to);
  
# attachment?
  if ~isempty(attachments)
    if ~iscell(attachments)
      command = sprintf('%s -a %s', command, attachments);
    else
      for i=1:numel(attachments)
        command = sprintf('%s -a %s', command, attachments{i});
      end
    end
  end
  
# put in the message
  if ~isempty(theMessage)
    fname = tempname();
    fid = fopen(fname, 'w');
    if iscell(theMessage)
      fprintf(fid,theMessage{:});
    else
      fprintf(fid,theMessage);
    end
    fprintf(fid,'\n.'); % end message
    fclose(fid);
    command = sprintf('cat %s | %s',fname,command);
  end
  
#command
  [status,result] = system(command); % call the skript and try to send