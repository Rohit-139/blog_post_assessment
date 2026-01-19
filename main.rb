require ('./user.rb')
require('./user_module.rb')

class Main
	include User_module

	def create_user
		puts 'Enter Name : '
		name = gets.chomp
		puts 'Enter email : '
		email = gets.chomp
		puts 'Enter Password : '
		password = gets.chomp
		user = User.new(name,email, password)
		if user.validate_user?(email, password)
		  User_module.create_user(user)
		  puts 'User Registered Succesfully'
		else
			puts 'try again'
		end
	end
  
  def login_user
  	puts 'enter email : '
  	email = gets.chomp
  	puts 'enter password : '
  	password = gets.chomp
  	User_module.login_user(email, password) 
  end

end

ob = Main.new
# ob.create_user
# ob.login_user
