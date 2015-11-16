require_relative "user"

class ATM
	attr_accessor :name, :pin, :current_user, :users, :account, :balance

	def initialize
		@users = []
	end

	def make_users
		file = File.read("users.csv")
		file.each_line do |line|
			arr = line.chop.split(',')
			@users << User.new(arr[0], arr[1], arr[2].chop.to_f)
		end
	end

	def pick_account_type
		puts "Press 1 to access an existing account, or press 2 to create a new one"
		@account = gets.chomp.to_i
	end

	def login
		puts "Please enter your name: "
		@name = gets.chomp.capitalize
		puts "Please enter your PIN: "
		@pin = gets.chomp
	end

	def authorize(name, pin)
		@users.each do |n|
			if name == n.name && pin == n.pin
				@current_user = n
				puts "Welcome #{@current_user.name}"
				return true
			else
				puts "Invalid combination"
				return false
			end
		end
	end

	def prompt
		puts "Press 1 (Deposit), 2 (Withdraw), 3 (Check Balance), or 4 (Exit)"
		input = gets.chomp.to_i
		if input == 1
			deposit
		elsif input == 2
			withdraw
		elsif input == 3
			print_balance
		elsif input == 4
			exit
		end
	end

	def deposit
		puts "How much would you like to deposit? "
		deposit_amount = gets.chomp.to_f
		@balance = @current_user.balance + deposit_amount
		puts "You now have $#{@balance}"
		update
	end

	def withdraw
		puts "How much would you like to withdraw? "
		withdraw_amount = gets.chomp.to_f
		@balance = @current_user.balance - withdraw_amount
		puts "You now have $#{@balance}"
		update
	end

	def print_balance
		puts "Your balance is $#{@current_user.balance}"
	end

	def update
		file = File.open("users.csv", 'w')
		@users.each do |user|
			if @name == user.name
				file.puts "#{@name},#{@pin},#{@balance}"
			else
				file.puts "#{user.name},#{user.pin},#{user.balance}"
			end
		end
		file.close
	end

	def make_account
		puts "Please enter your name: "
		new_name = gets.chomp.capitalize
		puts "Please enter you desired PIN: "
		new_pin = gets.chomp
		puts "How much would you like to deposit into this account?"
		new_balance = gets.chomp

		users << User.new(new_name, new_pin, new_balance)
		update
		puts "#{new_name}, you have a new account with PIN #{new_pin}, and a starting balance of $#{new_balance}"
	end

	def run
		make_users
		pick_account_type
		if @account == 1
			login
			if authorize(@name, @pin)
				prompt
			end
		elsif @account == 2
			make_account
		end
	end
end