require "csv"
require './blog.rb'

class Csv < Blog

	#fetch the data of user blogs we want to export in csv
	def export_data(email)
	  
	  raw_blog_data = FETCH_BLOG_DATA.call('blog.txt')
	  export_data = []
	  raw_blog_data.each do |data|
	  blog = data.split('%$')
	 	 if blog[3].chomp!.eql?(email)
	 		 export_data << blog 
	 	 end
	  end
	  return export_data
	end

	def export_to_csv(email)
		headers = ["blog_id", "blog_title", "blog_content", "created_by"]
		data = export_data(email)

		CSV.open("my_blogs.csv", 'w') do |csv|
			csv << headers
			data.each do |row|
				csv << row
			end
		end
	end
end

