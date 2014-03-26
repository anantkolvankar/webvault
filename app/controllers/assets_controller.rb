class AssetsController < ApplicationController
  before_filter :authenticate_user!  #authenticate for users before any methods is called  
  before_action :set_asset, only: [:show, :edit, :update, :destroy]

  # GET /assets
  # GET /assets.json
  def index
    @assets = current_user.assets.all
  end

  # GET /assets/1
  # GET /assets/1.json
  def show
  end

  # GET /assets/new
  def new
     @asset = current_user.assets.build      
    if params[:folder_id] #if we want to upload a file inside another folder  
     @current_folder = current_user.folders.find(params[:folder_id])  
     @asset.folder_id = @current_folder.id  
    end  
  end

  # GET /assets/1/edit
  def edit
  end

  # POST /assets
  # POST /assets.json
  def create
@asset = current_user.assets.build(asset_params)  
  if @asset.save  
   flash[:notice] = "Successfully uploaded the file."  
  
   if @asset.folder #checking if we have a parent folder for this file  
     redirect_to browse_path(@asset.folder)  #then we redirect to the parent folder  
   else  
     redirect_to root_url  
   end        
  else  
   render :action => 'new'  
  end  
  end

  # PATCH/PUT /assets/1
  # PATCH/PUT /assets/1.json
  def update
    respond_to do |format|
      if @asset.update(asset_params)
        format.html { redirect_to @asset, notice: 'Asset was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assets/1
  # DELETE /assets/1.json
  def destroy
    @asset.destroy
    respond_to do |format|
      format.html { redirect_to assets_url }
      format.json { head :no_content }
    end
  end

  #this action will let the users download the files (after a simple authorization check)  
  def get  
   asset = current_user.assets.find_by_id(params[:id])  
   if asset  
       send_file asset.upload_file.path, :type => asset.upload_file_content_type  
    else  
      flash[:notice] = "Don't be cheeky! Mind your own assets!"  
      redirect_to assets_path ,flash: { notice: "Don't be cheeky! Mind your own assets!" }
   end  
  end  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asset
      @asset = current_user.assets.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def asset_params
      params.require(:asset).permit(:user_id, :upload_file, :folder_id)
    end
end