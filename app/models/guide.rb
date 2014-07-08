class Guide < ActiveRecord::Base
	# creates token for sharing before save
  include Tokenable

	# Associations
  belongs_to :creator, class_name: "User"

end