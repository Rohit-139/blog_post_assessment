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
				puts "blog id : #{my_blog[0]}  \tblog title : #{my_blog[1]} \tcreated by : #{my_blog[3]}"
				count += 1
			end
		end
		if count == 0
			puts 'You have not created any blog yet'
		else
			puts "press 1 for see detail of any specific blog \npress 2 for going back "
		  choice = gets.chomp.split.first.to_i
	    single_blog_see(choice,raw_blog_data)
		end
	end 

	# this method fetch all the blogs present in the file 
	def all_blog
		raw_blog_data = FETCH_BLOG_DATA.call('blog.txt')
		if raw_blog_data.empty?
			puts 'No blogs are posted by users'
		else
		  raw_blog_data.each do |data|
			  my_blog = data.split('%$')
			  puts "blog id : #{my_blog[0]}  \tblog title : #{my_blog[1]} \tcreated by : #{my_blog[3]}"
		  end
		end
		puts "press 1 for see detail of any specific blog \npress 2 for going back "
		choice = gets.chomp.split.first.to_i
	  single_blog_see(choice,raw_blog_data)
	end

	# this method fetch single blog by their id and put their description also
	def view_single_blog_desc(blog_id, raw_blog_data)
		count = 0
		raw_blog_data.each do |data|
			my_blog = data.split('%$')
			if my_blog[0].eql?(blog_id)
				puts "\t\t Title : #{my_blog[1]}"
				puts "\t\t Description \n#{my_blog[2]}"
				count += 1
			end
		end
		puts 'There is no blog of this id ' if count == 0
	end

	# this method work on user choice to find single record
	def single_blog_see(choice, raw_blog_data)
		case choice 
		when 1
			puts 'enter blog id : '
			blog_id = gets.chomp.split.first
			view_single_blog_desc(blog_id, raw_blog_data)
		when 2
			puts 'back'
		else
			puts 'Enter right choice'
		end
	end

	#this method search the blog by id 
	def search_blog(blog_id)
		raw_blog_data = FETCH_BLOG_DATA.call('blog.txt')
		count = 0
		raw_blog_data.each do |data| 
			my_blog = data.split('%$')
			if my_blog[0].eql?(blog_id)
				puts "\t\t Title : #{my_blog[1]}"
				puts "\t\t Description \n#{my_blog[2]}"
				count += 1
			end
		end
		puts "There is no record of this #{blog_id} Id" if count == 0
	end

end


blog = Blog.new
blog.create_blog("Rvhit", "i am doing brhg project",'v@gmail.com')
# blog.search_blog('v97')
# blog.my_blog('v@gmail.com')
   # blog.store_blog(blog)
# puts blog.blog_desc
 # blog = Blog.new("titlevor","hsicnsiesiiiiiiiiiiiiiiijcoeeeeeeeeeeeeeeeeeeecieeeeeeeeeeeeeeeeeeeeeeeeeeejcsoooooooooooooooooooooooooooooooocjsspppppppppp",'va@gmail.com')
# blog.my_blog('va@gmai l.com')
 # blog.my_blog('rohti@gmail.com')
# blog.search_blog("va56")
arr = File.readlines('blog.txt')
# arr = FETCH_BLOG_DATA.call('blog.txt')
# 
# blog.all_blog
# puts blog.id
# blog.store_blog(blog)

# arr.each do |a|
# 	a1 = a.split
# 	puts "#{a1[0]}  #{a1[1]} #{a1[3]}"
# end
# email = 'rohti@gmail.com'
# arr = File.readlines('blog.txt')
# arr.each do |a| 
# 	a1 = a.split
# 	if a1[3].eql?(email)
# 		puts "#{a1[0]}  #{a1[1]} #{a1[3]}"
# 	end
# end
# id = gets.chomp
# arr.each do |a|
# 	a1 = a.split
# 	if a1[0].eql?(id)
# 		puts "#{a1[1]} #{a1[2]}"
# 	end
# end

