class PollsController < ApplicationController
  def show
    @poll = Poll.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @poll }
    end
  end
  
  def add_new_option_to_poll
    @poll = Poll.find(params[:id])

  end
  
  def vote_first
    @poll = Poll.find(params[:id])
  end
  
  def vote_second
    @poll = Poll.find(params[:id])
  end
  
  def select_vote
    poll_option = PollOption.find(params[:id])
    point_value = params[:point_value]
    po_votes = poll_option.votes;
    poll_option.votes = po_votes ? po_votes + point_value.to_i : point_value.to_i
    poll_option.save
    
    if point_value == "1" # second vote, we are done
      flash[:notice] = "Thank you for voting!"
      redirect_to :action => :results, :id => params[:poll_id]
    elsif point_value == "2" # first vote, we need to vote for second place
      flash[:notice] = "1st place preference recorded"
      redirect_to :action => :vote_second, :id => params[:poll_id]
    end
    
  end
  
  def new_address_to_poll
    @poll = Poll.find(params[:id])
    @poll_option = PollOption.new
    @poll_option.build_address
  end
  
  def new_address_to_poll_and_vote
    @poll = Poll.find(params[:id])
    @poll_option = PollOption.new
    @poll_option.build_address
  end
  
  def results
    @poll = Poll.find(params[:id])
  end
end
