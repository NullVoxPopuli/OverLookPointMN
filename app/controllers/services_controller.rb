class ServicesController < ApplicationController
  
    def search 
    if (params[:search].length > 0)
      conditions = ["(name like ? or description like ?)",
        "%#{params[:search]}%", "%#{params[:search]}%"]
    end

    respond_to do |format|
      format.html {
        @services = Service.all(:conditions => conditions)
      }
    end
  end
  
  
end