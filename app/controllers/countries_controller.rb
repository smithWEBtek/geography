class CountriesController < ApplicationController
	before_action :set_country, only: [:show, :edit, :update, :destroy]

	def index
		@countries = Country.all 
	end

	def show
	end

	def new
		@country = Country.new
	end

	def create
		@country = Country.new(country_params)
		if @country.save
			render :show
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @country.update(country_params)
			render :show
		else
			render :edit
		end
	end

	def destroy
		@country.delete
	end

	private
		def set_country
			@country = Country.find(params[:id])
		end

		def country_params
			require(:country).permit(:name)
		end
end
