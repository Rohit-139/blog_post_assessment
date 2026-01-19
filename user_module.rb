module User_module 
	def self.create_user(user)
		file = File.open('user.txt','a')
		#Storing name email password in user.txt file
		file.puts("#{user.name} #{user.email} #{user.password}")
	end

	def self.login_user(email, password)
    file = File.open('user.txt')
    # fetching user.txt data as array in user_arr
    user_arr = file.readlines
    user_hash = Hash.new
    user_arr.each do |arr|
    	#split string into elements like name email password
      user = arr.split(' ')
      #putting email and password in hash as key and value
      user_hash[user[1]] = user[2]
    end
    #checking that email is registered or not
    if user_hash.has_key?(email)
      real_pass = user_hash[email]
    	if real_pass.eql?(password)
    	  puts 'Login Succesfully'
    	else
    	 	puts 'Password is wrong'
    	end
    else 
    	puts 'email not registered'
    end
	end


end