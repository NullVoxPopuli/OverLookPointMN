class Admin::SitePrefsController < ApplicationController
  
    before_filter :authenticate

  
  def index
    @users = User.all
    @services = Service.all
    @pages = LinkPage.all
    @menus = MenuBar.all
    
  end
  
  
  protected
  
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "admin" && password == "adm!np4$$"
    end
  end

end
