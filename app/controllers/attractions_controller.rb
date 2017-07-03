class AttractionsController < ApplicationController
	before_action :find_attraction, only: [:show, :edit, :update]

	def new
		@attraction = Attraction.new
	end

	def index
		@attractions = Attraction.all
	end

	def show
		# @attraction = Attraction.find_by(:id => params[:id])
	end
    
	def edit
		# @attraction = Attraction.find_by(:id => params[:id])
	end

	def create
        attraction = Attraction.find_or_create_by(attraction_params)
        redirect_to attraction_path(attraction.id)
	end

	def update
		# @attraction = Attraction.find_by(:id => params[:id])
		@attraction.update(attraction_params)
		render "edit" unless @attraction.valid?
		redirect_to attraction_path(@attraction.id)
	end

	private 

	def attraction_params
		params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
	end

	def find_attraction
		@attraction = Attraction.find_by(:id => params[:id])
	end
end