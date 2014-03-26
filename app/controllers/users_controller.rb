class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  def new_fetcher
  @user = User.new
  end

  def create_fetcher
  	@user = User.new(user_params)
  	@user.role = 'fetcher'
  	@user.parent_id = current_user.id
    puts @user.parent_id
    @user.save
  	puts @user.errors.full_messages.first
  	redirect_to root_path, notice: 'fetcher was successfully created.' 
  end

  def fetcher
    @fetchers = current_user.childs
  end

  private

   # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password,:level_id)
    end
end

