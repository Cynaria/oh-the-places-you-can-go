class HomeController < ApplicationController
	def index
		puts request.location.coordinates
	end
end