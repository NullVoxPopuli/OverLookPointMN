class AddressesController < ApplicationController
  def new    
    @address = Address.new
  end
  
  def create
    @address = Address.new(params[:address])
    @address.user_id = params[:user_id]
    if @address.save
      flash[:notice] = "Address was successfully added."
      redirect_to :controller => :users, :action => :show if request.uri =~ /address/
      redirect_to :controller => :polls, :action => :vote_first if request.uri =~ /poll/
    else
      flash[:notice] = "There was a problem with your address."
      render :action => :new
    end
  end
end
