

#insert into foo values (current_Date()),(now());





#Configure the PHP module in Apache. You can use the default virtual host. Lookup the apache config to see where its document root is located.

Create a PHP webform named startup.php that says something like "enter your access code to start your server". It will take that code and lookup in the DB. If a match is found, create an entry in the logins table. The logout date/time should be entered as 5 hours after the current system time. Leave the serverIP empty. Set the status to STARTING. Display on the page the loginName and logoutDateTime, informing the user when their server will be powered off. If they try to start the server and the status is "ONLINE" or "STARTING" say something like "your server is currently starting up, wait a few minutes and retry to get the system IP".

If the status is STARTING, show a textbox named "Get My Server IP". It will lookup the last entry in the logins table for that user where the status is ONLINE and return the serverIP value, saying something like "your server is started. Have a fun time learning!". If it is not ONLINE, say something like "your server will be online momentarily. Please check back in a few minutes".

That's it!
I'll write the polling job and the code to connect to GCP which will create, start or stop the instances as needed and set the status value to ONLINE or OFFLINE as appropriate.
