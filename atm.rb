require_relative "user"

class ATM
	attr_accessor :name, :pin, :users

	def initialize
		@name = name
		@pin = pin
		@users = users			
	end

	def input
		puts "\n Please Enter Your Name: "
		name = gets.chomp
		puts "Please Enter Your PIN: "
		pin = gets.chomp
	end

	def authorize(name, pin)

	end

end