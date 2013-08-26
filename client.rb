$LOAD_PATH.unshift(File.dirname(__FILE__)) unless $LOAD_PATH.include?(File.dirname(__FILE__)) 

require 'bot'

bot = Bot.new(:name => "Botty",:data_file => "botty.bot")

puts bot.greeting
while input = gets and input.chomp != 'goodbye'
	puts ">>"+bot.response_to(input)
end

puts bot.farewell