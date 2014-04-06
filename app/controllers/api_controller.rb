class ApiController < ActionController::Base

def emergency
		
		@level = Level.find_by_name(params[:level])
		puts @level.class
		if !@level.nil?
			@level.occured=true
	        @file_path=@level.assets.last.upload_file.path
			#puts system("C:\Users\ADMIN\Downloads\Project\pscp.exe #{@file_path} Bluebell@127.0.0.1:/C:/Users/Bluebell/Desktop")
			@level.save
		elsif params[:level] == 'reset'
			Level.update_all(:occured => false)
			@level ="All Level are reset to default"
		else
			@level ="wrong level"
		end
		render :json => @level
	end
end