class HomeController < ApplicationController
  def index
  	 if user_signed_in?  
  	  if current_user.has_role? :superadmin
  	  	   #showing all the Users with role admin to superadmin only
  	       @admin_users = User.admins
  	  elsif current_user.has_role? :fetcher
  	  	if current_user.level.occured
  	  	  @assets = current_user.parent.assets.where(:level_id => current_user.level.id).where("folder_id is NULL").order("upload_file_file_name desc")
  	  	  @folders = current_user.parent.folders.roots 
  	  	 end
  	  else
  	  	puts "hello"
	  	   #load current_user's folders  
	       @folders = current_user.folders.roots 
	       #show only root files which has no "folder_id"  
	       @assets = current_user.assets.where("folder_id is NULL").order("upload_file_file_name desc")         
      end
    end 
  end

	#this action is for viewing folders  
	def browse  
	    #get the folders owned/created by the current_user 
	    if current_user.has_role? :fetcher
			@current_folder = current_user.parent.folders.find(params[:folder_id])    
	    else
	        @current_folder = current_user.folders.find(params[:folder_id])    
	    end

	    if @current_folder  
	    
	      #getting the folders which are inside this @current_folder  
	      @folders = @current_folder.children  
	    if current_user.has_role? :fetcher
	       #show only files under this current folder 
	      @assets = @current_folder.assets.where(:level_id => current_user.level.id).order("upload_file_file_name desc")
	    else
	      #show only files under this current folder 
	      @assets = @current_folder.assets.order("upload_file_file_name desc")  
	    end
	      render :action => "index"  
	    else  
	      flash[:error] = "Don't be cheeky! Mind your own folders!"  
	      redirect_to root_url  
	    end  
	end    

	
end