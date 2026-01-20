require ('./user.rb')
require('./user_module.rb')

class Main
	include User_module

	def create_user
		puts 'Enter Name : '
		name = gets.chomp.split.first
		puts 'Enter email : '
		email = gets.chomp.split.first
		puts 'Enter Password : '
		password = gets.chomp.split.first
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
  
  def user_choice_method(user_choice)
  	case user_choice
  	when 1
  		#calling create user method when user input is 1
  		create_user
  		puts "Redirecting to login "
  		email = login_user
  		puts email
  	when 2
  		#calling login_user method when user input is 2
  		email = login_user
  		
  	when 3
  		#exit from program
  		puts "Exited from program" 
  		exit
  	else 
  		puts "Enter valid choice "
  	end
  end

  def main_method
  	puts 'Blog Post Platform'
  	print "press 1 for Create Account \npress 2 for Login \npress 3 for Exit the program \n"
  	loop do
  	  puts 'enter choice : '
  	  user_choice = gets.chomp.to_i
    	user_choice_method(user_choice)
    	#taking input unless it comes between 1 to 3 
  	break if (1..3).include?(user_choice)
    end
  end

end

ob = Main.new
ob.main_method

