require 'uri'

class User
	attr_accessor :name, :email, :password
	def initialize(name, email, password)
		@name = name
		@email = email
		@password = password
	end

	def validate_user?(name, email, password)
	  #Validate Email using Ruby's built-in URI regex
	  unless email =~ URI::MailTo::EMAIL_REGEXP
	    puts "Email is invalid \n"
	    return false
	  end

	  #Validate Password Length (8 bytes)
	  if password.bytesize < 8
	    puts "Password size should be at least 8 length \n"
	    return false
	  end

	  #Validate Name (Ensuring no digits are present)
	  # !/\d/.match?(name) means true if NO digits are found
	  if /\d/.match?(name)
	    puts "Name cannot contain digits \n"
	    return false
	  end

	  # If all checks pass
	  true
  end
end

