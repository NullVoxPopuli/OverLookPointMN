class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy
  
  def new
    @user_session = UserSession.new
  end
  
  def create
    user  = User.find_by_login(params[:user_session][:login])
    if user and user.is_not_allowed_to_login?
      flash[:notice] = "You are not allowed to login in. Reason: #{user.locked_reason}"
      redirect_back_or_default root_path
    else
      @user_session = UserSession.new(params[:user_session])

      if @user_session.save
        flash[:notice] = "Login successful!"
        redirect_back_or_default account_url
      else
        render :action => :new
      end
    end
  end
  
  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_back_or_default new_user_session_url
  end
end