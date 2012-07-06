RallyEmailGateway
=================
README file for creating a Rally defect or story using a POP3 mail server

Install rubygems (from command line or terminal: gem install rubygems)
Install mail (from command line or terminal: gem install mail)
Install rally_rest_api (from command line or terminal: gem install rally_rest_api)

Create email account to be used to process all incoming Rally creation requests. For example, rallyrequest@domain.com.

Setup the Ruby script on a server to run a service when an incoming mail is sent to the email account created above.
The Ruby script will create defects for email subjects starting with 'defect'. Otherwise, a user story will be created.

Edit Ruby script with appropriate Rally settings and POP3 mail server settings.
Rally user needs to have user permissions to the project specified in the script.

Create a cron job on a Unix/Mac server to run the script at a set interval or the equivalent for Windows. 