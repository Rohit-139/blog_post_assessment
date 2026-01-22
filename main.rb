require ('./user.rb')
require('./user_module.rb')
require('./blog.rb')
require('./csv_export.rb')

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
		if user.validate_user?(name,email, password)
		  User_module.create_user(user)
		  puts "User Registered Succesfully \n"
		  return true
		else
			puts "try again \n"
			return false
		end
	end
  
  def login_user
  	puts 'enter email : '
  	email = gets.chomp
  	puts 'enter password : '
  	password = gets.chomp
  	User_module.login_user(email, password) 
  end
  
  def blog_method_choice(email)
  	loop do
	  	puts "press 1 for Create blog \npress 2 for view your blog \npress 3 for see all blog \npress 4 for search blog \npress 5 for export to csv \npress 6 for logout \npress 7 for exit"
	  	blog_object = Blog.new
	  	choice = gets.chomp.to_i
	  	case choice 
	  	when 1 
	  	  puts "Enter blog title : "
	  	  blog_title = gets.chomp
	  	  puts "Enter blog description : "
	  	  blog_desc = gets.chomp
	  	  if blog_title.bytes.size > 20
	  	  	puts "blog does not create, blog title should be within 20 character\n"
	  	  else
	  	  blog_object.create_blog(blog_title,blog_desc,email)	
	  	  blog_object.store_blog(blog_object)
	  	  puts "Blog is created \n"
	  	  end
	  	when 2
	  		blog_object.my_blog(email)
	  	when 3
	  		blog_object.all_blog
	  	when 4 
	  		puts "Enter Blog id : "
	  		blog_id = gets.chomp
	  		blog_object.search_blog(blog_id)
	  	when 5
	  		csv_object = Csv.new
	  		csv_object.export_to_csv(email)
	  		puts "data exported to csv, check my_blogs.csv\n"
	  	when 6 
	  		puts 'Logged out...'
	  		main_method
	  	when 7 
	  		puts "exiting program...."
	  		exit
	  	end

  	  break if choice == 6
    end
  end

  def user_choice_method(user_choice)
  	case user_choice
  	when 1
  		#calling create user method when user input is 1
  		if create_user
  		  puts "Redirecting to login \n"
  		  email = login_user
  		  if email == nil
  		   	main_method
  	    else
  	      blog_method_choice(email)
 		    end
  		else main_method
  		end
  		
  	when 2
  		#calling login_user method when user input is 2
  		email = login_user
  		if email == nil
  		  puts "try again\n"
  		  main_method
  		else
  		  blog_method_choice(email)
  		end
  	when 3
  		#exit from program
  		puts "Exited from program" 
  		exit
  	else 
  		puts "Enter valid choice \n"
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

