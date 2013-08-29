$LOAD_PATH.unshift(File.dirname(__FILE__)) unless $LOAD_PATH.include?(File.dirname(__FILE__)) 

#!/usr/bin/env ruby

require 'Bot'
require 'cgi'


#A basic HTML template consisting of a basic page with a form
#and text entry box for the user to converse with our bot.It uses
#some placeholder text (%RESPONSE%) so the bot's responses can be
#substituted in easily later.
html = %q{
	<html><body>
	<form method="get">
	<h1>Talk To A Bot</h1>
	%RESPONSE%
	<p>
		<b>You say:</b><input type="text" name="line" size="40"/>
		<input type = "submit"/>
	</p>
	</form>
	</body>
	</html>
}

#Set up the CGI environment and make the parameters easy to access
cgi = CGI.new
params = cgi.params
line = params['line']&&params['line'].first

bot = Bot.new(:name => "Neo",:data_file => "neo.bot")

#If the user supplies some text,respond to it
if line && line.length>1
	bot_text = bot.response_to(line.chomp)
else
	bot_text = bot.greeting
end

#Format the text and substitute into the HTML template
bot_text = %Q{<p><b>I say:</b>#{bot_text}</p<}
puts "Content-type:text/html \n \n"
puts html.sub(/\%RESPONSE \%/,bot_text)