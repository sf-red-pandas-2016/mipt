class Student < ApplicationRecord
  belongs_to :course
  has_one :teacher, through: :course

	def self.to_csv
		p "inside to_csv"
  		attributes %w{id first_name last_name}
  		
  		CSV.generate(headers: true) do |csv|
	  		csv << attributes

	  		all.each do |student|
	  			# csv << attributes.map {|attr| user.send(attr)}
	  			csv << ["animal", "count", "price"]
	  		end
  		end
	end

end
