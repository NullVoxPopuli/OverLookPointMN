class SiteAdmin::AdminController < ApplicationController
  def index
    @users = User.all
    @services = Service.all
    
  end
  

end
