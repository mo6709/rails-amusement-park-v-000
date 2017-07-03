class RidesController < ApplicationController
	def new
		user = User.find_by(:id => params[:user_id])
		attraction = Attraction.find_by(:id => params[:attraction_id])
		ride = Ride.create(user: user, attraction: attraction)
        flash[:notice] = ride.take_ride
        redirect_to user_path(session[:user_id])
	end
end