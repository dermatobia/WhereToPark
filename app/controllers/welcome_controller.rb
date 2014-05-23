class WelcomeController < ApplicationController

	def index

	end

	def map_points
		locations = Location.limit(5)

		points = locations.map do |loc|
			[loc.latitude, loc.longitude]
		end

		render json: points
	end
end