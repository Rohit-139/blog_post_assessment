class Blog 
	attr_accessor :id, :blog_title, :blog_desc, :created_by
	def initialize(blog_title, blog_desc, created_by)
		#generate a unique id for blog 
		random_id = "#{created_by.split('@').first.concat(rand(100).to_s)}"
		@id = random_id 
		@blog_title = blog_title
		@blog_desc = blog_desc 
		@created_by = created_by
	end

	def store_blog(blog)
		file = File.open('blog.txt','a')
		file.puts("#{blog.id} #{blog.blog_title} #{blog_desc} #{blog.created_by}")
		file.close
	end

end

# blog = Blog.new("titlevor","hsicnsiesiiiiiiiiiiiiiiijcoeeeeeeeeeeeeeeeeeeecieeeeeeeeeeeeeeeeeeeeeeeeeeejcsoooooooooooooooooooooooooooooooocjsspppppppppp",'va@gmail.com')
# puts blog.id
# blog.store_blog(blog)
# arr = File.readlines('blog.txt')
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
