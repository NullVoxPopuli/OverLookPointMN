class InfoController < ApplicationController
  def home
    @page = LinkPage.find_by_name("Home")
  end
  
  def calendar
    
    
  end
  
  def map
    
  end
  
  def real_estate_agents

    if (current_user.membership == User::NOT_MEMBER) 
      redirect_to :controller => :users, :action => :get_access, :id => 0, :user_id => current_user.id
    else  
      @paid = User.find(:all, :conditions => "has_paid = 't'")
      @unpaid = User.find(:all, :conditions => "has_paid != 't'")
    end            
  end
  
  def search_paid_and_unpaid
    search = params[:search]
    conditions = "real_name LIKE '%#{search}%' OR login LIKE '%#{search}%' OR email LIKE '%#{search}%'"
    address_conditions = "addresses.number LIKE '%#{search}%' OR addresses.street LIKE '%#{search}%' OR addresses.city LIKE '%#{search}%' OR addresses.state LIKE '%#{search}%' OR addresses.zip_code LIKE '%#{search}%'" 
    conditions = conditions + " OR " + address_conditions
    @paid = User.find(:all, :joins => :addresses, :conditions => "has_paid = 't' AND (#{conditions})")
    @unpaid = User.find(:all, :include => :addresses, :conditions => "has_paid != 't' AND (#{conditions})")
    
    respond_to do |format|
      format.js do
        render :update do |p|
          p.replace_html("real_estate_content", :partial => "/info/real_estate_search")
        end
      end
    end
  end
  
  def help
    @page = LinkPage.find_by_name("Help")
    
    respond_to do |format|
      format.js do
        render :update do |p|
          p.replace_html("actual_content", :partial => "/shared_elements/local_page", :object => @page)
        end
      end
    end
    
  end
end
