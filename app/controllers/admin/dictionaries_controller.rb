class Admin::DictionariesController < ApplicationController
  # GET /admin_dictionaries
  # GET /admin_dictionaries.xml
  def index
    @dictionaries = Dictionary.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @admin_dictionaries }
    end
  end

  # GET /admin_dictionaries/1
  # GET /admin_dictionaries/1.xml
  def show
    @dictionary = Dictionary.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @dictionary }
    end
  end

  # GET /admin_dictionaries/new
  # GET /admin_dictionaries/new.xml
  def new
    @dictionary = Dictionary.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @dictionary }
    end
  end

  # GET /admin_dictionaries/1/edit
  def edit
    @dictionary = Dictionary.find(params[:id])
  end

  # POST /admin_dictionaries
  # POST /admin_dictionaries.xml
  def create
    @dictionary = Dictionary.new(params[:dictionary])
    
    @old = Dictionary.find(:all, :conditions => ["key = ?", @dictionary.key])
    if @old then @old.destroy end
    
    @dictionary.save!
    redirect_to(:controller => "admin/site_prefs", :action => :index)
        
  end

  # PUT /admin_dictionaries/1
  # PUT /admin_dictionaries/1.xml
  def update
    @dictionary = Dictionary.find(params[:dictionary][:id])
      
     @dictionary.update_attributes(params[:dictionary])
     
     redirect_to(:controller => "admin/site_prefs", :action => :index)
      
  end

  # DELETE /admin_dictionaries/1
  # DELETE /admin_dictionaries/1.xml
  def destroy
    @dictionary = Dictionary.find(params[:id])
    @dictionary.destroy

    respond_to do |format|
      format.html { redirect_to(:controller => "admin/site_prefs", :action => :index) }
      format.xml  { head :ok }
    end
  end
  
  def change_password
    pass = Dictionary.find_by_key(Dictionary::ADMIN_KEY)
    if pass
      @dictionary = pass
    else 
      @dictionary = Dictionary.new
      @dictionary.key = Dictionary::ADMIN_KEY      
    end
  end
  
  def site_settings
    @pass = Dictionary.find_by_key(Dictionary::ADMIN_KEY)
    if !@pass
      @pass = Dictionary.new
      @pass.key = Dictionary::ADMIN_KEY      
    end
    
    @site_title = Dictionary.find_by_key(Dictionary::SITE_TITLE_KEY)
    if !@site_title
      @site_title = Dictionary.new
      @site_title.key = Dictionary::SITE_TITLE_KEY
    end
    
    @tag_line = Dictionary.find_by_key(Dictionary::TAG_LINE_KEY)
    if !@tag_line
      @tag_line = Dictionary.new
      @tag_line.key = Dictionary::TAG_LINE_KEY
    end
    
    @pass.save!
    @tag_line.save!
    @site_title.save!
  end
end
