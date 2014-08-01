class Guide < ActiveRecord::Base
	# creates token for sharing before save
  include Tokenable

	# Associations
  has_many :places
  belongs_to :creator, class_name: "User"
  has_many :saved_guides

  accepts_nested_attributes_for :places

  # Methods
  def get_center_point
  	latitudes = self.places.pluck(:latitude)
  	longitudes = self.places.pluck(:longitude)
  	return [get_avg(latitudes), get_avg(longitudes)]
  end

  private

  def get_avg(num_arr)
  	num_arr.inject(:+)/num_arr.length
  end
end
