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
  	@message = 'Fetcher was successfully created.'
     if @user.errors.full_messages.first
        @message = @user.errors.full_messages.first
     end
  	redirect_to root_path, notice:  @message
  end

  def fetcher
    @fetchers = current_user.childs.where('level_id IS NOT NULL')
    puts @fetchers
  end

  def new_admin
   @user = User.new
  end

  def create_admin
   create_user_with_role(user_params,'admin')
  end

  def create_user_with_role(user_form_fields,role)
    @user = User.new(user_form_fields)
    @user.role = role
    @user.parent_id = current_user.id
    puts @user.parent_id
    @user.save
    @message = role.capitalize+' was successfully created.'
     if @user.errors.full_messages.first
        @message = @user.errors.full_messages.first
     end
    redirect_to root_path, notice:  @message
  end

  private

   # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password,:level_id)
    end
end

