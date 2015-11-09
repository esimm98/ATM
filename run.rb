require_relative "user"
require_relative "atm"
users = []

file = File.open("users.csv", 'r')
file.each_line do |line|
	arr = line.chop.split(',')
	arr[0] = User.new(arr[0], arr[1].to_i, arr[2].chop)
	users << arr[0]
end

atm = ATM.new

atm.input
atm.authorize