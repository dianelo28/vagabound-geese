class CitiesController < ApplicationController

	def show
		@city = City.friendly.find(params[:id])
		@posts = Post.where(city_id: @city).order("created_at DESC")
	end

end
