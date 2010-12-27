class InfoController < ApplicationController
  def home
    
  end
  
  def calendar
    
    
  end
  
  def map
    
  end
  
  def real_estate_agents
    @paid = User.find(:all, :conditions => "has_paid IS 't'")
    @unpaid = User.find(:all, :conditions => "has_paid IS NOT 't'")
  end
end
