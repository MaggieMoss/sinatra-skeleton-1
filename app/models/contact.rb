class Contact < ActiveRecord::Base
	belongs_to :user

	# method we can call on all instances of the Contact class.
	def full_name 
		"#{self.first_name} #{self.last_name}"
	end

	
end