class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]
  
  def new
    @user = User.new
    
    ip_is_blocked = false
    
    blocked_people = User.find(:all, :conditions => ["is_not_allowed_to_login = 't'"])
    blocked_people.each do |bp|
      
      ip_is_blocked = (bp.last_login_ip == request.remote_ip || bp.current_login_ip == request.remote_ip)
    end
    
    if ip_is_blocked
      redirect_to(:controller => :errors, :action => :ip_blocked)
    end
  end
  
  def create
    @user = User.new(params[:user])
    @user.membership = User::NOT_MEMBER
    if @user.save
      flash[:notice] = "Account registered!"
      redirect_back_or_default account_url
    else
      render :action => :new
    end
  end
  
  def show
    @user = @current_user
    @addresses = @current_user.addresses
    @services = @current_user.services
  end

  def edit
    @user = @current_user
    @addresses = @current_user.addresses
    @services = @current_user.services
  end
  
  def update
    @user = @current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to account_url
    else
      render :action => :edit
    end
  end
  
  def add_service_to_user
    @user = User.find(params[:user_id])
    @user.services << Service.find(params[:services])
    if @user.save
      flash[:notice] = "Service added"
    else
      flash[:notice] = "Service failed to be added"
    end
    redirect_to account_url
  end
  
  def get_access
    @user = User.find(params[:user_id])
  end
    
  def validate_access
    code = AccessKey.find_by_access_code(params[:access_code])
    user = User.find(params[:user])
    if user
     if code and code.expiration > Date.today
        user.membership = User::MEMBER_BASIC
        user.save
        @message = "Congratulations, you are now a 
                        basic member and have access to the entire site!"
      else
        @message =  "Authentication failed, or your code has expired."
      end
    else
      @message = "Authentication failed"
    end
  end
end