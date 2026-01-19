require 'uri'

class User
	attr_accessor :name, :email, :password
	def initialize(name, email, password)
		@name = name
		@email = email
		@password = password
	end

	def validate_user?(email, password)
		if !!(email =~ URI::MailTo::EMAIL_REGEXP)
			if password.bytes.size < 8 
				puts "password size should be atleast 8 "
				return false
			else 
				return true
			end
		else 
			puts "email is invalid"
			return false
		end
	end
end

