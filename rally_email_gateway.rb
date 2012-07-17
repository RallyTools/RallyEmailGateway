require 'rubygems'
require 'net/pop'
require 'mail'
require 'rally_rest_api'

# Setup app information
custom_headers = CustomHttpHeader.new
custom_headers.name = 'Mail 2 Rally'
custom_headers.version = '0.1'
custom_headers.vendor = 'Rally Software'

#Rally settings
rally_server = 'https://rally1.rallydev.com/slm'
rally_username = 'username@domain.com'
rally_pwd = 'mypwd'

rally = RallyRestAPI.new(:base_url => rally_server,
    :username => rally_username,
    :password => rally_pwd,
    :http_headers => custom_headers)

#POP3 mail server settings
mail_server = 'pop.gmail.com'
mail_port = '995'
mail_username = 'username@domain.com'
mail_pwd = 'mypwd'
    
pop = Net::POP3.new(mail_server, mail_port)
pop.enable_ssl
pop.start(mail_username, mail_pwd) 
if pop.mails.empty?
  puts 'No mail.'
else
  pop.each_mail do |m| 
    mail = Mail.new(m.pop)
    rally.create(mail.subject.downcase.start_with?("defect") ? :defect : :hierarchical_requirement, :name => mail.subject, :description => mail.html_part.body)
    m.delete
  end
end
pop.finish

