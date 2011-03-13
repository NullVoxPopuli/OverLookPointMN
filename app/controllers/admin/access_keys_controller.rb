class Admin::AccessKeysController < Admin::BaseController
  # GET /access_keys
  # GET /access_keys.xml
  def index
    @access_keys = AccessKey.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @access_keys }
    end
  end

  # GET /access_keys/1
  # GET /access_keys/1.xml
  def show
    @access_key = AccessKey.find(params[:id])
    @user = User.find(@access_key.user_id)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @access_key }
    end
  end

  # GET /access_keys/new
  # GET /access_keys/new.xml
  def new
    @access_key = AccessKey.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @access_key }
    end
  end

  # GET /access_keys/1/edit
  def edit
    @access_key = AccessKey.find(params[:id])
    @user = User.find(@access_key.user_id)
  end

  # POST /access_keys
  # POST /access_keys.xml
  def create
    @access_key = AccessKey.new(params[:access_key])

    respond_to do |format|
      if @access_key.save
        flash[:notice] = 'access_key was successfully created.'
        format.html { redirect_to(:controller => :site_prefs, :action => :index) }
        format.xml  { render :xml => @access_key, :status => :created, :location => @access_key }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @access_key.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /access_keys/1
  # PUT /access_keys/1.xml
  def update
    @access_key = AccessKey.find(params[:id])

    respond_to do |format|
      if @access_key.update_attributes(params[:access_key])
        flash[:notice] = 'access_key was successfully updated.'
        format.html { redirect_to(@access_key) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @access_key.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /access_keys/1
  # DELETE /access_keys/1.xml
  def destroy
    @access_key = AccessKey.find(params[:id])
    @access_key.destroy

    respond_to do |format|
      format.html { redirect_to(:controller => :site_prefs, :action => :index) }
      format.xml  { head :ok }
    end
  end
  

end