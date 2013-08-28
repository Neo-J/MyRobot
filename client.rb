$LOAD_PATH.unshift(File.dirname(__FILE__)) unless $LOAD_PATH.include?(File.dirname(__FILE__)) 

require 'Bot'

bot = Bot.new(:name => "Neo",:data_file => "neo.bot")

puts bot.greeting

while input = gets and input.chomp != 'goodbye'
	puts ">>"+bot.response_to(input)
end

puts bot.farewell