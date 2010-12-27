class Admin::UsersController < BaseController
  
  def index
    @users = User.all
  end
  
  def edit
    @user = User.find(params[:id])
    @addresses = @user.addresses
    @services = @user.services
    
    
  end
  
  
  def update
    @user = User.find(params[:id]) # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to admin_users_path
    else
      render :action => :edit
    end
  end
end
