# We want our models to inherit from active record base so our model inherits
# all of the active record methods (.find(), .where())

class User < ActiveRecord::Base
	has_many :contacts
end