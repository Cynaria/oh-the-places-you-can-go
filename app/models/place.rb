class Place < ActiveRecord::Base
	
  # Validations
  validates :name, presence: true

  # Associations
  belongs_to :guide

  # geocode
  geocoded_by :address
	reverse_geocoded_by :latitude, :longitude
	after_validation :geocode, :reverse_geocode

	# methods
  def self.find_places_in_radius(location, radius)
    self.near(location, radius)
  end
end
