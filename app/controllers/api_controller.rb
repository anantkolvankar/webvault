class ApiController < ActionController::Base

def emergency
		@level=params[:level]
		
		if @level == "level1"
		@level=params[:level]
		
		elsif @level == "level2"
			@level=params[:level]
		
		elsif @level == "level3"
		@level=params[:level]
		else
			@level ="wrong level"
		end
		render :json => @level
	end
end