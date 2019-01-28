
	class StatesController < ApplicationController
		before_action :set_state, only: [:show, :edit, :update, :destroy]
	
		def index
			@states = State.all 
		end
	
		def show
		end
	
		def new
			@state = State.new
		end
	
		def create
			@state = State.new(state_params)
			if @state.save
				render :show
			else
				render :new
			end
		end
	
		def edit
		end
	
		def update
			if @state.update(state_params)
				render :show
			else
				render :edit
			end
		end
	
		def destroy
			@state.delete
		end
	
		private
			def set_state
				@state = State.find(params[:id])
			end
	
			def state_params
				require(:state).permit(:name, :country_id, :abbr)
			end
	end
	