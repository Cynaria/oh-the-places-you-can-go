class Guide < ActiveRecord::Base
	
  # creates token for sharing before save
  include Tokenable

  # Validations
  validates :name, presence: true

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

  def self.find_guides_in_radius(location, radius)
    places_near_user = Place.find_places_in_radius(location, radius)
    places_near_user.map {|place| place.guide}.uniq
  end

  private

  def get_avg(num_arr)
  	(num_arr.inject(:+)) / num_arr.length
  end
end
