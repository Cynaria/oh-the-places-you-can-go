class HomeController < ApplicationController
	skip_before_filter :authenticate_user!
	def index
		p request.remote_ip
	end
end