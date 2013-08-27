$LOAD_PATH.unshift(File.dirname(__FILE__)) unless $LOAD_PATH.include?(File.dirname(__FILE__)) 

require 'yaml'
require 'wordplay'

class Bot
	attr_reader :name

	def initialize(options)
		@name = options [:name] || "Unnamed Bot"
		begin
			@data = YAML.load(File.read(options[:data_file]))
		rescue
			raise "Can't load bot data"
		end
	end

	#greeting function
	def greeting
		random_index :greeting
	end

	#farewell function
	def farewell
		random_index :farewell
	end

	private

	#a random function
	def random_response(key)
		random_index = rand(@data[:responses][key].length)
		@data[:responses][key][random_index].gsub(/\[name\]/,@name)
	end
end