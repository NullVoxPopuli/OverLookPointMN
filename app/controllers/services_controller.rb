class ServicesController < ApplicationController
  
  def single_service_search 

    respond_to do |format|
      format.js do
        render :update do |p|
          @service = Service.find(params[:search])
          p.replace_html("actual_content", render(:partial => "/services/single_service_search", :object => @service))
        end
      end
    end
  end
  
  
end