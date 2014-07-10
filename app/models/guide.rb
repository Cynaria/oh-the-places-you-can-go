class Guide < ActiveRecord::Base
	# creates token for sharing before save
  include Tokenable

	# Associations
  has_many :places
  belongs_to :creator, class_name: "User"
  has_many :saved_guides

end
