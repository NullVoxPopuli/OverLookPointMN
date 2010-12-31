class PollOptionsController < ApplicationController
  # GET /poll_options
  # GET /poll_options.xml
  def index
    @poll_options = PollOption.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @poll_options }
    end
  end

  # GET /poll_options/1
  # GET /poll_options/1.xml
  def show
    @poll_option = PollOption.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @poll_option }
    end
  end

  # GET /poll_options/new
  # GET /poll_options/new.xml
  def new
    @poll_option = PollOption.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @poll_option }
    end
  end

  # GET /poll_options/1/edit
  def edit
    @poll_option = PollOption.find(params[:id])
  end

  # POST /poll_options
  # POST /poll_options.xml
  def create
    @poll_option = PollOption.new(params[:poll_option])
    @poll_option.votes = 0

    respond_to do |format|
      if @poll_option.save
        format.html { redirect_back_or_default :controller => "polls", :action => :vote_first, :id => params[:poll_option][:poll_id]}
        format.xml  { render :xml => @poll_option, :status => :created, :location => @poll_option }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @poll_option.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /poll_options/1
  # PUT /poll_options/1.xml
  def update
    @poll_option = PollOption.find(params[:id])

    respond_to do |format|
      if @poll_option.update_attributes(params[:poll_option])
        format.html { redirect_to(@poll_option, :notice => 'PollOption was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @poll_option.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /poll_options/1
  # DELETE /poll_options/1.xml
  def destroy
    @poll_option = PollOption.find(params[:id])
    @poll_option.destroy

    respond_to do |format|
      format.html { redirect_to(poll_options_url) }
      format.xml  { head :ok }
    end
  end
end
