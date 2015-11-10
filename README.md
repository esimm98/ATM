# ATM
### Purpose:
The purpose of this project was to incorporate classes and a user interface into an ATM simulation.   
### Setup:
Install ruby dependencies
```sh
$ bundle install
```
Clone the repository
```sh
$ git clone https://github.com/esimm98/ATM
```
Move into the new folder, open up the files in sublime, then run the program
```sh
$ cd ATM
$ subl .
$ ruby run.rb
```
### Questions:   
1) Is there a way to create a new account through the ATM and add that to an existing text file? (No code for this, as I just don't know the commands to execute it)

2) Would it make sense to have someone just input an id number instead of their name? So I could just look up their number in the array of users, instead of:
```sh
users.each do |n|
	if name == n.name && pin == n.pin
		@current_user = n
		puts "Welcome"
		return true
	else
		puts "Invalid combination"
		return false
	end
end
```
3) What exactly is the difference between attr_reader and attr_accessor, and are they needed along with the initialization?
```sh
attr_accessor :name, :pin, :current_user    
def initialize
    @name = name    
    @pin = pin  
	@current_user = current_user
end
```
