class Admin::SitePrefsController < Admin::BaseController
  
  
  def index
    @users = User.all
    @services = Service.all
    @pages = LinkPage.all
    @menus = MenuBar.all
    
  end
  

end
