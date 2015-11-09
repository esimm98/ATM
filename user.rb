class User
	attr_accessor :name, :pin, :balance

	def initialize(name, pin, balance, id)
		@name = name
		@pin = pin
		@balance = balance
		@id = id
	end

end