class InfoController < ApplicationController
  def home
    
  end
  
  def calendar
    
    
  end
  
  def map
    
  end
  
  def real_estate_agents
    @paid = User.find(:all, :conditions => "has_paid = 't'")
    @unpaid = User.find(:all, :conditions => "has_paid != 't'")
  end
  
  def search_paid_and_unpaid
    search = params[:search]
    conditions = "real_name LIKE '%#{search}%' OR login LIKE '%#{search}%' OR email LIKE '%#{search}%'"
    @paid = User.find(:all, :conditions => "has_paid = 't' AND (#{conditions})")
    @unpaid = User.find(:all, :conditions => "has_paid != 't' AND (#{conditions})")
    
    respond_to do |format|
      format.js do
        render :update do |p|
          p.replace_html("real_estate_content", :partial => "/info/real_estate_search")
        end
      end
    end
  end
end
