require 'yaml'

bot_data = {
	:presubs => [["dont","don't"],["youre","you're"],["love","like"]],
	:responses => {
		:default => ["I don't understand.","What?","Huh?"],
		:greeting => ["Hi,I'm [name ].Want to chat?"],
		:farewell => ["Good bye"],
		'hello' => ["How's it going?","How do you do?"],
		'I like *' => ["Why do you like *","Wow!I like *too!"]
	}
}

#show the user the yaml data for the bot structure
puts bot_data.to_yaml

#write the YAML data to file
f = File.open(ARGV.first || 'bot_data',"w")
f.puts bot_data.to_yaml
f.close