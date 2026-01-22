class Blog 
	attr_accessor :id, :blog_title, :blog_desc, :created_by

	def create_blog(blog_title, blog_desc, created_by)
		#generate a unique id for blog 
		random_id = "#{created_by.split('@').first.concat(rand(100).to_s)}"
		@id = random_id 
		@blog_title = blog_title
		@blog_desc = blog_desc 
		@created_by = created_by
	end

	#use lambda for fetching data from blog file
	FETCH_BLOG_DATA = lambda { |filename| return arr = File.readlines(filename) }

	def store_blog(blog)
		file = File.open('blog.txt','a')
		file.puts("#{blog.id}%$#{blog.blog_title}%$#{blog_desc}%$#{blog.created_by}")
		file.close
	end

	#this method fetch the all the blogs of user by matching their id
	def my_blog(email)
		raw_blog_data = FETCH_BLOG_DATA.call('blog.txt')
		count = 0
		raw_blog_data.each do |data|
			my_blog = data.split('%$')
			if my_blog[3].chomp!.eql?(email) 
				puts "blog id : #{my_blog[0]}  \t\t\tblog title : #{my_blog[1]} \t\t\tcreated by : #{my_blog[3]}"
				count += 1
			end
		end
		if count == 0
			puts "You have not created any blog yet\n"
		else
			puts "press 1 for see detail of any specific blog \npress anything for going back "
		  choice = gets.chomp.split.first.to_i
	    single_blog_see(choice,raw_blog_data)
		end
	end 

	# this method fetch all the blogs present in the file 
	def all_blog
		raw_blog_data = FETCH_BLOG_DATA.call('blog.txt')
		if raw_blog_data.empty?
			puts "No blogs are posted by users\n"
		else
		  raw_blog_data.each do |data|
			  my_blog = data.split('%$')
			  puts "blog id : #{my_blog[0]}  \t\tblog title : #{my_blog[1]} \t\tcreated by : #{my_blog[3]}"
		  end
		end
		puts "press 1 for see detail of any specific blog \npress anything for going back "
		choice = gets.chomp.split.first.to_i
	  single_blog_see(choice,raw_blog_data)
	end

	# this method fetch single blog by their id and put their description also
	def view_single_blog_desc(blog_id, raw_blog_data)
		count = 0
		raw_blog_data.each do |data|
			my_blog = data.split('%$')
			if my_blog[0].eql?(blog_id)
				puts "Title : #{my_blog[1]}"
				puts "Description :#{my_blog[2]} \n"
				count += 1
			end
		end
		puts "There is no blog of this id \n" if count == 0
	end

	# this method work on user choice to find single record
	def single_blog_see(choice, raw_blog_data)
		case choice 
		when 1
			puts 'enter blog id : '
			blog_id = gets.chomp.split.first
			view_single_blog_desc(blog_id, raw_blog_data)
		else
			puts "back to menu \n"
		end
	end

	#this method search the blog by id 
	def search_blog(blog_id)
		raw_blog_data = FETCH_BLOG_DATA.call('blog.txt')
		count = 0
		raw_blog_data.each do |data| 
			my_blog = data.split('%$')
			if my_blog[0].eql?(blog_id)
				puts "Title : #{my_blog[1]}"
				puts "Description #{my_blog[2]} \n"
				count += 1
			end
		end
		puts "There is no record of this #{blog_id} Id \n" if count == 0
	end

end



