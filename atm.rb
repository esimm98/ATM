require_relative "user"

class ATM
	attr_accessor :name, :pin, :current_user

	def initialize
		@name = name
		@pin = pin
		@current_user = current_user			
	end

	def input
		puts "Please Enter Your Name: "
		@name = $stdin.gets.chomp
		puts "Please Enter Your PIN: "
		@pin = $stdin.gets.chomp
	end

	def authorize(users, name, pin)
		users.each do |n|
			if name == n.name && pin == n.pin
				@current_user = n
				puts "Welcome"
				return true
			else
				puts "Invalid combination"
			end
		end
	end

end