class Admin::UsersController < Admin::BaseController
  
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
  
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(:controller => :site_prefs, :action => :index) }
      format.xml  { head :ok }
    end
  end
  
end
