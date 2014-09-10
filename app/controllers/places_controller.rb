class PlacesController < ApplicationController
	before_action :set_place, only: [:show]

	def show
	end

	private

	def set_place
		@place = Place.find(params[:id])
	end
	
end